package org.kosa.mini.board;

import org.kosa.mini.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/list")
	public String list(Model model, String pageNo, String size, String searchValue) {
		model.addAttribute("pageResponse", boardService.list(searchValue, Util.parseInt(pageNo, 1), Util.parseInt(size, 10)));
		
		return "board/list";
	}
	
	@RequestMapping("registerForm")
	public String registerForm() {
		return "board/registerForm";
	}
	
	@RequestMapping("register")
	public String register(Board board) {
		if(board == null) {
			return "board/list";
		}
		
		boardService.writer(board);
		
		return "redirect:/board/list";
	}
}
