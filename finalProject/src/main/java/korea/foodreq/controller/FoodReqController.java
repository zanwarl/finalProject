package korea.foodreq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import food.model.FoodDAO;
import food.model.FoodTimeDTO;

@Controller
public class FoodReqController {

	@Autowired
	private FoodDAO fdao;
	
	@RequestMapping("/foodReq.do")
	
	public String foodReq(){
		return "foodreq/foodReqWrite";
	}
	@RequestMapping("/foodTime.do")
	public ModelAndView foodList() {
		int fidx = 2;
		System.out.println(fidx);
		List<FoodTimeDTO> list = fdao.foodTime(fidx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("foodreq/foodTime");
		mav.addObject("list", list);
		return mav;
	}
	
	
	
}
