package trello.board.mapper;

import java.util.List;

import trello.board.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getList();
	public void insert(BoardVO board);
	public Integer insertSelectKey(BoardVO board);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int update(BoardVO board);
}
