package food.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
   public ModelAndView addFood(FoodDTO fdto) {
	  System.out.println(fdto.getAddr1());
      ModelAndView mav = new ModelAndView();
      //fdao.foodAdd(fdto);
      mav.addObject("fdto",fdto);
      mav.setViewName("food/addFoodOk");
      
      return mav;
   }
   
   @RequestMapping("/addImage.do")
	   public ModelAndView addImageForm(){
		   ModelAndView mav = new ModelAndView();
		   mav.setViewName("food/foodimage");
		   
		   return mav;
	  }
   
   
   @RequestMapping("/foodContent.do")
   public ModelAndView foodContent(@RequestParam("foodidx")int idx){
      
      FoodDTO fdto = fdao.foodContent(idx);
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("fdto",fdto);
      mav.setViewName("food/foodContent");
       
      return mav;
   }
   

}


