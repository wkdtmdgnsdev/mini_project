package org.kosa.mini.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberDAO {
	public Member findByUserid(String userid);
	public void updateLoginFailCount(@Param("userid") String userid, @Param("login_fail") int login_fail);
	public void lockMember(String userid);
	public void unlockMemberByAdmin(String userid);
	public int insert(Member member);
	public int update(Member member);
	public int delete(@Param("userid") String userid);
	public List<Member> list(Map<String, Object> map);
	public int getTotalCount(Map<String, Object> map);
}
