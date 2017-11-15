package korea.controller;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import korea.plan.model.PlanDAO;
import korea.plan.model.PlanDTO;
import korea.plan.model.PlanDetailDTO;
import korea.plan.model.PlanMainDetailDTO;

@Controller
public class PlanController {

	@Autowired
	private PlanDAO pdao;
	
	// 최상위 api 주소 세팅
	public final static String service_key = "76zE48jtXxj3nqHQhQfsoUjigjZE3n0lRkbHkszP0BJMJNqWzR3p3J2qJKCs7E70RYO9qSOmfM36DkozbFL6Dw%3D%3D";
	public static String tour_code = "areaCode";
	public static String param_1 = "&numOfRows=40&pageNo=1&MobileOS=ETC&MobileApp=TestApp";
	public static String data_type = "&_type=json"; // 사용하지 않을 시 XML 타입

	public static String tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/" + tour_code
			+ "?ServiceKey=" + service_key + param_1 + data_type;

	JSONParser jsonParser = new JSONParser();
	
	/**일정 메인페이지(List)*/
	@RequestMapping("/plan.do")
	public ModelAndView planMain(@RequestParam(value="cp",required=false,defaultValue="1")int cp) {

		ModelAndView mav = new ModelAndView();
		
		int totalCnt = pdao.totalCnt();
		int listSize = 5;	//한 페이지에서 보여질 게시물 수
		int pageSize = 5; 	//한 페이지에서 보여질 페이지 수
		
		List<PlanDTO> list = pdao.planList(cp,pageSize);
		
		String url = "plan.do";
		
		System.out.println(totalCnt);
		String page = korea.page.PageModule.page(url, totalCnt, listSize, pageSize, cp);
		
		mav.addObject("list", list);
		mav.addObject("page", page);
		mav.setViewName("plan/plan");
		return mav;
	}
	
	/**일정 만들기 페이지 이동*/
	@RequestMapping("/planMake.do")
	public String planWrite() {
		
		return "plan/planMake";
		
	}
	
	@RequestMapping("/planAreaCode.do")
	public ModelAndView areaCode() throws Exception {
		System.out.println("타니");
		tour_code = "areaCode";
		param_1 = "&contentTypeId=&" + tour_code + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp";

		tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/" + tour_code + "?ServiceKey="
				+ service_key + param_1 + data_type;

		JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl(tour_api_url));
		JSONObject json = (JSONObject) jsonObject.get("response");
		json = (JSONObject) json.get("body");
		String totalCount = JSONValue.toJSONString(json.get("totalCount"));

		//System.out.println("총 지역 수 : " +totalCount);
		//System.out.println(jsonObject);
		json = (JSONObject) json.get("items");
		JSONArray list = (JSONArray) json.get("item");
		JSONArray arrayName = new JSONArray();

		for (int i = 0; i < list.size(); i++) {

			JSONObject entity = (JSONObject) list.get(i);
			String name = (String) entity.get("name");
			// System.out.println(name);
			arrayName.add(name);

		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tour/areaCode");
		mav.addObject("jsonObject", jsonObject);
		mav.addObject("list", list);
		mav.addObject("arrayName", arrayName);
		return mav;
	}
	
	// rest api 주소 실행하는 method
	private static String readUrl(String tour_api_url) throws Exception {
		//System.out.println(tour_api_url);
		BufferedInputStream reader = null;
		try {
			URL url = new URL(tour_api_url);
			reader = new BufferedInputStream(url.openStream());
			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while ((i = reader.read(b)) != -1) {
				buffer.append(new String(b, 0, i));
			}
			return buffer.toString();
		} finally {
			if (reader != null)
				reader.close();
		}
	}
	
	//상세 일정 추가 페이지 가기 전에 DB에 main 저장하기
	@RequestMapping("/planMainSaveDb.do")
	public ModelAndView planMainSaveDb(PlanDTO pdto) {
		int idx = pdao.lastSaveIdx(pdto);
		System.out.println(idx);
		pdto.setPlan_idx(idx);
		
		int result = pdao.planMainWrite(pdto);
		ModelAndView mav = new ModelAndView();
		System.out.println("2");
		String str = "planDetail.do";
		str = str +  "?plan_idx="+pdto.getPlan_idx();
		
		System.out.println(str);
		mav.setViewName("plan/planDetailOk");
		mav.addObject("url", str);
		return mav;
	}
	
