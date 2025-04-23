package org.kosa.mini.quiz;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuizDAO {
	
	public int insertQuiz(Quiz quiz);
	
}
