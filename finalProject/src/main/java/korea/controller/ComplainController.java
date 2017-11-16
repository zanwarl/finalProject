package korea.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.complain.model.ComplainDAO;
import korea.complain.model.ComplainDTO;
import korea.member.model.MemberDTO;

@Controller
public class ComplainController {

	@Autowired
	private ComplainDAO comdao;

	@RequestMapping(value = "/userInfo.do")
	public ModelAndView userInfo(@RequestParam(value = "idx") int idx) {
		// int res = comdao.givePenalty(idx);
		// String msg = res>0? "success": "fail";
		// String goURL ="complainList.do";

		MemberDTO dto = comdao.getUserInfo(idx);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("complain/userInfo");
		mav.addObject("idx", idx);
		mav.addObject("userInfo", dto);

		return mav;

	}

	@RequestMapping(value = "/userInfo_noPenaltyBt.do")
	public ModelAndView userInfo_noPenaltyBt(@RequestParam(value = "idx") int idx) {
		// int res = comdao.givePenalty(idx);
		// String msg = res>0? "success": "fail";
		// String goURL ="complainList.do";

		MemberDTO dto = comdao.getUserInfo(idx);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("complain/userInfo_noPenaltyBt");
		mav.addObject("idx", idx);
		mav.addObject("userInfo", dto);

		return mav;

	}

	@RequestMapping(value = "/givePenalty.do")
	public ModelAndView givePenalty(@RequestParam(value = "idx") int idx) {
		int res = comdao.givePenalty(idx);
		String msg = res > 0 ? "success" : "fail";
		// String goURL ="complainList.do";

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/closeMsg");
		mav.addObject("msg", msg);

		return mav;

	}

	@RequestMapping(value = "/complainAns.do", method = RequestMethod.POST)
	public ModelAndView complainAns(@RequestParam(value = "incharge") String incharge,
			@RequestParam(value = "resContent") String resContent, @RequestParam(value = "idx") int idx

	// String incharge, String resContent, int idx

	) {

		int res = comdao.complainAns(incharge, resContent, idx);
		String msg = res > 0 ? "완료" : "실패";
		String goURL = res > 0 ? "complainList.do" : "complainContent.do?idx=" + idx;

		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);

		mav.setViewName("admin/adminMsg");
		return mav;
	}

	@RequestMapping("/complainList.do")
	public ModelAndView complainList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = comdao.getTOtalCnt();

		int listSize = 5;
		int pageSize = 5;

		List<ComplainDTO> list = comdao.complainList(cp, listSize);

		String pageStr = korea.page.PageModule.makePage("complainList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("complain/complainList");

		return mav;
	}

	@RequestMapping("/noAnsComplainList.do")
	public ModelAndView noAnsComplainList(@RequestParam(value = "cp", defaultValue = "1") int cp) {

		int totalCnt = comdao.getnoAnstotalCnt();
		
		int listSize = 5;
		int pageSize = 5;

		List<ComplainDTO> list = comdao.noAnsComplainList(cp, listSize);

		String pageStr = korea.page.PageModule.makePage("noAnsComplainList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("complain/noAnsComplainList");

		return mav;
	}

	@RequestMapping("/complainSearch.do")
	public ModelAndView complainSearchList(@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value = "key", defaultValue = "1") int key,
			@RequestParam(value = "val", defaultValue = "") String val

	) {

		int listSize = 5;
		int pageSize = 5;

		int totalCnt = comdao.getTOtalCnt(key, val);

		List<ComplainDTO> list = comdao.searchComplainList(cp, listSize, key, val);

		// searchComplainList

		String pageStr = korea.page.PageModule.makePage("complainSearch.do?key="+key+"&val="+val, totalCnt, listSize, pageSize, cp, "key="+key+"&val="+val);

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("complain/searchList");

		return mav;
	}

	/*
	 * 
	 * HttpServletRequest req, HttpServletResponse resp,
	 * 
	 * @RequestParam (value="saveId", required=false)String saveId ) {
	 * 
	 * boolean res = adao.login(idx, userPwd);
	 * 
	 * if (res ){ HttpSession session = req.getSession();
	 * session.setAttribute("adminIdx", idx);
	 * 
	 * 
	 */
	@RequestMapping("/myComplainList.do")
	public ModelAndView myComplainList(@RequestParam(value = "cp", defaultValue = "1") int cp, HttpServletRequest req,
			HttpServletResponse resp

	) {

		int key = 2;
		HttpSession s = req.getSession();
		String val = String.valueOf(s.getAttribute("sIdx"));

		int listSize = 5;
		int pageSize = 5;

		int totalCnt = comdao.getTOtalCnt(key, val);

		List<ComplainDTO> list = comdao.searchComplainList(cp, listSize, key, val);

		// searchComplainList

		String pageStr = korea.page.PageModule.makePage("myComplainList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);

		mav.setViewName("complain/myComplainList");

		return mav;
	}

	@RequestMapping("/myComplainContent.do")
	public ModelAndView myComplainContent(@RequestParam("idx") int idx) {

		ComplainDTO dto = comdao.complainContetn(idx);
		dto.setContent(dto.getContent().replaceAll("\r", "<br>"));

		ModelAndView mav = new ModelAndView();
		mav.addObject("con", dto);
		mav.setViewName("complain/myComplainContent");

		return mav;

	}

	@RequestMapping("/complainContent.do")
	public ModelAndView complainContent(@RequestParam("idx") int idx) {

		ComplainDTO dto = comdao.complainContetn(idx);
		dto.setContent(dto.getContent().replaceAll("\r", "<br>"));

		ModelAndView mav = new ModelAndView();
		mav.addObject("con", dto);
		mav.setViewName("complain/complainContent");

		return mav;

	}

	@RequestMapping("/comReq.do")

	public ModelAndView comReq(HttpServletRequest req, HttpServletResponse resp, 
			@RequestParam(value="receiver")int receiver 
			) {

		ModelAndView mav = new ModelAndView();

		HttpSession session = req.getSession();

		if (session.getAttribute("sIdx") == null) {
			mav.setViewName("admin/adminMsg");
			mav.addObject("msg", "로그인 하세요");
			mav.addObject("goURL", "main.do");
			return mav;
		} else {
			mav.addObject("receiver",receiver);
			
			mav.setViewName("comreq/comReqWrite");
			return mav;
		}
	}

	@RequestMapping("/comReqWrite.do")

	public ModelAndView comReqWrite(ComplainDTO dto, HttpServletRequest req, HttpServletResponse resp

	) {

		HttpSession session = req.getSession();
		int sender = (Integer) session.getAttribute("sIdx");
		dto.setSender(sender);

		ModelAndView mav = new ModelAndView();
		int result = comdao.comReqWrite(dto);
		String msg = result > 0 ? "신고가 등록되었습니다." : "실패";
		mav.setViewName("comreq/comReqOk");
		mav.addObject("msg", msg);
		return mav;
	}

	@RequestMapping(value = "/blackListInfo.do")
	public ModelAndView blackListInfo(@RequestParam("userIdx") int userIdx) {
		ModelAndView mav = new ModelAndView();
		List<ComplainDTO> receiveList = comdao.receiveComplainList(userIdx);
		List<ComplainDTO> writeList = comdao.writeComplainList(userIdx);

		mav.addObject("receiveList", receiveList);
		mav.addObject("writeList", writeList);

		mav.setViewName("admin/blackListInfo");
		return mav;

	}

}
