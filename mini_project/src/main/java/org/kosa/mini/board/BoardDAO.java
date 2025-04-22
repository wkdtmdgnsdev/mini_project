package org.kosa.mini.board;

import java.util.List;
import java.util.Map;

public interface BoardDAO {

	public List<Board> list(Map<String, Object> map);
	public int getTotalCount(Map<String, Object> map);

}
