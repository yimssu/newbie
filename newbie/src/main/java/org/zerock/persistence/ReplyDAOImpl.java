package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	SqlSessionTemplate sess;
	
	private static String namespace = "org.zerock.persistence.ReplyDAO";
			
	/*@Override
	public List<ReplyVO> list(Integer sno) throws Exception {
		
		return sess.selectList(namespace + ".list", sno);
	}*/

	@Override
	public void create(ReplyVO vo) throws Exception {
		sess.insert(namespace + ".create", vo);
		
	}

	@Override
	public Integer count(Integer sno) throws Exception {
		
		return sess.selectOne(namespace + ".count", sno);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		sess.delete(namespace + ".delete", rno);
		
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sess.update(namespace + ".update", vo);
		
	}

	@Override
	public Integer getTotal(Integer sno) throws Exception {
		
		return sess.selectOne(namespace + ".getReplyTotal", sno);
	}

	@Override
	public List<ReplyVO> listPage(Integer sno,Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("sno", sno);
		paramMap.put("cri", cri);
		
		return sess.selectList(namespace + ".listpage", paramMap);
	
	}

}
