package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO dao;
	
	/*@Override
	public List<ReplyVO> listReply(Integer sno) throws Exception {
			
		return dao.list(sno);
	}*/

	@Override
	public void addReply(ReplyVO vo) throws Exception {
		
		dao.create(vo);
	}

	@Override
	public Integer count(Integer sno) throws Exception {
		
		return dao.count(sno);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		
		dao.delete(rno);
		
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		
		dao.update(vo);
	
		
	}

	@Override
	public Integer getTotal(Integer sno) throws Exception {
		
		return dao.getTotal(sno);
	}

	@Override
	public List<ReplyVO> listReplyPage(Integer sno,Criteria cri) throws Exception {
		
		return dao.listPage(sno, cri);
	}

}
