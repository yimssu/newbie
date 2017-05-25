package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	
	//public List<ReplyVO> listReply(Integer sno) throws Exception;
	
	public void addReply(ReplyVO vo) throws Exception;
	
	public Integer count(Integer sno) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public void update(ReplyVO vo) throws Exception;
	
	public Integer getTotal(Integer sno) throws Exception;
	
	public List<ReplyVO> listReplyPage(Integer sno,Criteria cri) throws Exception;

}
