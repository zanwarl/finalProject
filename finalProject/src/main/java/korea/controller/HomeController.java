package korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import korea.room.model.RoomAddrDTO;
import korea.room.model.RoomDAO;

@Controller
public class HomeController {
	
	@Autowired
	private RoomDAO roomDao;
	
	/*@RequestMapping("/home.do")
	public ModelAndView home(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home/home");
		
		return mav;
	}*/
	
	@RequestMapping(value="/roomaddr.do",method=RequestMethod.GET)
	public ModelAndView roomAddrForm(){
		ModelAndView mav= new ModelAndView();
		mav.setViewName("room/roomAddrForm");
		
		return mav;
	}
	
	@RequestMapping(value="/roomaddr.do",method=RequestMethod.POST)
	public ModelAndView roomAddr(RoomAddrDTO ardto){
		
		int result = roomDao.roomaddr(ardto);
		int idx = roomDao.roomIdx();
		RoomAddrDTO radto = roomDao.roomAddrContent(idx);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("radto",radto);
		mav.setViewName("room/roomAddr");
		
		return mav;
	}
}
