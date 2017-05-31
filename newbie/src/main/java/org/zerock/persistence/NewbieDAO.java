package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.NewbieVO;

public interface NewbieDAO {
	
	public String getTime();

	public List<NewbieVO> getList(Criteria cri); 
	
	public Integer getTotal();
	
	public void create(NewbieVO vo);
	
	public NewbieVO view(Integer sno);
	
	public Integer listCount(Criteria cri);
	
	public void delete(Integer sno);
	
	public void modify(NewbieVO vo);
	
	
	//파일업로드
	public void addFile(String fname) throws Exception;
	
	public List<String> fileList(Integer sno) throws Exception;
	
	public void delAll(Integer sno) throws Exception;
	
	public void delFile(String fname) throws Exception;
	
	public void attFile(String fname, Integer sno)throws Exception;
	
}
