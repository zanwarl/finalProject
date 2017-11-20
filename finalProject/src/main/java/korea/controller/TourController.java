
package korea.controller;

import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.tour.model.SigunguDTO;
import korea.tour.model.tourCmtDTO;
import korea.tour.model.tourDAO;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedInputStream;

@Controller
public class TourController {

	@Autowired
	private tourDAO tDAO;

	// 최상위 api 주소 세팅
	public final static String service_key = "76zE48jtXxj3nqHQhQfsoUjigjZE3n0lRkbHkszP0BJMJNqWzR3p3J2qJKCs7E70RYO9qSOmfM36DkozbFL6Dw%3D%3D";
	public static String tour_code = "areaCode";
	public static String param_1 = "&numOfRows=40&pageNo=1&MobileOS=ETC&MobileApp=TestApp";
	public static String data_type = "&_type=json"; // 사용하지 않을 시 XML 타입

	public static String tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/" + tour_code
			+ "?ServiceKey=" + service_key + param_1 + data_type;

	JSONParser jsonParser = new JSONParser();

	// rest api 주소 실행하는 method
	private static String readUrl(String tour_api_url) throws Exception {
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

	// JSON
	@RequestMapping("/areaCode.do")
	public ModelAndView areaCode() throws Exception {
		tour_code = "areaCode";
		param_1 = "&contentTypeId=&" + tour_code + "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=TestApp";

		tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/" + tour_code + "?ServiceKey="
				+ service_key + param_1 + data_type;

		JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl(tour_api_url));
		JSONObject json = (JSONObject) jsonObject.get("response");
		json = (JSONObject) json.get("body");
		String totalCount = JSONValue.toJSONString(json.get("totalCount"));

		json = (JSONObject) json.get("items");
		JSONArray list = (JSONArray) json.get("item");
		JSONArray arrayName = new JSONArray();

		for (int i = 0; i < list.size(); i++) {

			JSONObject entity = (JSONObject) list.get(i);
			String name = (String) entity.get("name");
			arrayName.add(name);

		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tour/areaCode");
		mav.addObject("jsonObject", jsonObject);
		mav.addObject("list", list);
		mav.addObject("arrayName", arrayName);
		return mav;
	}

	// 실제 페이지 이동
	@RequestMapping("/tour.do")
	public ModelAndView areaList() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("tour/cities");
		return mav;
	}

