package trello.board.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trello.board.domain.BoardVO;
import trello.board.domain.Criteria;
import trello.board.mapper.BoardMapper;

@Service
public class BoardService {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
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
	public List<BoardVO> getList(Criteria cri){
		return mapper.getListWithPaging(cri);
	};
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
}
