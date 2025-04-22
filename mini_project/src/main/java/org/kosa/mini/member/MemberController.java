package org.kosa.mini.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.kosa.mini.exception.LoginFailedException;
import org.kosa.mini.exception.MemberLockedException;
import org.kosa.mini.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		//입력값 검증 
		if (!member.isValid()) {
			return setErrorResponse(result, "입력값 검증 오류가 발생 했습니다.");
		} else {
			memberService.register(member);
			result.put("status", "ok");
		}
		return result;
	}
	
	@PostMapping("/isExistUserId")
	@ResponseBody
	public Map<String, Object> isExistUserId(@RequestBody Member member) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("existUserId", null != 
				memberService.findByUserid(member.getUserid()));
		
		return map;
	}
	
	@RequestMapping("detail")
	public String detailView(Model model, String userid) {
		Member member = memberService.findByUserid(userid);
		if (member == null) {
			return "redirect:/";
		}
		
		model.addAttribute("member", member);
		
		return "member/detail";
	}
	
	@RequestMapping("updateForm")
	public String updateForm(HttpSession session, Model model) {
		//세션에서 멤버 정보를 얻는다 -> 목적 : userid를 얻는다 
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/";
		}
		
		//멤버 userid를 이용하여 멤버의 상세정보를 얻는다
		Member memberInfo = memberService.findByUserid(member.getUserid());
		if (memberInfo == null) {
			return "redirect:/";
		}
		
		model.addAttribute("memberInfo", memberInfo);
		
		return "member/updateForm";
	}
	
	@RequestMapping("update")
	public String update(HttpSession session, Model model, Member member) {
		Member memberInfo = memberService.update(member);
		if (memberInfo == null) {
			return "redirect:/";
		}
		session.setAttribute("member", memberInfo);
		model.addAttribute("memberInfo", memberInfo);
		
		return "redirect:/member/detail?userid=" +memberInfo.getUserid();
	}
	
	@RequestMapping("delete")
	public String delete(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		memberService.delete(member.getUserid());
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/list")
	public String list(Model model, String pageNo, String size, String searchValue) {
		model.addAttribute("pageResponse", memberService.list(searchValue, Util.parseInt(pageNo, 1), Util.parseInt(size, 10)));
		
		return "member/list";
	}
}
