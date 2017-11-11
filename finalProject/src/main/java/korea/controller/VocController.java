/**
 * 1:1 문의 게시판 
 * 
 * 월요일에 수정할꼬 
 * 
 */



//package korea.controller;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//
//import korea.voc.model.VocDAO;
//import korea.voc.model.VocDTO;
//
//@Controller 
//public class VocController {
//	
//	@Autowired 
//	VocDAO vdao; 
//	
//	
//	@RequestMapping ( value ="/vocWrite.do" , method=RequestMethod.GET)
//	public String vocWriteFm (){
//		return "voc/vocWriteFm";
//		
//	}
//	
//	
//	
//	@RequestMapping( value="/vocWrite.do", method=RequestMethod.POST)
//
//	public ModelAndView vocWrite (VocDTO dto,
//			HttpServletRequest req,
//			HttpServletResponse resp ){
//		
//		
//		
//		HttpSession session = req.getSession();
//		String writer = (String) session.getAttribute("sId");
//		
//		dto.setWriter(writer);
//		
//		int ref = vdao.getVocMaxRef();
//		
//		
//		
//		int res = vdao.vocWrite(dto);
//		
//		
//		
//	}
//}
