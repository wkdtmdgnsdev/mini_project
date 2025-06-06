package org.kosa.mini.quiz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuizService {

	@Autowired
	QuizDAO quizDAO;

	public int register(List<Map<String, Object>> quizList) {
		int result = quizList.size();
		
		for (Map<String, Object> quizMap : quizList) {
	        Quiz quiz = new Quiz();
	        quiz.setQuestion((String) quizMap.get("question"));

	        List<String> options = (List<String>) quizMap.get("options");
	        quiz.setOption1(options.get(0));
	        quiz.setOption2(options.get(1));
	        quiz.setOption3(options.get(2));
	        quiz.setOption4(options.get(3));

	        int answerIndex = (int) quizMap.get("answerIndex"); // 1~4
	        quiz.setAnswer(String.valueOf(answerIndex)); // 보기 텍스트 저장

	        quizDAO.insertQuiz(quiz); // MyBatis 등록
	    }
		
		return result;
	}

	public  Map<String, Object> getRandomQuiz() {
		Quiz quiz = quizDAO.selectRandomQuiz();
		
		List<String> options = new ArrayList<>();
	    options.add(quiz.getOption1());
	    options.add(quiz.getOption2());
	    options.add(quiz.getOption3());
	    options.add(quiz.getOption4());
		
	    Map<String, Object> result = new HashMap<>();
	    result.put("question", quiz.getQuestion());
	    result.put("options", options);
	    result.put("answer", quiz.getAnswer());
	    
		return result;
	}
}
