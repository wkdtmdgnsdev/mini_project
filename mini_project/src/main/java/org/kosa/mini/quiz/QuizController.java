package org.kosa.mini.quiz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/quiz")
public class QuizController {

	@Autowired
	QuizService quizService;
	
	@RequestMapping("/registerForm")
	public String registerForm() {
		return "quiz/registerForm";
	}
	
	@PostMapping("/register")
	@ResponseBody
	public String bulkRegister(@RequestBody List<Map<String, Object>> quizList) {
		int result = quizService.register(quizList);
	   
	    return "총 " + result + "개의 퀴즈가 등록되었습니다.";
	}
}
