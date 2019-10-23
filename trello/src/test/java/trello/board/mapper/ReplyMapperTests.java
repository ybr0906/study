package trello.board.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import trello.board.domain.Criteria;
import trello.board.domain.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReplyMapperTests {
	
	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ReplyMapper mapper;
	
	private Long[] bnoArr = {27961L, 27900L, 27899L, 27898L, 27897L};
	
	/*
	 * @Test public void testCreate() { IntStream.rangeClosed(1, 10).forEach(i->{
	 * ReplyVO vo = new ReplyVO();
	 * 
	 * //게시물번호 vo.setBno(bnoArr[i % 5]); vo.setReply("댓글 테스트 " + i);
	 * vo.setReplyer("replyer" + i);
	 * 
	 * mapper.insert(vo); }); }
	 */
	
	/*
	 * @Test public void testRead() { Long targetRno = 22L; ReplyVO vo =
	 * mapper.read(targetRno); log.info("read:"+vo); }
	 */
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info("reply :"+reply));
	}
	
}
