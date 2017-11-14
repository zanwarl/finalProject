package korea.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.roomAdd.model.RoomAddDAO;
import korea.roomAdd.model.RoomAddDTO;

@Controller
public class RoomAddController {

	@Autowired
	private RoomAddDAO radao;
	
	@RequestMapping(value="/home.do",method=RequestMethod.GET)
	public ModelAndView roomList(){
		
		List<RoomAddDTO> list = radao.roomList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.setViewName("room/roomList");
		return mav;
	}
	
	@RequestMapping(value="/roomadd.do")
	public ModelAndView roomAdd(){
		ModelAndView mav = new ModelAndView();
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
}