	// JSON
	@RequestMapping("/areaBasedList.do")
	public ModelAndView areaBasedList(@RequestParam(value = "areaCode") String areaCode,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "arrange", required = false, defaultValue = "A") String arrange,
			@RequestParam(value = "contentTypeId", required = false, defaultValue = "") String contentTypeId,
			@RequestParam(value = "sigunguCode", required = false, defaultValue = "") String sigunguCode,
			@RequestParam(value = "row", required = false, defaultValue = "10") int row)
			throws Exception {
		
		
		System.out.println("타입 : " + contentTypeId);
		System.out.println("areabased : "  + sigunguCode);
		System.out.println("row : " + row);
		tour_code = "areaBasedList";
		param_1 = "&contentTypeId=" + contentTypeId + "&areaCode=" + areaCode
				+ "&sigunguCode=" + sigunguCode + "&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=" + "TourAPI3.0_Guide&arrange="
				+ arrange + "&numOfRows=11&pageNo=" + cp;

		tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/" + tour_code + "?ServiceKey="
				+ service_key + param_1 + data_type;
		
		System.out.println(tour_api_url);
		JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl(tour_api_url));

		JSONObject json = (JSONObject) jsonObject.get("response");
		json = (JSONObject) json.get("body");
		String totalCount = JSONValue.toJSONString(json.get("totalCount"));

		tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/" + tour_code + "?ServiceKey="
				+ service_key + param_1 + data_type;
		System.out.println(jsonObject);
		ModelAndView mav = new ModelAndView();

		mav.setViewName("tour/areaBasedList");
		mav.addObject("jsonObject", jsonObject);
		return mav;

	}

	@RequestMapping("/tourSearch.do")
	public ModelAndView tourSearch(@RequestParam(value = "areaCode") String areaCode,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "arrange", required = false, defaultValue = "A") String arrange,
			@RequestParam(value = "txt") String txt) throws ParseException, Exception {

		if (txt == null || txt.equals("")) {
			tour_code = "areaBasedList";
			param_1 = "&contentTypeId=&" + "areaCode=" + areaCode
					+ "&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=" + "TourAPI3.0_Guide&arrange="
					+ arrange + "&numOfRows=30&pageNo=" + cp;

			tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/" + tour_code + "?ServiceKey="
					+ service_key + param_1 + data_type;
		} else {
			tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey="
					+ "76zE48jtXxj3nqHQhQfsoUjigjZE3n0lRkbHkszP0BJMJNqWzR3p3J2qJKCs7E70RYO9qSOmfM36DkozbFL6Dw%3D%3D"
					+ "&keyword=" + txt + "&areaCode=" + areaCode
					+ "&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=30&pageNo=1&_type=json";
		}

		JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl(tour_api_url));

		JSONObject json = (JSONObject) jsonObject.get("response");
		json = (JSONObject) json.get("body");
		String totalCount = JSONValue.toJSONString(json.get("totalCount"));

		ModelAndView mav = new ModelAndView();

		mav.setViewName("tour/areaBasedList");
		mav.addObject("jsonObject", jsonObject);
		return mav;
	}
	
	
	@RequestMapping("/nearInfo.do")
	public ModelAndView nearInfo(
			@RequestParam(value = "mapx", required = false, defaultValue = " ") String mapx,
			@RequestParam(value = "mapy", required = false, defaultValue = " ") String mapy) throws ParseException, Exception {
		
		System.out.println("넘어온 좌표 : " + mapy + " " + mapx);
		tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=" +
		               "76zE48jtXxj3nqHQhQfsoUjigjZE3n0lRkbHkszP0BJMJNqWzR3p3J2qJKCs7E70RYO9qSOmfM36DkozbFL6Dw%3D%3D" +
		               "&contentTypeId=39&mapX=" + mapy +"&mapY=" + mapx + "&radius=1000&listYN=Y&MobileOS=ETC&" +
				       "MobileApp=TourAPI3.0_Guide&arrange=B&numOfRows=5&pageNo=1&_type=json";
		ModelAndView mav = new ModelAndView();
		
		
		System.out.println(tour_api_url);
		
		JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl(tour_api_url));

		JSONObject json = (JSONObject) jsonObject.get("response");
		json = (JSONObject) json.get("body");
		String totalCount = JSONValue.toJSONString(json.get("totalCount"));
		
		System.out.println(jsonObject);
		
		mav.setViewName("tour/areaBasedList");
		mav.addObject("jsonObject", jsonObject);
		return mav;
	}

	// 실제 페이지 이동
	@RequestMapping("/city.do")
	public ModelAndView cityList(@RequestParam(value = "areaCode") int areaCode,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "sigunguCode", required = false, defaultValue = "") String sigunguCode) throws Exception {

		ModelAndView mav = new ModelAndView();

		String cityName = tDAO.areaCode(areaCode);
		
		System.out.println("---------");
		
		String sigunguName = tDAO.sigunguName(areaCode, sigunguCode);
		int contentTypeId = 1;
		mav.addObject("contentTypeId", contentTypeId);
		mav.addObject("areaCode", areaCode);
		if(sigunguCode==null || sigunguCode.equals("")) {
		}else {
			mav.addObject("sigunguCode", sigunguCode);
			mav.addObject("sigunguName",sigunguName);
		}
		mav.addObject("cp", cp);
		mav.addObject("cityName", cityName);
		
		mav.setViewName("tour/cityList");
		return mav;
	}

	@RequestMapping("/tourDetailJSON.do")
	public ModelAndView tourDetailJSON(@RequestParam(value = "contentId") String contentId,
			@RequestParam(value = "contentTypeId") String contentTypeId) throws Exception {

		tour_code = "detailCommon";
		param_1 = "&contentTypeId=" + contentTypeId + "&contentId=" + contentId
				+ "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y"
				+ "&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y";

		tour_api_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/" + tour_code + "?ServiceKey="
				+ service_key + param_1 + data_type;

		JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl(tour_api_url));
		ModelAndView mav = new ModelAndView();
		
		System.out.println(jsonObject);

		mav.setViewName("tour/contentid");
		mav.addObject("jsonObject", jsonObject);
		return mav;

	}

	@RequestMapping("citycate.do")
	public ModelAndView categoryList(@RequestParam(value = "contentTypeId") int contentTypeId,
			@RequestParam(value = "areaCode") int areaCode,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "sigunguCode", required = false, defaultValue = "") String sigunguCode) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("contentTypeId", contentTypeId);
		mav.addObject("areaCode", areaCode);
		
		String queryStr = "";
		if(sigunguCode==null || sigunguCode.equals("")) {
			queryStr = "areaBasedList.do?areaCode="+areaCode+"&arrange=B&contentTypeId="+contentTypeId+"&cp="+cp;
		}else {
			mav.addObject("sigunguCode", sigunguCode);
			queryStr = "areaBasedList.do?areaCode="+areaCode+"&sigunguCode="+sigunguCode+"&arrange=B&contentTypeId="+contentTypeId+"&cp="+cp;
		}
		mav.addObject("cp", cp);
		mav.addObject("queryStr", queryStr);
		mav.setViewName("tour/info");
		return mav;
	}

	// 여행지 페이지 상세 정보 + 댓글 리스트
	@RequestMapping("/tourDetail.do")
	public ModelAndView tourDetail(
			@RequestParam(value = "contentId", required = false, defaultValue = "") String contentId,
			@RequestParam(value = "contentTypeId", required = false, defaultValue = "") String contentTypeId,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam(value = "queryStr", required = false, defaultValue = "") String queryStr) {

		ModelAndView mav = new ModelAndView();

		int totalCnt = tDAO.totalCnt(contentId);
		int listSize = 5; // 한 페이지에서 보여질 게시물 수
		int pageSize = 5; // 한 페이지에서 보여질 페이지 수

		String url = "tourDetail.do?contentTypeId=" + contentTypeId + "&contentId=" + contentId;
		String page = korea.page.PageModule.page(url, totalCnt, listSize, pageSize, cp, queryStr);

		List<tourCmtDTO> list = tDAO.tourcmtList(contentId, cp, listSize);
		mav.setViewName("tour/tourDetail");
		mav.addObject("contentId", contentId);
		mav.addObject("contentTypeId", contentTypeId);
		mav.addObject("list", list);
		mav.addObject("page", page);
		return mav;
	}

	/*
	 * // 실제 페이지 이동
	 * 
	 * @RequestMapping("/tour.do") public ModelAndView tourList() throws
	 * Exception {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * mav.setViewName("tour/tourList");
	 * 
	 * return mav; }
	 */
	@RequestMapping("/tourMap.do")
	public ModelAndView tourMap(@RequestParam(value = "mapx") String mapx, @RequestParam(value = "mapy") String mapy) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("mapx", mapx);
		mav.addObject("mapy", mapy);
		mav.setViewName("tour/tourMap");
		return mav;
	}

	// 댓글 작성 + 작성 후 원래 페이지로 이동
	@RequestMapping("/tourCmtWrite.do")
	public ModelAndView replyWrite(String queryStr, tourCmtDTO cmtdto) {

		ModelAndView mav = new ModelAndView();

		// 댓글 작성 후 돌아갈 페이지 주소 설정
		queryStr = "tourDetail.do?" + queryStr;

		int result = tDAO.tourcmtWrite(cmtdto);

		String msg = result > 0 ? "댓글 작성 완료" : "댓글 작성 실패";

		mav.addObject("msg", msg);
		mav.addObject("url", queryStr);
		mav.setViewName("tour/tourMsgOk");

		return mav;
	}

	// 댓글 삭제 + 삭제 후 원래 페이지로 이동
	@RequestMapping("/tourCmtDel.do")
	public ModelAndView repleyDelete(int idx, String contentTypeId, String contentId) {

		ModelAndView mav = new ModelAndView();

		// 댓글 작성 후 돌아갈 페이지 주소 설정

		String queryStr = "tourDetail.do?contentTypeId=" + contentTypeId + "&contentId=" + contentId;
		int result = tDAO.tourcmtDel(idx);

		String msg = result > 0 ? "댓글 삭제 완료" : "댓글 삭제 실패";

		mav.addObject("msg", msg);
		mav.addObject("url", queryStr);
		mav.setViewName("tour/tourMsgOk");

		return mav;
	}
	
	@RequestMapping("/foodList.do")
	public ModelAndView foodAllList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
									@RequestParam(value = "areaCode", required = false, defaultValue = "") int areaCode) {
		ModelAndView mav = new ModelAndView();
		String cityName = tDAO.areaCode(areaCode);
		mav.setViewName("tour/food");
		mav.addObject("areaCode", areaCode);
		mav.addObject("cityName", cityName);
		return mav;
	}
	
	@RequestMapping("/allCity.do")
	public ModelAndView cityAllList() throws ParseException, Exception {
		
		/*String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey="
				   + "76zE48jtXxj3nqHQhQfsoUjigjZE3n0lRkbHkszP0BJMJNqWzR3p3J2qJKCs7E70RYO9qSOmfM36DkozbFL6Dw%3D%3D&" 
				   + "areaCode=1&numOfRows=30&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";
		
		JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl(url));

		JSONObject json = (JSONObject) jsonObject.get("response");
		json = (JSONObject) json.get("body");
		String totalCount = JSONValue.toJSONString(json.get("totalCount"));

		System.out.println(jsonObject);
		System.out.println(totalCount); */
		
		List<SigunguDTO> list = tDAO.sigunguCode();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("tour/allCity");
		return mav;
	}
}
