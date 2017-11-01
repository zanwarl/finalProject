package culreq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CulreqController {

	@RequestMapping("/culreqList.do")
	public ModelAndView complainList(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("culreq/culreqList");
	
		return mav;
	}
}
