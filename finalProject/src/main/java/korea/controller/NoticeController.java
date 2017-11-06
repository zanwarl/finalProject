package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.black.model.BlackDTO;
import korea.notice.model.NoticeDAO;
import korea.notice.model.NoticeDTO;

@Controller

public class NoticeController {
	
	@Autowired 
	NoticeDAO ndao  ; 
	
	
/*	

	@RequestMapping (value="/noticeList.do")
	public String noticeList (){
		return "notice/noticeList";
		
	}*/
	
	@RequestMapping (value="/noticeWrite.do" , method=RequestMethod.GET)
	public String noticeWriteFm (){
		return"notice/noticeWrite";
		
		
	}
	@RequestMapping (value="/noticeWrite.do" , method=RequestMethod.POST)
	public ModelAndView noticeWrite (NoticeDTO dto ){
		
		int res = ndao .noticeWrite(dto);
		String msg = res>0? "글쓰기 성공": "실패";
		String goURL = res>0?"noticeList.do":"noticeWrite.do";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);
		
		
		mav.setViewName("admin/adminMsg");
		
		return mav; 
		
		
	
		
	}
	
	@RequestMapping ("/noticeList.do")
	public ModelAndView noticeList (@RequestParam(value="cp", defaultValue="1") int cp){
		
		int totalCnt = ndao.getTotalCnt(); 
		
		int listSize = 5;
		int pageSize = 5; 
		
		List<NoticeDTO> list =ndao.noticeList(cp, listSize);
		
		String pageStr = korea.page.PageModule.makePage("noticeList.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav = new  ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("notice/noticeList");
		return mav; 
		
		
		
	}
	
	
	
}
