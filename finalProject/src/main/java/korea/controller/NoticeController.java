package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.black.model.BlackDTO;
import korea.complain.model.ComplainDTO;
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
	
	@RequestMapping ("/noticeContent.do")
	public ModelAndView noticeContent (@RequestParam("idx")int idx){
		
		NoticeDTO dto = ndao.noticeContent(idx);
		
		dto.setContent(dto.getContent().replaceAll("\r", "<br>"));
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("con", dto);
		mav.setViewName("notice/noticeContent");
		
		
		return mav; 
		
	}
	
	@RequestMapping (value="/noticeUpdate.do" , method=RequestMethod.GET)
	public ModelAndView noticeUpdateFm (@RequestParam ("idx" )int idx){
		
		NoticeDTO dto = ndao.noticeContent(idx);
		dto.setContent(dto.getContent().replaceAll("\r", "<br>"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("con", dto);
		
		mav.setViewName("notice/noticeUpdate");
		
		
		return mav; 
		
	}
	
	
			
	@RequestMapping (value="/noticeUpdate.do" , method=RequestMethod.POST)
	public ModelAndView noticeUpdate  (int noticeIdx , String title,String content){
		
//		NoticeDTO dto = ndao.noticeContent(idx);
		//dto.setContent(dto.getContent().replaceAll("\r", "<br>"));
		
		int res =ndao.noticeUpdate(noticeIdx, title, content);
	
		String msg = res>0? "글이 수정되었습니다": "실패";
		String goURL = res>0?"noticeList.do":"noticeUpdate.do?idx="+noticeIdx;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);
		
		
		mav.setViewName("admin/adminMsg");
		
		return mav; 
		

	}
	
	
	@RequestMapping (value="noticeDeleteConfirm.do" , method= RequestMethod .GET)
	public ModelAndView noticeDeleteConfirm (@RequestParam ("idx")int idx){
		ModelAndView mav = new ModelAndView();
		String confirmMsg= "삭제하시겠습니까?";
		String yesURL = "noticeDelete.do?idx="+idx; 
		String noURL = "noticeContent.do?idx="+idx	;
		
	
		
		mav.addObject("confirmMsg", confirmMsg	);
		mav.addObject("yesURL", yesURL	);
		mav.addObject("noURL", noURL	);
		mav.setViewName("admin/confirmMsg");
		
		return mav ; 
		
	}
	
	
	@RequestMapping (value="/noticeDelete.do" )
	public ModelAndView noticeDelete (@RequestParam ("idx")int idx){
		
		int res =ndao.noticeDelete(idx);
		
		//String confirmMsg ="글을 삭제하시겠습니까";
		
		String msg = res>0? "글이 삭제되었습니다.": "실패";
		String goURL = res>0?"noticeList.do":"noticeContent.do?idx="+idx;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);
	//	mav.addObject("confirmMsg", confirmMsg);
		
		
		
		mav.setViewName("admin/adminMsg");
		
		return mav; 
		
	}
	
	
	
}
