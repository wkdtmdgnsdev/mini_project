package org.kosa.mini.board;

import lombok.Data;

@Data
public class Board {
	private int bno;// 게시물 번호 
	private String title;// 제목 
	private String content;// 내용 
	private String writer;// 작성자 
	private String passwd;// 게시물 비번 
	private String reg_date;// 작성일 
	private int view_count;// 보기 수 
}
