package korea.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jcraft.jsch.Session;

import korea.msg.model.MsgDAO;
import korea.msg.model.MsgDTO;

@Controller
public class MsgController {
	@Autowired 
	private MsgDAO mdao; 
	
	@RequestMapping("/msgList.do")
	public ModelAndView msgList(
			@RequestParam(value = "cp", defaultValue ="1") int cp ,
			HttpServletRequest req, 
			HttpServletResponse resp
			){
		
		//sId
	//	HttpSession session = req.getSession(); 
		
		//int userIdx =(Integer) session.getAttribute("sId");
		
		int userIdx = 1 ;
	
		int totalCnt = mdao.getTotalCnt(userIdx);
	System.out.println("totalCnt "+totalCnt);
		
		
		int listSize = 5;
		int pageSize = 5;
		
		
		
		List<MsgDTO> list = mdao.msgList(cp, listSize, 1);
		
		
		String pageStr = korea.page.PageModule.makePage("msgList.do", totalCnt, listSize, pageSize, cp);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("msg/msgList");
	
		return mav ; 
	}
	
	
	
	
	
}
