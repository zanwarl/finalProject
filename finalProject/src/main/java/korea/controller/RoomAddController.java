package korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import korea.roomAdd.model.RoomAddDAO;
import korea.roomAdd.model.RoomAddDTO;

@Controller
public class RoomAddController {

	@Autowired
	private RoomAddDAO radao;
	
	@RequestMapping(value="/home.do", method=RequestMethod.POST)
	public ModelAndView roomAdd(RoomAddDTO dto){
		int result=radao.roomAdd(dto);
		String msg=result>0?"등록 성공":"등록실패";
		ModelAndView mav=new ModelAndView();
		mav.setViewName("room/roomAdd");
		mav.addObject("msg", msg);
		return mav;
	}
}
