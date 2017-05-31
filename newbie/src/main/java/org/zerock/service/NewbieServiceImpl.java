package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.NewbieVO;
import org.zerock.persistence.NewbieDAO;

@Repository
public class NewbieServiceImpl implements NewbieService {
	
	private static final Logger log = Logger.getLogger(NewbieServiceImpl.class);

	@Inject
	NewbieDAO dao;
	
	@Override
	public List<NewbieVO> showList(Criteria cri) throws Exception{

		return dao.getList(cri);
	}

	@Override
	public Integer getTotal() throws Exception{
		return dao.getTotal();
	}

	@Override
	@Transactional
	public void register(NewbieVO vo) throws Exception{
		dao.create(vo);
		
		String[] files = vo.getFiles();
		
		if(files == null){return;}
		
		for(String thumbName : files){
			
			String fileName = thumbName.replace("_s_", "_");
			
			dao.addFile(fileName);
		}
		
	}

	@Override
	public NewbieVO view(Integer sno) throws Exception{
		
		return dao.view(sno);
	}

	@Override
	public Integer listCount(Criteria cri) throws Exception{
		
		return dao.listCount(cri);
	}

	@Override
	@Transactional
	public void delete(Integer sno) throws Exception {
		dao.delAll(sno);
		dao.delete(sno);
		
		
		
	}

	@Override
	@Transactional
	public void modify(NewbieVO vo) throws Exception {
		dao.modify(vo);
		
		Integer sno = vo.getSno();
		
		String[] files = vo.getFiles();
		
		if(files == null){return;}
		
		for(String fname : files){
			
			String fileName = fname.replace("_s_", "_");
			
			dao.attFile(fileName, sno);
			
			}
	}

	@Override
	public List<String> fileList(Integer sno) throws Exception {
	
		return dao.fileList(sno);
	}

	@Override
	public void delFile(String fname) throws Exception {
		dao.delFile(fname);
		
	}


}
