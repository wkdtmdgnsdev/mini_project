package org.kosa.mini.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private String userid;
	private String passwd;
	private String name;
	private int age;
	private int login_fail;
	private boolean user_lock;
	private boolean is_admin;
}
