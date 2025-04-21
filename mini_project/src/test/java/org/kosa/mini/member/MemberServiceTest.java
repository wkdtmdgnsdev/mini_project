package org.kosa.mini.member;

import static org.junit.Assert.*;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosa.mini.exception.LoginFailedException;
import org.kosa.mini.exception.MemberLockedException;
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

        Member request = Member.login(userid, passwd);

        Member dbMember = Member.login(userid, passwd);

        //  Stub(스텁) 방식
        // MemberDAO.findByUserid(userid) 를 호출하면,
        // 대신 dbMember 객체를 리턴
        // 실제 DB 조회를 하지 않고,
        // Mockito가 대신 dbMember 객체를 반환
        when(memberDAO.findByUserid(userid)).thenReturn(dbMember);

        Member result = memberService.login(userid, passwd);

        assertEquals(userid, result.getUserid());
	}
	
	@Test(expected = LoginFailedException.class)
	public void 로그인_실패_비밀번호_틀림() {
	    Member request = Member.login("testuser", "wrongpass");
	    Member dbMember = Member.login("testuser", "1234");

	    when(memberDAO.findByUserid("testuser")).thenReturn(dbMember);

	    memberService.login(request.getUserid(), request.getPasswd());
	}

	@Test(expected = LoginFailedException.class)
	public void 로그인_실패_존재하지_않는_아이디() {
	    when(memberDAO.findByUserid("no_user")).thenReturn(null);

	    memberService.login("no_user", "1234");
	}


	@Test(expected = MemberLockedException.class)
	public void 로그인_5회_실패_시_잠금처리() {
	    String userid = "testuser";
	    String passwd = "wrongpass";
	    Member dbMember = Member.login(userid, "1234");
	    dbMember.setLogin_fail(4);  // 로그인 실패 횟수 설정

	    // DB에서 해당 사용자를 찾을 때 dbMember 반환
	    when(memberDAO.findByUserid(userid)).thenReturn(dbMember);

	    try {
	        // 로그인 시 userid와 passwd를 전달
	        memberService.login(userid, passwd);
	    } finally {
	        // 로그인 실패 횟수와 계정 잠금 처리 검증
	        verify(memberDAO).updateLoginFailCount(userid, 5);
	        verify(memberDAO).lockMember(userid);
	    }
	}

	@Test(expected = MemberLockedException.class)
	public void 로그인_실패_잠긴_계정() {
	    String userid = "lockedUser";
	    String passwd = "1234";
	    Member dbMember = Member.login(userid, passwd);
	    dbMember.isUserLock(true);  // 계정 잠금 처리

	    // DB에서 해당 사용자를 찾을 때 dbMember 반환
	    when(memberDAO.findByUserid(userid)).thenReturn(dbMember);

	    // 잠긴 계정으로 로그인 시도 시 예외 발생
	    memberService.login(userid, passwd);
	}
	
}
