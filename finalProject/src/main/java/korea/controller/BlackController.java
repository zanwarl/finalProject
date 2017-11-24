package korea.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.black.model.BlackDAO;

@Controller
public class BlackController {
	
	
	@Autowired
	private BlackDAO blackdao; 
	
	@RequestMapping ("/blackList.do")
	public ModelAndView blackList (@RequestParam(value="cp", defaultValue="1") int cp){
		
		
		int res= blackdao.updateBlackList();
		
		
		int totalCnt = blackdao.getTotalCnt(); 
		int listSize = 5;
		int pageSize = 5; 
		
		List<Map<String, Object>> list = blackdao.blackList(cp, listSize);
		
		String pageStr = korea.page.PageModule.makePage("blackList.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav = new  ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/blackList");
		return mav; 
		
		
		
	}
	
	
	@RequestMapping ("/deleteBlackList.do")
	public ModelAndView deleteBlackList(
			@RequestParam ( value = "idx" )int idx
			) {
		
		int res1 = blackdao.deleteblacklist2(idx);
		int res = blackdao.deleteblacklist(idx);
		
		
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("admin/adminMsg");
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("goURL", "blackList.do");
		return mav ; 
		
		
	}
	
	@RequestMapping ("/blackSearchList.do")
	public ModelAndView blackSearchList (
			@RequestParam(value="cp", defaultValue="1") int cp, 
			@RequestParam(value="id") String id
			
			){
		
		
		int res= blackdao.updateBlackList();
		
		
		int totalCnt = blackdao.getSearchTotalCnt(id);
		
		int listSize = 5;
		int pageSize = 5; 
		
		List<Map<String, Object>> list = blackdao.blackSearchList(cp, listSize, id);
		
		String pageStr = korea.page.PageModule.makePage("blackSearchList.do?id="+id, totalCnt, listSize, pageSize, cp, "id="+id);
		
		ModelAndView mav = new  ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/blackSearchList");
		return mav; 
		
		
		
	}
	

}
