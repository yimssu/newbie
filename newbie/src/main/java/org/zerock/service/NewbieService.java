package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.NewbieVO;

public interface NewbieService {

	public List<NewbieVO> showList(Criteria cri) throws Exception;
	
	public Integer getTotal() throws Exception;
	
	public void register(NewbieVO vo) throws Exception;
	
	public NewbieVO view(Integer sno) throws Exception;
	
	public Integer listCount(Criteria cri) throws Exception;
	
	public void delete(Integer sno)throws Exception;
	
	public void modify(NewbieVO vo)throws Exception;
	
	
	
	public List<String> fileList(Integer sno) throws Exception;
	public void delFile(String fname) throws Exception;
	
}
