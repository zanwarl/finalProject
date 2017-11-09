//package korea.foodreq.controller;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.List;
//
//import org.codehaus.jackson.JsonGenerationException;
//import org.codehaus.jackson.map.JsonMappingException;
//import org.codehaus.jackson.map.ObjectMapper;
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.JSONValue;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import food.model.FoodDAO;
//import food.model.FoodNdateDTO;
//import food.model.FoodTimeDTO;
//
//@Controller
//public class FoodReqController {
//
//	@Autowired
//	private FoodDAO fdao;
//	
//	@RequestMapping("/foodReq.do")
//	public String foodReq(){
//		return "foodreq/foodReqWrite";
//	}
//	@RequestMapping("/foodTime.do")
//	public ModelAndView foodList() {
//		int fidx = 2;
//		System.out.println(fidx);
//		List<FoodTimeDTO> list = fdao.foodTime(fidx);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("foodreq/foodTime");
//		mav.addObject("list", list);
//		return mav;
//	}
//	
//	@RequestMapping("/foodndate.do")
//	public ModelAndView foodnDate(ModelMap map,@RequestParam(value = "fidx") int fidx) throws JsonGenerationException, JsonMappingException, IOException {
//		
//		HashMap<String, FoodNdateDTO> holiday = new HashMap<String, FoodNdateDTO>();
//		holiday = fdao.foodNdate(fidx);
//		
//		JSONObject json = new JSONObject();
//		JSONArray jArray = new JSONArray();//諛곗뿴�씠 �븘�슂�븷�븣
//
//		Iterator<String> it = holiday.keySet().iterator();  // �궎 吏묓빀 �옄猷뚮�� 媛�吏� �씠�꽣�젅�씠�꽣 媛앹껜 �깮�꽦
//
//		
//		System.out.println(holiday.size());
//		String temp = "";
//		while(it.hasNext()) {                 // �떎�쓬 �옄猷뚭� �뜑 �엳�뒗吏� 寃��궗
//			temp = it.next();
//			System.out.println(temp + " : " + holiday.get(temp));
//			/*FoodNdateDTO s = holiday.get(it.next());  // �옄猷뚮�� �닚�꽌��濡� �뒪�듃留� 蹂��닔�뿉 ���옣 
//			json.put("time", holiday.get(s));*/
//			json.put("time", temp);
//		}		
//		
//		
//	 	System.out.printf(json.toString());
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("foodreq/foodnDate");
//		mav.addObject("holiday",json);
//		return mav;
//
//	}
//
//	
//}
