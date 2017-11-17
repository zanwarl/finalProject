package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.rebbs.model.ReBbsDAO;
import korea.rebbs.model.ReBbsDTO;

@Controller
public class ReviewBbsController {

	@Autowired
	private ReBbsDAO rbdao;
	
	@RequestMapping("/reBbsList.do")
	public ModelAndView reBbsList(@RequestParam(value="cp",defaultValue="1")int cp){
		
		int totalCnt=rbdao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=korea.page.PageModule.makePage("reBbsList.do", totalCnt, listSize, pageSize, cp);
		List<ReBbsDTO> list=rbdao.reBbsList(cp, listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("reBbs/reBbsList");
		return mav;
	}
	
	@RequestMapping(value="/reBbsWrite.do", method=RequestMethod.GET)
	public String reBbsWriteForm(){
		return "reBbs/reBbsWrite";
	}
	
	@RequestMapping(value="/reBbsWrite.do", method=RequestMethod.POST)
	public ModelAndView reBbsWriteSubmit(ReBbsDTO dto){
		int result=rbdao.reBbsWrite(dto);
		String msg=result>0?"글쓰기 성공":"글쓰기 실패";
		ModelAndView mav=new ModelAndView();
		mav.setViewName("reBbs/reBbsMsg");
		mav.addObject("msg", msg);
		return mav;
	}
	
	@RequestMapping("/reBbsContent.do")
	public ModelAndView reBbsContent(int idx){
		ReBbsDTO dto=rbdao.reBbsContent(idx);
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("reBbs/reBbsContent");
		return mav;
	}
	
}
