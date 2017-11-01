package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.black.model.BlackDAO;
import korea.black.model.BlackDTO;

@Controller
public class BlackController {
	
	
	@Autowired
	private BlackDAO blackdao; 
	
	@RequestMapping ("/blackList.do")
	public ModelAndView blackList (@RequestParam(value="cp", defaultValue="1") int cp){
		int totalCnt = blackdao.getTotalCnt(); 
		int listSize = 5;
		int pageSize = 5; 
		
		List<BlackDTO> list = blackdao.blackList(cp, listSize);
		
		String pageStr = korea.page.PageModule.makePage("blackList.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav = new  ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/blackList");
		return mav; 
		
		
		
	}
	

}
