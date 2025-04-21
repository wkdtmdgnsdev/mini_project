package org.kosa.mini.member;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberDAO {
	public Member findByUserid(String userid);
	public void updateLoginFailCount(@Param("userid") String userid, @Param("login_fail") int login_fail);
	public void lockMember(String userid);
}
