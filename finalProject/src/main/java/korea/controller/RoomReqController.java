package korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.roomAdd.model.RoomAddDAO;
import korea.roomAdd.model.RoomAddDTO;
import korea.roomreq.model.RoomreqDAO;
import korea.roomreq.model.RoomreqDTO;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class RoomReqController {

	@Autowired
	private RoomreqDAO rdao;
	@Autowired
	private RoomAddDAO radao;

	@RequestMapping("/roomReq.do")
	public ModelAndView roomReq(@RequestParam(value = "roomIdx") int idx) {
		
		RoomAddDTO rdto = radao.roomContent(idx);
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomReq/roomReqMain");
		mav.addObject("rdto", rdto);		
		mav.addObject("roomIdx", idx);

		return mav; 
	}

	@RequestMapping("/roomReqFm.do")
	public ModelAndView roomReqFm(RoomreqDTO rdto,

		HttpServletRequest req, HttpServletResponse resp, @RequestParam(value = "total_pay") int total_pay) {

		HttpSession session = req.getSession();
		
		String userId =(String)session.getAttribute("sId");
		
		rdto.setUserid(userId);
		rdto.setTotal_pay(total_pay);

		int result = rdao.RoomreqAdd(rdto);
	
		String goURL = "roomReqOK.do?reqidx=" + rdto.getReqidx() + "&total_pay=" + total_pay;
		// System.out.println(rdto.getReqidx());

		String msg = result > 0 ? "결제 하시겠습니까?" : "예약오류 : 다시 예약해주세요.";
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);

		mav.addObject("goURL", goURL);
		mav.setViewName("roomReq/reqmsg");

		return mav;
	}

	@RequestMapping(value = "/roomReqOK.do")
	public ModelAndView roomreqOK(@RequestParam(value = "reqidx") int idx,
			@RequestParam(value = "total_pay") int total_pay) {

		RoomreqDTO rdto = rdao.RoomreqOK(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rdto", rdto);
		mav.addObject("total_pay", total_pay);
		mav.setViewName("roomReq/rok");

		return mav;
	}

	@RequestMapping("/payMent.do")
	public ModelAndView payMent() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pay/payMent");

		return mav;
	}

	@RequestMapping(value = "/roomReqList.do")
	public ModelAndView roomReqList(@RequestParam(value = "cp", defaultValue = "1") int cp,
			HttpServletRequest req,
			HttpServletResponse resp) {
		HttpSession session = req.getSession();

		
		
		String userId = (String) session.getAttribute("sId");

		int listSize = 5;
		int pageSize = 5;

		int totalCnt = rdao.roomReqTotalCnt(userId);

		
		List<Map<String, Object>> list = rdao.roomreqList(userId, cp, listSize);
//System.out.println(list);
		
		String pageStr = korea.page.PageModule.makePage("roomReqList.do", totalCnt, listSize, pageSize, cp);
System.out.println(list);
		ModelAndView mav = new ModelAndView();
/*		mav.addObject("now", y+""+m+""+d);*/
		
		mav.setViewName("roomReq/roomReqList");
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);

		return mav;

	}

	@RequestMapping(value = "/roomCancel.do")
	public ModelAndView roomCancel(@RequestParam("reqIdx") int reqIdx) {
		int res = rdao.roomCancel(reqIdx);

		String msg = res > 0 ? "취소되었습니다." : "오류";
	//	String goURL = "roomReqList.do";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
//		mav.addObject("goURL", goURL);

		mav.setViewName("admin/closeMsg");
		return mav;

	}

	@RequestMapping("/myRoomReqList.do")
	public ModelAndView myRoomList(

			HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = req.getSession();

		String userId =  (String)session.getAttribute("sId");

		List<Map<String, Object>> list = rdao.myRoomList(userId);
		// System.out.println(list);
		mav.addObject("list", list);
		mav.setViewName("room/myRoomReqList");
		return mav;

	}

	/*
	 * public static int [] getDate (){
	 * 
	 * Calendar now = Calendar.getInstance(); int y = now.get(Calendar.YEAR);
	 * int m = now.get(Calendar.MONTH)+1; int res []= {y, m}; return res ;
	 * 
	 * 
	 * }
	 */

	@RequestMapping("/roomReqInfo.do")
	public ModelAndView roomReqInfo(@RequestParam(value = "roomIdx") int roomIdx) {

		
		ModelAndView mav = new ModelAndView();
		List<Map<String, Object>> list = rdao.roomReqInfo(roomIdx);

		
		String event = "";
				
		
		if (list .size()!= 0 ){
			for (int i = 0; i < list.size() - 1; i++) {
				
				String start = (String) list.get(i).get("STARTDATE");
				String start1= start.substring(5);
				
				
				String count =String.valueOf(list.get(i).get("COUNT"));
				String reqidx =String.valueOf(list.get(i).get("REQIDX"));
				
				String end = (String) list.get(i).get("ENDDATE");
				String end1 =end.substring(5);
				
				String userId = (String) list.get(i).get("USERID");
				event = event + "{start:'" + start + "',end:'" + end + "',title:'" + userId + "(" + count + ")" + start1
						+ "~" + end1 + "', reqidx:'"+reqidx+"'},";

			}

			String start = (String) list.get(list.size() - 1).get("STARTDATE");
			String start1= start.substring(5);
			
			String end = (String) list.get(list.size() - 1).get("ENDDATE");
			String end1 =end.substring(5);

			String reqidx =String.valueOf(list.get(list.size() - 1).get("REQIDX"));
			
			String userId = (String) list.get(list.size() - 1).get("USERID");		
			String count =String.valueOf(list.get(list.size() - 1).get("COUNT"));
			event = event + "{start:'" + start + "',end:'" + end + "',title:'" + userId + "(" + count + ")" + start1 + "~"
					+ end1 + "' , reqidx :'"+reqidx+"'}";
		}


		mav.setViewName("room/roomReqInfo");
		mav.addObject("event", event);
		System.out.println(event);
		// System.out.println(list);
		return mav;

	}


	@RequestMapping("/roomReqInfo2.do")
	
	public ModelAndView roomReqInfo2(
			@RequestParam(value = "reqidx") int reqidx
			
			)
	{
		Map<String,Object> list = rdao.roomReqInfo2Sql(reqidx);
		
		
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("room/roomReqInfo2");
		mav.addObject("list", list);
		
		return mav; 
		
		
		
	}
	
	@RequestMapping ("/paidOk.do")
	public ModelAndView paid (
			@RequestParam(value="reqIdx")int reqIdx
			)
	
	{
		
		ModelAndView mav = new  ModelAndView(); 
		int res = rdao.paid(reqIdx);
		
		String msg = res > 0 ? "예약완료" : "오류";
		String goURL = "main.do";

		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);

		mav.setViewName("admin/adminMsg");
		return mav;

	}
	
}
