package org.zerock.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.service.NewbieService;

@Controller
@RequestMapping("/file/*")
@RestController
public class FileController {
	
	private static final Logger logger = Logger.getLogger(FileController.class);

	@Inject
	NewbieService service;
	
	@GetMapping("/fileList")
	  public List<String> fileList(Integer sno)throws Exception{
	    
		logger.info(service.fileList(sno));
		
	    return service.fileList(sno);
	  } 
	
	
	
	//화면에 사진 보여주기
	@GetMapping(name="/display", produces="image/jpg; charset=utf-8")
	public byte[] display(String fileName)throws Exception{
		
		InputStream fin = new FileInputStream("C:\\zzz\\upload\\"+ fileName);
		
		byte[] arr = IOUtils.toByteArray(fin);
		
		return arr;
	}
	
	
	@PostMapping(name = "/upload", produces = "text/plain;charset=UTF-8")
	 public String uploadPost(@RequestParam("file") MultipartFile file) throws Exception{
	      System.out.println("upload post....");
	        System.out.println("getName : " +file.getName());
	        System.out.println("getOriginalFileName : " +file.getOriginalFilename());
	        System.out.println("size : " + file.getSize());
	        
	        UUID uid =UUID.randomUUID(); //파일이름중복안되게
	        
	        String uidStr = uid.toString();
	        String saveName = uidStr + "_" + file.getOriginalFilename();  //저장할 파일 이름
	        String thumbName =  uidStr + "_s_" + file.getOriginalFilename();
	        
	        IOUtils.copy(file.getInputStream(), new FileOutputStream("C:\\zzz\\upload\\" + saveName));
	        
	        //썸넬
	        BufferedImage src = ImageIO.read(file.getInputStream());  //메모리상에 만들어놓은 이미지
	        
	        BufferedImage thumb = 
	        Scalr.resize(src, Scalr.Method.ULTRA_QUALITY, Scalr.Mode.FIT_TO_HEIGHT, 100);  //메모리상에 만들어준이미지에  resize 주는거, FIT_TO_HEIGHT height값 고정

	        ImageIO.write(thumb, "jpg", new FileOutputStream("C:\\zzz\\upload\\" + thumbName));
	        
	        return thumbName;
		
	}
	
	@GetMapping("/delete")
	public void fileDelete(@RequestParam(value="thumbName",required=false) List<String> deleteList){
		
	if(deleteList == null){return;}
		
		for(String thumbName : deleteList){
			
			logger.info("fileName-------" + thumbName);
			
			//원본
			String name = thumbName;
			//썸넬
			String name2 = thumbName.replace("_", "_s_");
			
			//원본
			String filePath = "C:\\zzz\\upload\\"+ name;
			//썸넬
			String filePath2 = "C:\\zzz\\upload\\"+ name2;
			
			File file = new File(filePath);
			File file2 = new File(filePath2);
			
			logger.info("파일~~~~~~~~~~~~~~"+file);
			logger.info(file2);
			
			file.delete();
			file2.delete();
		
			logger.info("삭제~~~~~~~~~~~~~~"+file);
			logger.info(file2);
			
		
	}
	
	}

}
