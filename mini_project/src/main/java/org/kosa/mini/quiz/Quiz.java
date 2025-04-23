package org.kosa.mini.quiz;

import lombok.Data;

@Data
public class Quiz {
    private int id;
    private String question;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String answer;
    
}
