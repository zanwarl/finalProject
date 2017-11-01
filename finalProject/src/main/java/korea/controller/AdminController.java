package korea.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.admin.model.AdminDAO;

@Controller
public class AdminController {

	
	
	@Autowired
	AdminDAO adao ; 
	
	
	@RequestMapping(value="/adminLogin.do", method= RequestMethod.GET)
	public String adminLoginFm (){
		return "admin/adminLoginFm";
	}

	
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	public ModelAndView adminLogin (@RequestParam("idx")int idx, 
			@RequestParam("pwd")String userPwd,
			HttpServletRequest req, 
			HttpServletResponse resp, 
			@RequestParam (value="saveId", required=false)String saveId
			) {
		
		boolean res = adao.login(idx, userPwd);
		
		if (res ){
			HttpSession session = req.getSession();
			session.setAttribute("sId", idx);
			
			
			
		}
		
		Cookie ck = new Cookie( "saveId", Integer.toString(idx));
		if(saveId==null ||saveId.equals("") ){
			ck.setMaxAge(0);
			
		}
		else {
			ck.setMaxAge(60*5);
		}
		resp.addCookie(ck);
		
		String msg = res? "success": "fail";
		String goURL = res? "adminMain.do": "adminLogin.do";
		
		ModelAndView mav= new ModelAndView(); 
		mav.setViewName("admin/adminMsg");
		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);
		
		return mav; 
	}
	
	
	@RequestMapping ("/adminMain.do")
	public String adminMain (){
		return "admin/adminMain";
		
	}
	
	
	@RequestMapping ("/adminLogout.do")
	public String adminLogout (HttpServletRequest req, HttpServletResponse resp){
		
		HttpSession session = req.getSession(); 
		session.invalidate();
		
		
		return "admin/adminMain";
		
	}
	

	
	
	
}
