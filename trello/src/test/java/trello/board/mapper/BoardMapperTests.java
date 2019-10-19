package trello.board.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import trello.board.domain.BoardVO;
import trello.board.domain.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardMapperTests {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setType("TC");
		cri.setKeyword("새로");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board->log.info("board"+board));
	}
}
