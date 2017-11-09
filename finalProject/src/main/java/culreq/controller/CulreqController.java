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
	
	@RequestMapping("/culreqList.do")
	public ModelAndView culreq(){
		
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
	public ModelAndView culreqCon1(CulreqDTO crdto){
		
		int result = crdao.culreqAdd(crdto);

		String goURL = "culreqCon2.do?idx="+crdto.getCreq_idx();
		System.out.println(crdto.getCreq_idx());
		
		String msg = result>0? "예약완료":"다시 예약해주세요";
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("reqmsg",msg);
		mav.setViewName("culreq/reqmsg");		

		mav.addObject("goURL",goURL);
		mav.setViewName("culreq/culreqCon2");
		
		return mav;
	}
	
	
	@RequestMapping(value="/culreqCon2.do")
	public ModelAndView culreqCon2(@RequestParam(value="idx")int idx){
		
		CulreqDTO crdto = crdao.culreqCon2(idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("crdto",crdto);
		mav.setViewName("culreq/culreqCon2");
		 
		return mav;
	}

	
	/*@RequestMapping("/payMent.do")
	public ModelAndView payMent(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pay/payMent");
		
		return mav;
	}*/
}

