package korea.foodreq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import korea.foodreq.model.FoodReqDAO;

@Controller
public class FoodReqController {
	
	@RequestMapping("/foodReq.do")
	
	public String foodReq(){
		return "foodreq/foodReqWrite";
	}
	
}
