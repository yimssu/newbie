package org.zerock.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.NewbieVO;

@Repository
public class NewbieDAOImpl implements NewbieDAO {

	@Inject
	SqlSessionTemplate sess;

	static final String namespace = "org.zerock.persistence.NewbieDAO"; 
	
	
	@Override
	public String getTime() {
		
		return sess.selectOne(namespace + ".getTime");
	}



	@Override
	public List<NewbieVO> getList(Criteria cri) {
	
		return sess.selectList(namespace + ".getList", cri);
	}



	@Override
	public Integer getTotal() {
		return sess.selectOne(namespace + ".getTotal");
		
	}



	@Override
	public void create(NewbieVO vo) {
		sess.insert(namespace + ".create", vo);
		
	}



	@Override
	public NewbieVO view(Integer sno) {
		
		return sess.selectOne(namespace + ".view", sno);
	}



	@Override
	public Integer listCount(Criteria cri) {
		
		return sess.selectOne(namespace + ".listCount", cri);
	}



	@Override
	public void delete(Integer sno) {
		sess.delete(namespace + ".delete", sno);
		
	}



	@Override
	public void modify(NewbieVO vo) {
		sess.update(namespace + ".modify", vo);
		
	}



	@Override
	public void addFile(String fname) throws Exception {
		sess.insert(namespace + ".addFile", fname);
		
	}



	@Override
	public List<String> fileList(Integer sno) throws Exception {
	
		
		return sess.selectList(namespace + ".fileList", sno);
	}



	@Override
	public void delAll(Integer sno) throws Exception {
		sess.delete(namespace + ".delAll", sno);
		
	}

	
	
}
