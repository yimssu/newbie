package org.zerock.web;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.NewbieVO;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.NewbieDAO;
import org.zerock.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class NewbieDAOTests {

	private static Logger logger = Logger.getLogger(NewbieDAOTests.class);

	@Inject
	NewbieDAO dao;
	@Inject
	ReplyDAO dao2;

	@Test
	public void getTime() {
		logger.info(dao.getTime());

	}

	@Test
	public void getListTest() {

		Criteria cri = new Criteria();
		// dao.getList(cri);

		logger.info(dao.getList(cri));
	}

	@Test
	public void getTotalTest() {

		dao.getTotal();

	}

	@Test
	public void registerTest() {
		NewbieVO vo = new NewbieVO();
		vo.setTitle("성공");
		vo.setContent("성공");
		vo.setWriter("성공");

		dao.create(vo);

	}
	
	@Test
	public void deleteTest() throws Exception {
		Integer sno = 2132;
		dao.delAll(sno);
		dao.delete(sno);
		
	}

	/*
	 * @Test public void listTest() throws Exception{ Integer sno = 2098;
	 * 
	 * logger.info(dao2.list(sno)); }
	 */

	@Test
	public void replyDeleteTest() throws Exception {
		Integer rno = 50;
		dao2.delete(rno);
	}

	@Test
	public void getTotalTest2() throws Exception {
		Integer sno = 2098;
		dao2.getTotal(sno);

	}

	@Test
	public void replyRegisterTest() throws Exception {

		ReplyVO vo2 = new ReplyVO();
		vo2.setSno(2102);
		vo2.setReplytext("ㄷ릉거ㅏㄱ");
		vo2.setReplyer("왜안바껴1");

		dao2.create(vo2);

	}

	@Test
	public void replyListTest() throws Exception{
		
		
		Criteria cri = new Criteria();
		Integer sno = 2102;
		
		logger.info(dao2.listPage(sno, cri));
	
	}
	
	
	@Test
	public void fileList() throws Exception{
		Integer sno = 2125;
		
		logger.info(dao.fileList(sno));
	
	}
	
	
	
}
