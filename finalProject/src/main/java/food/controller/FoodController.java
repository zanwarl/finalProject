package food.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import food.model.FoodDAO;
import food.model.FoodDTO;
import food.model.FoodTimeDTO;

@Controller
public class FoodController {

	@Autowired
	private FoodDAO fdao;
	
	@RequestMapping("/food.do")
	public ModelAndView food(){
		
		List<FoodDTO> list = fdao.foodList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.setViewName("food/food");
		
		return mav;
	}
	
	@RequestMapping("/addFoodForm.do")
	public ModelAndView addFood(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("food/addFood");
		
		return mav;
	}
	
	@RequestMapping("/addFood.do")
<<<<<<< HEAD
	public ModelAndView addFood(FoodDTO fdto){
		int result = fdao.foodAdd(fdto);
		String msg = result>0?"?占쏙옙?占쏙옙?占쏙옙?占쏙옙 ?占쏙옙占�? ?占쏙옙占�?!":"?占쏙옙?占쏙옙?占쏙옙?占쏙옙 ?占쏙옙占�? ?占쏙옙?占쏙옙!";
=======

	public ModelAndView addFood(FoodDTO fdto,MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException{

>>>>>>> branch 'master' of https://github.com/zanwarl/finalProject
		ModelAndView mav = new ModelAndView();
		fdao.foodAdd(fdto);
		 
		String realFolder = "d:/upload2/";
	        File dir = new File(realFolder);
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	     }
	        List<MultipartFile> mf = mhsq.getFiles("uploadFile");
	        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
	             
	        } else {
	            for (int i = 0; i < mf.size(); i++) {
	                // 파일 중복명 처리
	                String genId = UUID.randomUUID().toString();
	                // 본래 파일명
	                String oName = mf.get(i).getOriginalFilename();
	                 
	                String fimagename = genId + "." + oName;
	                // 저장되는 파일 이름
	 
	                String savePath = realFolder + fimagename; // 저장 될 파일 경로
	 
	                long fileSize = mf.get(i).getSize(); // 파일 사이즈
	 
	                mf.get(i).transferTo(new File(savePath)); // 파일 저장
	 
	                fdao.fImageUpload(oName, fimagename, fileSize);
	            }
	        }
	       
	      return new ModelAndView("redirect:food.do");
	}
	
	@RequestMapping("/foodContent.do")
	public ModelAndView foodContent(@RequestParam("foodidx")int idx){
		
		FoodDTO fdto = fdao.foodContent(idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("fdto",fdto);
		mav.setViewName("food/foodContent");
		 
		return mav;
	}
	
<<<<<<< HEAD

=======

	@RequestMapping("/foodList.do")
	public ModelAndView foodList() {
		int fidx = 2;
		System.out.println(fidx);
		List<FoodTimeDTO> list = fdao.foodList(fidx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("food/foodList");
		mav.addObject("list", list);
		return mav;
	}
>>>>>>> branch 'master' of https://github.com/zanwarl/finalProject
	
	
}
