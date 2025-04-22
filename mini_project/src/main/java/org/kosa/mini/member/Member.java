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
	
	public boolean matchPassword(String password) {
        return this.passwd.equals(password);
    }
	
	 public static Member login(String userid, String passwd) {
	        return new Member(userid, passwd);
	  }

	public Member(String userid, String passwd) {
		super();
		this.userid = userid;
		this.passwd = passwd;
	}
	
	public void addLoginFail() {
		this.login_fail++;
	}
	
	
	public boolean isLimit() {
        return this.login_fail == 5;
    }
	
	public void isUserLock(boolean user_lock) {
        this.user_lock = user_lock;
    }
	
	public boolean validateLogin() {
		 return userid != null && !userid.isEmpty() && passwd != null && !passwd.isEmpty();
	}

	public Member(String userid, String passwd, String name, int age) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.age = age;
	}
	
	public static Member join(String userid, String passwd, String name, int age) {
        return new Member(userid, passwd, name, age);
  }

	public boolean isValid() {
		if (userid == null || userid.length() == 0) return false;
		if (passwd == null || passwd.length() == 0) return false;
		if (name == null || name.length() == 0) return false;
		return true;
	}
}
