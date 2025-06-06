package org.kosa.mini.board;

import java.util.HashMap;
import java.util.Map;

import org.kosa.mini.page.PageResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	BoardDAO boardDAO;

	public PageResponseVO<Board> list(String searchValue, int pageNo, int size) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pageNo-1) * size + 1);
		map.put("end", pageNo * size);
		map.put("searchValue", searchValue);
		
		return new PageResponseVO<Board>(pageNo
				, boardDAO.list(map)
				, boardDAO.getTotalCount(map)
				, size); 
	}

	public void writer(Board board) {
		boardDAO.insert(board);
	}

	public Board readBoard(String bno) {
		Board board = boardDAO.selectOne(bno);
		return board;
	}

	public int modifyBoard(Board board) {
		int result = boardDAO.update(board);
		return result;
	}
	
	public int addViewCount(String bno) {
		int result = boardDAO.updateViewCount(bno);
		return result;
	}

	public int delete(String bno) {
		int result = boardDAO.delete(bno);
		return result;
	}

	public boolean passwdCheck(String bno, String passwd) {
		boolean result = false;
		Board board = boardDAO.selectOne(bno);
		
		if(board.matchPasswd(passwd)) {
			result = true;
		}
		
		return result;
	}

}
