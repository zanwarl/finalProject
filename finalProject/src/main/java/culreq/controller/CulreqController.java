package culreq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import culreq.model.CulreqDAO;
import culreq.model.CulreqDTO;

@Controller
public class CulreqController {

	@Autowired
	private CulreqDAO crdao;
	
	@RequestMapping("culreqList.do")
	public ModelAndView foodreq(){
		
		List<CulreqDTO> list = crdao.culreqList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.setViewName("culreq/culreqList");
		
		return mav;
	}
	
	@RequestMapping("/culreqCon1Form.do")
	public ModelAndView culreqCon1Form(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("culreq/culreqCon1");
		
		return mav;
	}
	
	@RequestMapping("/culreqCon1.do")
	public ModelAndView culreqCon1(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("culreq/culreqCon1");
		
		return mav;
	}
	
	
	@RequestMapping("/culreqCon2Form.do")
	public ModelAndView culreqCon2Form(@RequestParam("idx")int idx){
		
		CulreqDTO crdto = crdao.culreqContent(idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("crdto",crdto);
		mav.setViewName("culreq/culreqCon2");
		 
		return mav;
	}

	
	@RequestMapping("/payMent.do")
	public ModelAndView payMent(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pay/payMent");
		
		return mav;
	}
}

