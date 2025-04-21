package org.kosa.mini.member;

import org.kosa.mini.exception.LoginFailedException;
import org.kosa.mini.exception.MemberLockedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	public Member login(String userid, String passwd) {
		Member dbMember = memberDAO.findByUserid(userid);
		validateLogin(dbMember, passwd);
		return dbMember;
	}

	private void validateLogin(Member dbMember, String passwd) {
		if(dbMember == null)
			  throw new LoginFailedException("아이디 또는 비밀번호가 틀렸습니다.");
		
		if(!dbMember.matchPassword(passwd)) {
			dbMember.setLogin_fail(dbMember.getLogin_fail() +1);
			memberDAO.updateLoginFailCount(dbMember.getUserid(), dbMember.getLogin_fail());
			
			if(dbMember.getLogin_fail() == 5) {
				dbMember.setUser_lock(true);
				memberDAO.lockMember(dbMember.getUserid());
				throw new MemberLockedException("5회 실패, 계정 잠금");
			}
			
			throw new LoginFailedException("아이디 또는 비밀번호가 틀렸습니다.");
		}
	}

}
