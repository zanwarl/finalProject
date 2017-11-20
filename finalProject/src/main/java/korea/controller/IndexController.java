package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import korea.plan.model.PlanDAO;
import korea.plan.model.PlanDTO;
import korea.roomAdd.model.RoomAddDAO;
import korea.roomAdd.model.RoomJoinDTO;

@Controller
public class IndexController {

	@Autowired
	PlanDAO pdao;
	@Autowired
	private RoomAddDAO radao;
	
	@RequestMapping("/index.do")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		
		List<PlanDTO> list = pdao.favPlanList();
		System.out.println("main : " + list.size());
		int count = pdao.favTotalCnt();
		
		List<RoomJoinDTO> roomList = radao.roomList();
		int roomCount = radao.totalCount();
		
		mav.addObject("list", list);
		mav.addObject("count",count);
		
		mav.addObject("roomList", roomList);
		mav.addObject("roomCount", roomCount);
		
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "main";
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
