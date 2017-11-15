package korea.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.msg.model.MsgDAO;
import korea.roomAdd.model.RoomAddDAO;
import korea.roomAdd.model.RoomAddDTO;

@Controller
public class RoomAddController {

	@Autowired
	private RoomAddDAO radao;
	@Autowired
	private MsgDAO mdao;
	
	@RequestMapping(value="/home.do",method=RequestMethod.GET)
	public ModelAndView roomList(){
		
		List<RoomAddDTO> list = radao.roomList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.setViewName("room/roomList");
		return mav;
	}
	
	@RequestMapping(value="/roomadd.do")
	public ModelAndView roomAdd(HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("sId");
		int useridx = mdao.getUserIdx(userId);
		
		mav.addObject("useridx",useridx);
		mav.setViewName("room/roomAddForm");
		return mav;
	}
	
	@RequestMapping(value="/home.do", method=RequestMethod.POST )
	public ModelAndView roomAdd(RoomAddDTO rdto){
		radao.roomAdd(rdto);
		ModelAndView mav=new ModelAndView("redirect:home.do");
		return mav;
	}
	
	@RequestMapping(value="/roomContent.do")
	public ModelAndView roomContent(@RequestParam("roomidx")int idx){
		
		RoomAddDTO rdto  = radao.roomContent(idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("rdto",rdto);
		mav.setViewName("room/roomContent");
		
		return mav;
	}
	
	@RequestMapping(value="/roomUpdate.do",method=RequestMethod.GET)
	public ModelAndView roomUpdateForm(@RequestParam("idx")int idx){
		
		ModelAndView mav = new ModelAndView();
		RoomAddDTO rdto = radao.roomUpdateData(idx);
		
		mav.addObject("rdto",rdto);
		mav.setViewName("room/roomUpdateForm");
		return mav;
	}
	
	@RequestMapping(value="/roomUpdate.do",method=RequestMethod.POST)
	public ModelAndView roomUpdate(RoomAddDTO rdto){
		radao.roomUpdate(rdto);
		ModelAndView mav = new ModelAndView("redirect:home.do");
		return mav;
	}
	
	@RequestMapping(value="/roomDelete.do")
	public ModelAndView roomDelete(@RequestParam("idx")int idx){
		radao.roomDelete(idx);
		ModelAndView mav = new ModelAndView("redirect:home.do");
		return mav;
	}
}
