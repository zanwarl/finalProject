package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.complain.model.ComplainDAO;
import korea.complain.model.ComplainDTO;

@Controller
public class ComplainController {
	
	@Autowired 
	private ComplainDAO comdao;
	
	
/*	@RequestMapping (value ="/sendMail.do", method=RequestMethod.GET)
	public String sendMailFm(){
		return "complain/mailForm";
		
	}*/
	
	
	
	
	@RequestMapping(value="/userInfo.do")
	public ModelAndView userInfo (@RequestParam (value="idx")int idx){
	//	int res = comdao.givePenalty(idx);
	//	String msg = res>0? "success": "fail";
	//	String goURL ="complainList.do";
		
		ModelAndView mav= new ModelAndView(); 
		mav.setViewName("complain/userInfo");
		mav.addObject("idx", idx);
		
		
		return mav; 
		
		
		
		
		
	}
	
	@RequestMapping(value="/givePenalty.do")
	public ModelAndView givePenalty (@RequestParam (value="idx")int idx){
		int res = comdao.givePenalty(idx);
		String msg = res>0? "success": "fail";
		String goURL ="complainList.do";
		
		ModelAndView mav= new ModelAndView(); 
		mav.setViewName("admin/closeMsg");
		mav.addObject("msg", msg);
		
		return mav; 
		
		
		
		
		
	}
	
	
	@RequestMapping (value = "/complainAns.do", method= RequestMethod.POST)
	public ModelAndView complainAns (
			@RequestParam (value="incharge")String incharge, 
			@RequestParam (value="resContent")String resContent, 
			@RequestParam (value="idx")int idx
			
			
			//String incharge, String resContent, int idx
			
			){

		
		int res = comdao.complainAns(incharge, resContent, idx);
		String msg = res>0? "성공":"실패";
		String goURL = res>0? "complainList.do":"complainContent.do?idx="+idx;
		
		
		
		
		
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);
		
		mav.setViewName("admin/adminMsg");
		return mav ; 
	}
	
	
	@RequestMapping("/complainList.do")
	public ModelAndView complainList(@RequestParam(value = "cp", defaultValue ="1") int cp ){
		
		
		int totalCnt = comdao.getTOtalCnt(); 
		
		int listSize = 5;
		int pageSize = 5;
		
		
		
		List<ComplainDTO> list = comdao.complainList(cp,listSize);
		
		String pageStr = korea.page.PageModule.makePage("complainList.do", totalCnt, listSize, pageSize, cp);
		
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("complain/complainList");
	
		return mav ; 
	}
	
	
	
	
	@RequestMapping("/noAnsComplainList.do")
	public ModelAndView noAnsComplainList(@RequestParam(value = "cp", defaultValue ="1") int cp ){
		
		
		int totalCnt = comdao.getTOtalCnt(); 
		
		int listSize = 5;
		int pageSize = 5;
		
		
		
		List<ComplainDTO> list = comdao.noAnsComplainList(cp, listSize);
		
		
		String pageStr = korea.page.PageModule.makePage("noAnsComplainList.do", totalCnt, listSize, pageSize, cp);
		
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("complain/noAnsComplainList");
		
		return mav ; 
	}
	
	
	
	@RequestMapping("/complainSearch.do")
	public ModelAndView complainSearchList(@RequestParam(value = "cp", defaultValue ="1") int cp ,
			@RequestParam(value = "key", defaultValue ="1") int key ,
			@RequestParam(value = "val", defaultValue ="") String val  
			
			){
		
		
		

		int listSize = 5;
		int pageSize = 5;
		
		
		int totalCnt =comdao.getTOtalCnt(key, val);
		
		List<ComplainDTO> list =comdao.searchComplainList(cp, listSize, key, val);
		

		//searchComplainList
		
		
		String pageStr = korea.page.PageModule.makePage("complainSearch.do", totalCnt, listSize, pageSize, cp);
		
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("complain/searchList");
		
		return mav ; 
	}
	
	
	
	@RequestMapping ("/complainContent.do")
	public ModelAndView complainContent (@RequestParam("idx")int idx){
		
		ComplainDTO dto = comdao.complainContetn(idx);
		dto.setContent(dto.getContent().replaceAll("\r", "<br>"));
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("con", dto);
		mav.setViewName("complain/complainContent");
		
		
		return mav; 
		
	}
	

		@RequestMapping("/comReq.do")
			
		public String comReq() {
			
			return "comreq/comReqWrite";
		}
		
		@RequestMapping("/comReqWrite.do")

			public ModelAndView comReqWrite(ComplainDTO dto){
				ModelAndView mav = new ModelAndView();
				int result = comdao.comReqWrite(dto);
				String msg = result>0?"등록성공":"등록실패";
				mav.setViewName("comreq/comReqOk");
				mav.addObject("msg", msg);
				return mav;
			}
		}
		

	


