package org.kosa.mini.member;


import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	@NotBlank(message = "아이디는 필수입니다.")
	@Size(min = 8, message = "아이디는 최소 8자 이상이어야 합니다.")
	private String userid;
	
	@NotBlank(message = "비밀번호는 필수입니다.")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>]).{8,}$", 
     message = "비밀번호는 영문자, 숫자, 특수문자를 포함해 최소 8자 이상이어야 합니다.")
	private String passwd;
	
	@NotBlank(message = "이름은 필수입니다.")
	private String name;
	
	@Min(value = 1, message = "나이는 최소 1세 이상이어야 합니다.")
	@Max(value = 150, message = "나이는 최대 150세까지 가능합니다.")
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
}
