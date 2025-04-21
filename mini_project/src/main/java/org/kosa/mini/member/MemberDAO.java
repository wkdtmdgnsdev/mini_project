package org.kosa.mini.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	public Member findByUserid(String userid);
	public void updateLoginFailCount(String userid, int failCount);
	public void lockMember(String userid);
}
