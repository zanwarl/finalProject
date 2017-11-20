package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import korea.plan.model.PlanDAO;
import korea.plan.model.PlanDTO;

@Controller
public class IndexController {

	@Autowired
	PlanDAO pdao;
	
	@RequestMapping("/index.do")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		
		List<PlanDTO> list = pdao.favPlanList();
		int count = pdao.favTotalCnt();
		mav.addObject("list", list);
		mav.addObject("count",count);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/main.do")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		
		List<PlanDTO> list = pdao.favPlanList();
		int count = pdao.totalCnt();
		mav.addObject("list", list);
		mav.addObject("count",count);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/header.do")
	public String header() {
		
		return "header";
	}
	
	@RequestMapping("/footer.do")
	public String footer() {
		
		return "footer";
	}
	
	
}
