package korea.foodreq.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import food.model.FoodDAO;
import food.model.FoodNdateDTO;
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
	
	@RequestMapping("/foodndate.do")
	public ModelAndView foodnDate(ModelMap map,@RequestParam(value = "fidx") int fidx) throws JsonGenerationException, JsonMappingException, IOException {
		
		HashMap<String, FoodNdateDTO> holiday = new HashMap<String, FoodNdateDTO>();
		holiday = fdao.foodNdate(fidx);
		
		JSONObject json = new JSONObject();
		
		Iterator<String> it = holiday.keySet().iterator();  // 키 집합 자료를 가진 이터레이터 객체 생성

		String temp = "";
		while(it.hasNext()){                 // 다음 자료가 더 있는지 검사
			temp = it.next();
			System.out.println(temp + " : " + holiday.get(temp));
			/*FoodNdateDTO s = holiday.get(it.next());  // 자료를 순서대로 스트링 변수에 저장 
			json.put("time", holiday.get(s));*/
			json.put("time", temp);
		}		
		
		
	 	//System.out.printf(json.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("foodreq/foodnDate");
		mav.addObject("holiday",json);
		return mav;

	}

	
}
