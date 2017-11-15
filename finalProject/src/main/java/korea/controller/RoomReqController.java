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
	public ModelAndView roomReq(@RequestParam (value="roomIdx") int idx  ) {
		RoomAddDTO rdto = radao.roomContent(idx);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomReq/roomReqMain");
		mav.addObject("rdto",rdto);
		mav.addObject("roomIdx", idx);
		

		return mav;
	}

	@RequestMapping("/roomReqFm.do")
	public ModelAndView roomReqFm(RoomreqDTO rdto, 
			
			HttpServletRequest req, 
			HttpServletResponse resp,@RequestParam(value="roomprice") int rprice
			) {

		
		HttpSession session = req.getSession();
		
		String userId ="yera"; 
		
				//(String)session.getAttribute("sId");
		
		rdto.setUserid(userId);
		
		int result = rdao.RoomreqAdd(rdto);

		String goURL = "roomReqOK.do?reqidx=" + rdto.getReqidx() + "&roomprice=" + rprice;
		//System.out.println(rdto.getReqidx());

		String msg = result > 0 ? "확인" : "다시 예약해주세요";
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
	
		mav.addObject("goURL", goURL);
		mav.setViewName("roomReq/reqmsg");

		return mav;
	}

	@RequestMapping(value = "/roomReqOK.do")
	public ModelAndView roomreqOK(@RequestParam(value = "reqidx") int idx,@RequestParam(value="roomprice") int rprice) {
				
		RoomreqDTO rdto = rdao.RoomreqOK(idx);
		ModelAndView mav = new ModelAndView();
		System.out.println(rprice);
		mav.addObject("rdto", rdto);
		mav.addObject("rprice", rprice);
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
	public ModelAndView roomReqList(
			@RequestParam(value = "cp", defaultValue = "1") int cp,
			HttpServletRequest req, 
			HttpServletResponse resp
			) {
		HttpSession session = req.getSession();
		
		String userId = (String)session.getAttribute("sId");
				
		System.out.println(userId);
		
//		String userId = "yera";

		int listSize = 5;
		int pageSize = 5;

		int totalCnt = rdao.roomReqTotalCnt(userId);

		List<RoomreqDTO> list = rdao.roomreqList(userId, cp, listSize);

		String pageStr = korea.page.PageModule.makePage("roomReqList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomReq/roomReqList");
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);

		return mav;

	}

	@RequestMapping(value = "/roomCancel.do")
	public ModelAndView roomCancel(@RequestParam("reqIdx") int reqIdx) {
		int res = rdao.roomCancel(reqIdx);
		
		String msg = res > 0 ? "예약이 취소되었습니다" : "실패";
		String goURL = "roomReqList.do";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);

		mav.setViewName("admin/adminMsg");
		return mav;

	}
	
	

	@RequestMapping("/myRoomReqList.do")
	public ModelAndView myRoomList (
			
			HttpServletRequest req, 
			HttpServletResponse resp
			)
	{
		ModelAndView mav = new ModelAndView(); 
		
		
		HttpSession session = req.getSession();
		
		String userId ="yera"; 
		
				//(String)session.getAttribute("sId");
		
		List<Map<String, Object>> list = rdao.myRoomList(userId);
		//System.out.println(list);
		mav.addObject("list", list);
		mav.setViewName("room/myRoomReqList");
		return mav; 
		
		
		
	}
	

	@RequestMapping ("/roomReqInfo.do")
	public ModelAndView roomReqInfo (
			@RequestParam (value="roomIdx")int roomIdx 
			
			){
		roomIdx = 1 ; 
		
		ModelAndView mav = new ModelAndView(); 
		List<Map<String, Object>> list= rdao.roomReqInfo(roomIdx);
		mav.addObject("list", list);
		mav.setViewName("room/roomReqInfo");
		return mav; 
		
		
	}
	
	

}
