package org.kosa.mini.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BoardDAO {

	public List<Board> list(Map<String, Object> map);
	public int getTotalCount(Map<String, Object> map);
	public int insert(Board board);
	public Board selectOne(@Param("bno") String bno);
	public int update(Board board);
	public int updateViewCount(@Param("bno") String bno);

}
