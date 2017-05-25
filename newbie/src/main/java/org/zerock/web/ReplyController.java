package org.zerock.web;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

@RestController
@RequestMapping("/replies/*")
public class ReplyController {

	private static final Logger logger = Logger.getLogger(ReplyController.class);

	@Autowired
	ReplyService service;
 //기본 리스트만가지고오기
/*	@GetMapping("/all/{sno}")
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("sno") Integer sno, Criteria cri, Model model) throws Exception {

		ResponseEntity<List<ReplyVO>> entity = null;
		PageMaker pm = new PageMaker(cri, service.getTotal(sno));
		try {
			entity = new ResponseEntity<>(service.listReplyPage(cri), HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}*/

	//등록
	@PostMapping("{sno}")
	public ReplyVO addPost(@PathVariable("sno") Integer sno, @RequestBody ReplyVO vo) throws Exception {
		service.addReply(vo);
		return vo;
	}
	
//삭제
	@DeleteMapping("{rno}")
	public void delete(@PathVariable("rno") Integer rno) throws Exception {

		service.delete(rno);

	}
	
//수정
	@PutMapping("{rno}")
	public void modify(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) throws Exception {
		// vo.setRno(rno);
		service.update(vo);
	}
	


/*	@GetMapping("/all/{sno}/{page}")
	public ResponseEntity<List<ReplyVO>> list2 (@PathVariable("sno") Integer sno, @PathVariable("page") Integer page) throws Exception {
		
		ResponseEntity<List<ReplyVO>> entity = null;
		logger.info("sno다"+sno);
		logger.info("페이지다"+page);
		
		try{
		Criteria cri = new Criteria();
		PageMaker pm = new PageMaker(cri, service.getTotal(sno));
		pm.setCri(cri);
		
		logger.info("dfddsdfsfsdsdf----"+pm);
		
		
		entity = new ResponseEntity<>(service.listReplyPage(cri), HttpStatus.OK);
		
		int replyCount = service.count(sno);
		pm.setTotal(replyCount);
		
		
	} catch (Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
		
		return entity;
		
	}*/
	
	

	
	  @GetMapping("/{sno}/{page}")
		@ResponseBody
		public Map<String, Object> list(@PathVariable("sno") Integer sno, @PathVariable("page") Integer page) throws Exception {
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setSize(5);
			PageMaker pageMaker = new PageMaker(cri, service.count(sno));
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", service.listReplyPage(sno, cri));
			map.put("pageMaker", pageMaker);
			map.put("cri", cri);
			map.put("count", service.count(sno));
			
			
			logger.info(pageMaker);
			return map;
		}
	
}
