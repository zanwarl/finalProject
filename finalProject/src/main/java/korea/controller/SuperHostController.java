package korea.controller;

import java.util.List;
import java.util.Map;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.superHost.model.SuperHostDAO;
import korea.superHost.model.SuperHostDTO;

@Controller


public class SuperHostController {

	@Autowired
	private SuperHostDAO sdao; 
	
	@RequestMapping(value="/superHostUpdate.do", method=RequestMethod.GET)
	public String superHostUpdateFm (){
		return "admin/superHostUpdate"; 
		
	}
	
	@RequestMapping(value="/superHostUpdate.do", method=RequestMethod.POST)
	public ModelAndView superHostUpdate (int point){
		
		int delRes = sdao.deleteSuper(); 
		String goURL ; 
		String msg; 
		
		ModelAndView mav = new  ModelAndView(); 
		if (delRes>0){
			int updateRes = sdao.updateSuper(point);
			 msg = updateRes>0?"success":"fail";
			
		}
		else {
			 msg = "fail";
			
			
		}
		 goURL = "superHostList.do";
		
		mav.addObject("goURL",goURL );
		mav.addObject("msg",msg );
		
		mav.setViewName("admin/adminMsg");
		
		
		return mav; 
		
		
	}
	
	@RequestMapping ( value = "/superHostList.do" , method=RequestMethod.GET)
	public ModelAndView superHost (@RequestParam(value="cp", defaultValue="1") int cp 
			
			){
		
		
		
	//	int max = 10 ; 
		
		int totalCnt =sdao.getSuperHostTotalCnt(); 
		
		int listSize = 5;
		int pageSize = 5; 
		
		List<SuperHostDTO> list = sdao.superHostList(cp, listSize);
		
		
		String pageStr = korea.page.PageModule.makePage("superHostList.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav = new  ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/superHostList");
		return mav; 
		
	}
	
	
	@RequestMapping ( value = "/superHostSearch.do" , method=RequestMethod.GET)
	public ModelAndView superHostSearch (
			@RequestParam(value="cp", defaultValue="1") int cp,  
			@RequestParam(value="id") String id  
			
			){
		
		
		
		//	int max = 10 ; 
		
		int totalCnt =sdao.superHostSearchTotalCnt(id);
		
		int listSize = 5;
		int pageSize = 5; 
		
		List<SuperHostDTO> list = sdao.superHostSearchList(cp, listSize, id);
		
		
		String pageStr = korea.page.PageModule.makePage("superHostSearch.do?id="+id, totalCnt, listSize, pageSize, cp, "1");
		
		ModelAndView mav = new  ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/superHostSearchList");
		return mav; 
		
	}
	
	
		
	
}