	/**세부 일정 작성*/ 
	@RequestMapping("/planDetail.do")
	public ModelAndView planDetail(PlanDTO pdto) {
		
		//int idx = pdao.lastSaveIdx(pdto);

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("plan/planDetail");
		mav.addObject("plan_idx", pdto.getPlan_idx());
		return mav;
	}
	
	
	@RequestMapping("/test.do")
	public String test() {
		return "plan/test";
	}
	
	/**일정 내용 보여주기*/
	@RequestMapping("/planContent.do")
	public ModelAndView planDetail(int pidx) {
		
		//pidx = 75;
		System.out.println(pidx);
		ModelAndView mav = new ModelAndView();
		PlanDTO pdto = pdao.planMainContent(pidx);
		List<PlanDetailDTO> list = pdao.planDetail(pidx);	
		System.out.println("사이즈 : " + list.size());
		mav.addObject("list", list);
		mav.addObject("pdto", pdto);
		mav.setViewName("plan/planContent");
		return mav;
		
	}
	
	
	/**내가 작성한 일정 목록 (+페이징)*/
	@RequestMapping("/myPlan.do")
	public ModelAndView myPlanList(HttpSession session, @RequestParam(value="cp",required=false,defaultValue="1")int cp) {
		int idx = (Integer) session.getAttribute("sIdx");
		
		ModelAndView mav = new ModelAndView();
		
		int totalCnt = pdao.myTotalCnt(idx);
		int listSize = 5;	//한 페이지에서 보여질 게시물 수
		int pageSize = 5; 	//한 페이지에서 보여질 페이지 수
		
		String url = "myPlan.do";
		String page = korea.page.PageModule.page(url, totalCnt, listSize, pageSize, cp);
		System.out.println(page);
		List<PlanDTO> list = pdao.myPlanList(idx, cp, pageSize);
		
		mav.setViewName("plan/myPlanList");
		mav.addObject("list", list);
		mav.addObject("page", page);
		return mav;
	}
	
	/*@RequestMapping("/planDetailWrite.do")
	public ModelAndView planDetailWrite(PlanDetailDTO pddto, PlanDTO pdto, @RequestParam(value="str") String[] str) {
		
		System.out.println(str.length);

		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("plan/planOk");
		return mav;
	}*/
	
	@RequestMapping("/planDetailWrite.do")
	public ModelAndView getListParam(@RequestParam(value="str")String str, PlanDTO pdto) throws ParseException{
		
		System.out.println("???????????????????");
		
		/*Object object=null;
		JSONArray arrayObj=null;
		JSONParser jsonParser=new JSONParser();
		object=jsonParser.parse(str);
		arrayObj=(JSONArray) object;
		System.out.println("Json object :: "+arrayObj);*/
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(str);
		JSONArray jsonArray = (JSONArray)obj;
		
		pdao.planDetailDelete(pdto.getPlan_idx());
		
		PlanDetailDTO pddto = new PlanDetailDTO();
		for(int i=0;i<jsonArray.size();i++){
			JSONObject jsonObj = (JSONObject)jsonArray.get(i);
			pddto.setPland_order(Integer.parseInt((String) jsonObj.get("order")));
			pddto.setPland_img((String)jsonObj.get("img"));
			pddto.setPland_typeid((String)jsonObj.get("type"));
			pddto.setPland_code((String)jsonObj.get("code"));
			pddto.setPland_subject((String)jsonObj.get("title"));
			pddto.setPland_pidx(pdto.getPlan_idx());
			
			int result = pdao.planDetailWrite(pddto);
		}
		System.out.println("---: " + pdto.getPlan_subject());
		System.out.println("---: " + pdto.getPlan_idx());
		
		
		int update = pdao.planMainUpdate(pdto);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("plan/plan");
		return mav;
	}    
	
	@RequestMapping("/planEdit.do")
	public ModelAndView planEdit(int plan_idx) {
		
		System.out.println("수정 할 번호 : " + plan_idx);
		List<PlanDetailDTO> list = pdao.planEditList(plan_idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("plan/planDetail");
		mav.addObject("plan_idx", plan_idx);
		mav.addObject("list", list);
		return mav;
	}

}	
