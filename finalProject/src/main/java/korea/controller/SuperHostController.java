package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.superHost.model.SuperHostDAO;
import korea.superHost.model.SuperHostDTO;

@Controller


public class SuperHostController {

	@Autowired
	private SuperHostDAO sdao; 
	
	@RequestMapping ("/superHostList.do")
	public ModelAndView superHost (@RequestParam(value="cp", defaultValue="1") int cp, 
			@RequestParam(value="type", defaultValue="1") int type
			){
		int totalCnt = sdao.getSuperHostTotalCnt(); 
		int listSize = 5;
		int pageSize = 5; 
		
		List<SuperHostDTO> list = sdao.superHostList(cp, listSize, type);
		
		
		String pageStr = korea.page.PageModule.makePage("superHostList.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav = new  ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/superHostList");
		return mav; 
		
	}
	
	
		
	
}
