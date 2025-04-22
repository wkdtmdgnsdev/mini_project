package org.kosa.mini.member;

import java.util.List;

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
		
		if(dbMember.isUser_lock()) {
			throw new MemberLockedException("계정이 잠겨있습니다.");
		}
		
		if(!dbMember.matchPassword(passwd)) {
			addLoginFailCount(dbMember);
			throw new LoginFailedException("아이디 또는 비밀번호가 틀렸습니다.");
		}
	}

	private void addLoginFailCount(Member dbMember) {
		dbMember.addLoginFail();
		memberDAO.updateLoginFailCount(dbMember.getUserid(), dbMember.getLogin_fail());
		lockMember(dbMember);
	}

	private void lockMember(Member dbMember) {
		if(dbMember.isLimit()) {
			dbMember.isUserLock(true);
			memberDAO.lockMember(dbMember.getUserid());
			throw new MemberLockedException("5회 실패, 계정 잠금");
		}
	}

	public void unlockMemberByAdmin(List<String> userids) {
		for(String userid : userids) {
			memberDAO.unlockMemberByAdmin(userid);
		}
	}

	public int register(Member member) {
		return memberDAO.insert(member);
	}

	public Member findByUserid(String userid) {
		return memberDAO.findByUserid(userid);
	}

	public Member update(Member member) {
		memberDAO.update(member);
		return member;
	}

	public int delete(String userid) {
		int result = memberDAO.delete(userid);
		return result;
	}

}
