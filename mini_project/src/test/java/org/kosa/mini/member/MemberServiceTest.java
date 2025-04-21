package org.kosa.mini.member;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class MemberServiceTest {
	
	@Mock
	private MemberDAO memberDAO;
	
	@InjectMocks
	private MemberService memberService;

	@Test
	public void 로그인_성공() {
		 String userid = "testuser";
        String passwd = "1234";

        Member request = new Member();
        request.setUserid(userid);
        request.setPasswd(passwd);

        Member dbMember = new Member();
        dbMember.setUserid(userid);
        dbMember.setPasswd(passwd);

        //  Stub(스텁) 방식
        // MemberDAO.findByUserid(userid) 를 호출하면,
        // 대신 dbMember 객체를 리턴
        // 실제 DB 조회를 하지 않고,
        // Mockito가 대신 dbMember 객체를 반환
        when(memberDAO.findByUserid(userid)).thenReturn(dbMember);

        Member result = memberService.login(request);

        assertEquals(userid, result.getUserid());
	}
	
	@Test(expected = LoginFailedException.class)
	public void 로그인_실패_비밀번호_틀림() {
	    Member request = new Member("testuser", "wrongpass");
	    Member dbMember = new Member("testuser", "1234");

	    when(memberDAO.findByUserid("testuser")).thenReturn(dbMember);

	    memberService.login(request);
	}

	@Test(expected = LoginFailedException.class)
	public void 로그인_실패_존재하지_않는_아이디() {
	    when(memberDAO.findByUserid("no_user")).thenReturn(null);

	    memberService.login(new Member("no_user", "1234"));
	}


	@Test(expected = MemberLockedException.class)
	public void 로그인_5회_실패_시_잠금처리() {
	    Member request = new Member("testuser", "wrongpass");
	    Member dbMember = new Member("testuser", "1234");
	    dbMember.setLoginFailCount(4);
	
	    when(memberDAO.findByUserid("testuser")).thenReturn(dbMember);
	
	    try {
	        memberService.login(request);
	    } finally {
	        verify(memberDAO).updateLoginFailCount("testuser", 5);
	        verify(memberDAO).lockMember("testuser");
	    }
	}
	
	@Test(expected = MemberLockedException.class)
	public void 로그인_실패_잠긴_계정() {
	    Member request = new Member("lockedUser", "1234");
	    Member dbMember = new Member("lockedUser", "1234");
	    dbMember.setLocked(true);
	
	    when(memberDAO.findByUserid("lockedUser")).thenReturn(dbMember);
	
	    memberService.login(request);
	}
	
}
