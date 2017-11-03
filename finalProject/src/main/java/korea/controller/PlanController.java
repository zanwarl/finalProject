package korea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlanController {

	//일정 메인페이지(List)
	@RequestMapping("/plan.do")
	public ModelAndView planMain() {

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("plan/plan");
		return mav;
	}
}	
