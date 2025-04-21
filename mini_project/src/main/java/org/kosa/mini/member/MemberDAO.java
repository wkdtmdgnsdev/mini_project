package org.kosa.mini.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	public Member findByUserid(String userid);
}
