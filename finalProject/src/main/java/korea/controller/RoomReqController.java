package korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.roomreq.model.RoomreqDAO;
import korea.roomreq.model.RoomreqDTO;

import java.util.List;


	@Controller
	public class RoomReqController {

		@Autowired
		private RoomreqDAO rdao;
		
		@RequestMapping("/roomReq.do")
		public ModelAndView roomReqForm(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("roomreq/roomReqMain");
			
			return mav;
		}
		
		@RequestMapping("/roomReqMain.do")
		public ModelAndView roomreq1(RoomreqDTO rdto){
			
			int result = rdao.RoomreqAdd(rdto);

			String goURL = "roomreqCon2.do?idx="+rdto.getReqidx();
			System.out.println(rdto.getReqidx());
			
			String msg = result>0? "예약완료":"다시 예약해주세요";
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("reqmsge",msg);
			mav.setViewName("roomreq/reqmsg");		

			mav.addObject("goURL",goURL);
			mav.setViewName("roomreq/roomreqCon2");
			
			return mav;
		}
		
		
		@RequestMapping(value="/roomreq2.do")
		public ModelAndView roomreq2(@RequestParam(value="idx")int idx){
			
			RoomreqDTO rdto = rdao.RoomreqCon2(idx);
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("rdto",rdto);
			mav.setViewName("roomreq/roomreqCon2");
			 
			return mav;
		}

		
	@RequestMapping("/payMent.do")
		public ModelAndView payMent(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("pay/payMent");
			
			return mav;
		}
	
	@RequestMapping (value = "/roomReqList.do")
	public ModelAndView roomReqList() {
		
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("roomReq/roomReqList");
		return mav; 
		
		
	}
	
	

		
		
	}
