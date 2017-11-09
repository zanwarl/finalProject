package korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.roomreq.model.RoomreqDAO;
import korea.roomreq.model.RoomreqDTO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class RoomReqController {

	@Autowired
	private RoomreqDAO rdao;

	@RequestMapping("/roomReq.do")
	public ModelAndView roomReqForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomreq/roomReqMain");

		return mav;
	}

	@RequestMapping("/roomReqMain.do")
	public ModelAndView roomreq1(RoomreqDTO rdto) {

		int result = rdao.RoomreqAdd(rdto);

		String goURL = "roomreqCon2.do?idx=" + rdto.getReqidx();
		System.out.println(rdto.getReqidx());

		String msg = result > 0 ? "예약완료" : "다시 예약해주세요";
		ModelAndView mav = new ModelAndView();

		mav.addObject("reqmsge", msg);
		mav.setViewName("roomreq/reqmsg");

		mav.addObject("goURL", goURL);
		mav.setViewName("roomreq/roomreqCon2");

		return mav;
	}

	@RequestMapping(value = "/roomreq2.do")
	public ModelAndView roomreq2(@RequestParam(value = "idx") int idx) {

		RoomreqDTO rdto = rdao.RoomreqCon2(idx);
		ModelAndView mav = new ModelAndView();

		mav.addObject("rdto", rdto);
		mav.setViewName("roomreq/roomreqCon2");

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

}
