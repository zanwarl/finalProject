package food.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import food.model.FoodDAO;
import food.model.FoodDTO;

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
	public ModelAndView addFood(FoodDTO fdto){
		int result = fdao.foodAdd(fdto);
		String msg = result>0?"? ˆ?Š¤?† ?ž‘ ?“±ë¡? ?„±ê³?!":"? ˆ?Š¤?† ?ž‘ ?“±ë¡? ?‹¤?Œ¨!";
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg",msg);
		mav.setViewName("food/msg");
		
		return mav;
	}
	
	@RequestMapping("/foodContent.do")
	public ModelAndView foodContent(@RequestParam("idx")int idx){
		
		FoodDTO fdto = fdao.foodContent(idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("fdto",fdto);
		mav.setViewName("food/foodContent");
		 
		return mav;
	}
}
