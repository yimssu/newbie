package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyDAO {
	
	//public List<ReplyVO> list(Integer sno) throws Exception; 
	
	public void create(ReplyVO vo) throws Exception;
	
	public Integer count(Integer sno) throws Exception;

	public void delete(Integer rno) throws Exception;
	
	public void update(ReplyVO vo) throws Exception;
	
	public Integer getTotal(Integer sno)throws Exception;
	
	public List<ReplyVO> listPage(Integer sno, Criteria cri) throws Exception;
	
}
