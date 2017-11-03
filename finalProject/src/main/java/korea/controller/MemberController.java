package korea.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import korea.member.model.MemberDAO;
import korea.member.model.MemberDTO;

@Controller
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
	
}
