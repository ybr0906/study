package trello.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trello.board.domain.BoardVO;
import trello.board.mapper.BoardMapper;

@Service
public class BoardService {
	@Autowired
	private BoardMapper mapper;
	
	public void register(BoardVO board) {
		mapper.insertSelectKey(board);
	};
	public BoardVO get(Long bno) {
		return mapper.read(bno);
	};
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	};
	public boolean remove(Long bno) {
		return mapper.delete(bno) == 1;
	};
	public List<BoardVO> getList(){
		return mapper.getList();
	};
}
