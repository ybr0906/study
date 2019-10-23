package trello.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import trello.board.domain.Criteria;
import trello.board.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
				@Param("cri") Criteria cri,
				@Param("bno") Long bno
			);
}
