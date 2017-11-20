package korea.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.servlet.ModelAndView;

import korea.member.model.MemberDAO;
import korea.member.model.MemberDTO;
import korea.plan.model.PlanDTO;

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
		String msg=result>0?"회원가입성공!":"등록실패";
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
			String msg="이미 가입된 아이디입니다.";
			mav.addObject("msg", msg);
			mav.setViewName("member/idCheckMsg");			
		}else {
			String msg=userid+"는 사용가능한 아이디입니다.";
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
		
		Cookie ck2 = new Cookie( "saveId2", member_id);
		if(saveId==null ||saveId.equals("") ){
			ck2.setMaxAge(0);
			
		}
		else {
			ck2.setMaxAge(60*5);
		} 	
		resp.addCookie(ck2);
		
		String msg = res? "환영합니다^^": "fail";
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
	
	
	@RequestMapping(value="/memberUpdate.do",
			method=RequestMethod.GET)
	public String updateForm() {
		return "member/memberUpdate";
	}
	
	@RequestMapping("/memberUpdate.do")
	public ModelAndView memberUpdate(MemberDTO dto) {
		int result=memberDao.memberUpdate(dto);		
		String msg=result>0?"회원수정성공!":"등록실패";
		ModelAndView mav=new ModelAndView();		
		mav.addObject("msg",msg);
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("/memberIdSeachForm.do")
	public String memberIdSeachForm() {
		return "member/idSeach";
	}
	
	@RequestMapping("/memberPwdSeachForm.do")
	public String memberPwdSeachForm() {
		return "member/pwdSeach";
	}
	
	@RequestMapping(value = "/memberIdSeach.do", method = RequestMethod.POST)
	public ModelAndView idSeach (@RequestParam("member_name")String member_name, 
			@RequestParam("member_email")String member_email			 
			) {
		
		String listt=memberDao.idSeach(member_name, member_email);
						
		ModelAndView mav= new ModelAndView(); 
				
		mav.addObject("listt",listt);
		mav.setViewName("member/idSeach_ok");
		System.out.println(listt);
		return mav; 
	}
	
	@RequestMapping(value = "/memberPwdSeach.do", method = RequestMethod.POST)
	public ModelAndView pwdSeach (@RequestParam("member_id")String member_id, 
			@RequestParam("member_email")String member_email			 
			) {
		
		String list2=memberDao.pwdSeach(member_id, member_email);
						
		ModelAndView mav= new ModelAndView(); 
				
		mav.addObject("list2",list2);
		mav.setViewName("member/pwdSeach_ok");
		
		return mav; 
	}
	
	@RequestMapping(value = "/userProfile.do")
	public ModelAndView userProfile (@RequestParam("userId")String userId
		) {
		
		
		

		
		ModelAndView mav= new ModelAndView(); 

		List<Map<String, Object>> planList = memberDao.myPlanListProfile(userId);
		

		List<Map<String, Object>> list = memberDao.myRoomListProfile(userId);
		int listSize = list.size() ; 

		System.out.println(listSize);
		List<Map<String, Object>> list1= list.subList(0, listSize/2);
		System.out.println("list1:"+list1);
	
		List<Map<String, Object>> list2= list.subList(listSize/2, listSize);
		
		
		System.out.println("list2:"+list2);

		
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("planList", planList);
		
		
		mav.setViewName("member/userProfile");
		
		return mav; 
	}


}
