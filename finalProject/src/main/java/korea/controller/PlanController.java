package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import korea.plan.model.PlanDAO;
import korea.plan.model.PlanDTO;

@Controller
public class PlanController {

	@Autowired
	private PlanDAO pdao;
	
	//일정 메인페이지(List)
	@RequestMapping("/plan.do")
	public ModelAndView planMain() {

		List<PlanDTO> list = pdao.planList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("plan/plan");
		return mav;
	}
}	
