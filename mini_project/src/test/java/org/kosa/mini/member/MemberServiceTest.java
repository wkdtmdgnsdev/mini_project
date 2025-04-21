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

}
