package comreq.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class ComreqController {
	
	@RequestMapping("/comreq.do")
	public ModelAndView complainReq(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("comreq/complainReq");
	
		return mav;
	}

}


