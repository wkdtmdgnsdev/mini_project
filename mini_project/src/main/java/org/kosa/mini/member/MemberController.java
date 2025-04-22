package org.kosa.mini.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.kosa.mini.exception.LoginFailedException;
import org.kosa.mini.exception.MemberLockedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Object> login(HttpSession session, @RequestBody Member member) {
	    Map<String, Object> result = new HashMap<>();

	    try {
	        // 로그인 유효성 검사
	        if (!member.validateLogin()) {
	            return setErrorResponse(result, "아이디 또는 비밀번호를 입력해주세요");
	        }

	        // 로그인 처리
	        member = memberService.login(member.getUserid(), member.getPasswd());
	        if (member == null) {
	            return setErrorResponse(result, "아이디 또는 비밀번호가 잘못되었습니다");
	        }

	        // 로그인 성공 시 세션에 저장
	        session.setAttribute("member", member);
	        result.put("status", "ok");

	    } catch (LoginFailedException e) {
	        return setErrorResponse(result, e.getMessage());
	    } catch (MemberLockedException e) {
	        return setErrorResponse(result, e.getMessage());
	    } catch (Exception e) {
	    	e.printStackTrace();
	        return setErrorResponse(result, "알 수 없는 오류가 발생했습니다");
	    }

	    return result;
	}

	// 공통 에러 응답 설정 메서드
	private Map<String, Object> setErrorResponse(Map<String, Object> result, String errorMessage) {
	    result.put("errorMessage", errorMessage);
	    result.put("status", "error");
	    return result;
	}
	
	@RequestMapping("registerForm")
	public String registerForm() {
		return "member/registerForm";
	}
	
	@PostMapping("register")
	@ResponseBody
	public Map<String, Object> register(@RequestBody Member member) {
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println(member);
		//입력값 검증 
		if (!member.isValid()) {
			return setErrorResponse(result, "입력값 검증 오류가 발생 했습니다.");
		} else {
			memberService.register(member);
			result.put("status", "ok");
		}
		return result;
	}

}
