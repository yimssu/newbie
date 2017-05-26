package org.zerock.web;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.Criteria;
import org.zerock.domain.NewbieVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.dddVO;
import org.zerock.service.NewbieService;
import org.zerock.service.ReplyService;

@Controller
@RequestMapping("/store/*")
public class NewbieController {

	private static final Logger logger = Logger.getLogger(NewbieController.class);

	@Autowired
	NewbieService service;
	@Autowired
	ReplyService serve;
		

	@GetMapping("/list")
	public void getList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		List<NewbieVO> list = service.showList(cri);
		PageMaker pm = new PageMaker(cri, service.listCount(cri));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pm);

	}

	@GetMapping("/write")
	public void register() throws Exception {

	}

	@PostMapping("/write")
	public String realRegister(NewbieVO vo) throws Exception {
		
		service.register(vo);
		//System.out.println("writer 데이터"+vo);
				
		return "redirect:/store/list?msg=success";
	}

	@GetMapping("/view")
	public void view(@ModelAttribute("cri") Criteria cri, Integer sno, Model model ) throws Exception {

		model.addAttribute("vo", service.view(sno));
		
	}

	@PostMapping("/view")
	public String delete(Integer sno) throws Exception {

		service.delete(sno);
		return "redirect:/store/list";

	}

	@GetMapping("/modify")
	public void goModify(@ModelAttribute("cri") Criteria cri, Integer sno, Model model) throws Exception {

		model.addAttribute("mody", service.view(sno));
	}

	@PostMapping("/modify")
	public String postUpdate(NewbieVO vo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		service.modify(vo);
	//	logger.info(cri);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("type", cri.getType());
		model.addAttribute("keyword", cri.getKeyword());

		return "redirect:/store/view?sno=" + vo.getSno();
	
	}

	
/*	@GetMapping("/fileList")
	  public List<String> fileList(@PathVariable("sno") Integer sno)throws Exception{
	    
	    return service.fileList(sno);
	  } */
	
	
	
}