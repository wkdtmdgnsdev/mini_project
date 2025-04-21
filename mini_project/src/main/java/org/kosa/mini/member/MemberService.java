package org.kosa.mini.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	public Member login(Member member) {
		return memberDAO.findByUserid(member.getUserid());
	}

}
