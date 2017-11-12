package korea.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import korea.member.model.MemberDAO;
import korea.member.model.MemberDTO;

@Controller
@SessionAttributes({"sId","sName","sIdx"})
public class MemberController {

	@Autowired
	private MemberDAO memberDao;


	@RequestMapping(value="/memberJoin.do",
			method=RequestMethod.GET)
	public String memberJoinForm() {
		return "member/memberJoin";
	}
	
	@RequestMapping("/memberJoin.do")
	public ModelAndView memberJoin(MemberDTO dto) {
		int result=memberDao.memberJoin(dto);		
		String msg=result>0?"ȸ�����Լ���!":"��Ͻ���";
		ModelAndView mav=new ModelAndView();		
		mav.addObject("msg",msg);
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("/memberCheckForm.do")
	public String memberCheckForm() {
		return "member/idCheck";
	}
	
	@RequestMapping(value="/memberCheck.do",method=RequestMethod.POST)
	public ModelAndView memberSelect(
			@RequestParam("userid")String userid) {
		boolean result=memberDao.memberSelect(userid);
		ModelAndView mav=new ModelAndView();
		if(result) {
			String msg="�̹� ���Ե� ���̵��Դϴ�.";
			mav.addObject("msg", msg);
			mav.setViewName("member/idCheckMsg");			
		}else {
			String msg=userid+"�� ��밡���� ���̵��Դϴ�.";
			mav.addObject("msg", msg);
			mav.addObject("userid", userid);
			mav.setViewName("member/idCheck_ok");
		}
		return mav;
	}
	
	@RequestMapping(value="/memberLogin.do", method= RequestMethod.GET)
	public String memberLoginFm (){
		return "member/memberLogin";
	}

	
	@RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
	public ModelAndView adminLogin (@RequestParam("member_id")String member_id, 
			@RequestParam("member_pwd")String member_pwd,
			HttpServletRequest req, 
			HttpServletResponse resp, 
			@RequestParam (value="saveId", required=false)String saveId
			) {
		ModelAndView mav= new ModelAndView(); 
		boolean res = memberDao.login(member_id, member_pwd);
		if (res){
			HttpSession session = req.getSession();
			session.setAttribute("sId", member_id);
			
			//2017.11.13 홍주영 memberdto 세션 추가!
			MemberDTO mdto = memberDao.memberInfo(member_id);
			
			mav.addObject("sIdx",mdto.getMember_idx());
			mav.addObject("sName",mdto.getMember_name());
		}
		
		Cookie ck = new Cookie( "saveId", member_id);
		if(saveId==null ||saveId.equals("") ){
			ck.setMaxAge(0);
			
		}
		else {
			ck.setMaxAge(60*5);
		}
		resp.addCookie(ck);
		
		String msg = res? "ȯ���մϴ�^^": "fail";
		String goURL = res? "main.do": "memberLogin.do";
		
		
		mav.setViewName("member/loginMsg");
		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);
		
		return mav; 
	}
	
	

	
	
	@RequestMapping ("/memberLogout.do")
	public String adminLogout (HttpServletRequest req, HttpServletResponse resp){
		
		HttpSession session = req.getSession(); 
		session.invalidate();
		
		
		return "main";
		
	}
	
}
