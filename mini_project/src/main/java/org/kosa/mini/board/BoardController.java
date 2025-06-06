package org.kosa.mini.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.kosa.mini.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("detail")
	public String detail(String bno, Model model, HttpSession session) {
		// null일수 있어서 null값을 가질수 있는 Wrapper Class 사용
		Boolean noViewCount = (Boolean)session.getAttribute("noViewCount");
		if(noViewCount == null || !noViewCount ) {
			boardService.addViewCount(bno);
		}
		session.setAttribute("noViewCount", false);
		
		Board board = boardService.readBoard(bno);
		model.addAttribute("board", board);
		
		return "board/detail";
	}
	
	@RequestMapping("updateForm")
	public String updateForm(String bno, Model model) {
		Board board = boardService.readBoard(bno);
		model.addAttribute("board", board);
		
		return "board/updateForm";
	}
	
	@RequestMapping("update")
	public String update(Board board, HttpSession session) {
		int result = boardService.modifyBoard(board);
		session.setAttribute("noViewCount", true);
		
		return "redirect:/board/detail?bno="+board.getBno();
	}
	
	@RequestMapping("delete")
	public String delete(String bno) {
		int result = boardService.delete(bno);
		
		return "redirect:/board/list";
	}
	
	@PostMapping("passwdCheck")
	@ResponseBody
	public Map<String, Object> passwdCheck(@RequestBody Board board) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		boolean succ = boardService.passwdCheck(String.valueOf(board.getBno()), board.getPasswd());
		result.put("succ", succ);
		
		return result;
	}
}
