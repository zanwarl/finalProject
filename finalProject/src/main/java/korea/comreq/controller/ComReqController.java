package korea.comreq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import korea.comreq.model.ComReqDAO;
import korea.comreq.model.ComReqDTO;

@Controller
public class ComReqController {
	@Autowired
	private ComReqDAO crdao;
	
	
	@RequestMapping("/comReq.do")
		
	public String comReq() {
		
		return "comreq/comReqWrite";
	}
	
	@RequestMapping("/comReqWrite.do")

		public ModelAndView comReqWrite(ComReqDTO crdto){
		System.out.println(crdto.getComreq_cate());
			ModelAndView mav = new ModelAndView();
			int result = crdao.comReqWrite(crdto);
			String msg = result>0?"등록성공":"등록실패";
			mav.setViewName("comreq/comReqOk");
			mav.addObject("msg", msg);
			return mav;
		}
	}
	

