/**
 * 1:1 ���� �Խ��� 
 * 
 * �����Ͽ� �����Ҳ� 
 * 
 */

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

import korea.voc.model.VocDAO;
import korea.voc.model.VocDTO;

@Controller
public class VocController {

	@Autowired
	VocDAO vdao;

	/*
	 * @RequestMapping(value= "/vocDel.do" , method=RequestMethod.GET) public
	 * String delFm (){ return "voc/vocDel";
	 * 
	 * }
	 */

	@RequestMapping(value = "/vocDel.do", method = RequestMethod.GET)
	public ModelAndView vocDel(@RequestParam("idx") int idx) {

		int res = vdao.vocDel(idx);
		String msg = res > 0 ? "success" : "fail";
		String goURL = res > 0 ? "vocList.do" : "vocList.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);

		mav.setViewName("admin/adminMsg");
		return mav;

	}

	@RequestMapping(value = "/vocReWrite.do", method = RequestMethod.GET)
	public ModelAndView rewriteFm() {

/*		VocDTO dto = vdao.vocCon(idx);
		*/
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("voc/vocReWrite");
		return mav;
	}

	@RequestMapping(value = "/vocReWrite.do", method = RequestMethod.POST)
	public ModelAndView rewrite(VocDTO dto 
	
			) {

		
	
/*		
		HttpSession session = req.getSession(); 
		String writer = (String) session.getAttribute("sId");
		
		dto.setWriter(writer);
		*/
		int res = vdao.vocReWrite(dto);
		String msg = "";

		if (res > 0) {
			msg = "success";

		} else
			msg = "fail";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);

		String goURL = res > 0 ? "vocListAdmin.do" : "vocReWrite.do";
		mav.addObject("goURL", goURL);

		mav.setViewName("admin/adminMsg");
		return mav;
	}

	@RequestMapping("/vocList.do")
	public ModelAndView vocList(@RequestParam(value = "cp", defaultValue = "1") int cp, 
			HttpServletRequest req, 
			HttpServletResponse resp
			) {
		//

		
		// paging
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession(); 
		String writer = (String) session.getAttribute("sId");
		
		
		if ( writer==null || writer.equals("")){
		mav.setViewName("admin/adminMsg");
		mav.addObject("goURL", "main.do");
		mav.addObject("msg", "로그인하세요");
		return mav; 
		}
		
		
		int totalCnt = vdao.getTotaMylCnt(writer);
		
		

		int listSize = 5;
		int pageSize = 5;

		List<VocDTO> list = vdao.vocMyList(cp, listSize, writer);
		
		String pageStr = korea.page.PageModule.makePage("vocList.do", totalCnt, listSize, pageSize, cp);

		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("voc/vocList");
		return mav;
	}
	@RequestMapping("/vocSearchList.do")
	public ModelAndView vocSearchList(
			@RequestParam(value = "cp", defaultValue = "1") int cp, 
			@RequestParam(value="writer")String writer 
			) {
		//
		
		
		// paging
		ModelAndView mav = new ModelAndView();
		

		
		int totalCnt = vdao.getTotaMylCnt(writer);
		
		
		int listSize = 5;
		int pageSize = 5;
		
		List<VocDTO> list = vdao.vocMyList(cp, listSize, writer);
		
		String pageStr = korea.page.PageModule.makePage("vocSearchList.do", totalCnt, listSize, pageSize, cp);
		
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("value", writer);
		mav.setViewName("voc/vocSearchList");
		return mav;
	}

	@RequestMapping("/vocListAdmin.do")
	public ModelAndView vocListAdmin(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		//
		
		// paging
		
		int totalCnt = vdao.getTotalCnt();
		
		int listSize = 5;
		int pageSize = 5;
		
		List<VocDTO> list = vdao.vocAllList(cp, listSize);
		
		String pageStr = korea.page.PageModule.makePage("vocListAdmin.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("voc/vocListAdmin");
		return mav;
	}
	@RequestMapping("/vocNoAnsList.do")
	public ModelAndView vocNoAnsList(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		//
		
		// paging
		
		int totalCnt = vdao.getNoAnsTotalCnt();
		
		int listSize = 5;
		int pageSize = 5;
		
		List<VocDTO> list = vdao.vocNoAnsList(cp, listSize);
		
		String pageStr = korea.page.PageModule.makePage("vocNoAnsList.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("voc/vocNoAnsList");
		return mav;
	}

	/**
	 * voc write fm
	 * 
	 * @return
	 */
	@RequestMapping(value = "/vocWrite.do", method = RequestMethod.GET)
	public String vocWriteFm() {
		return "voc/vocWrite";

	}

	/**
	 * voc write method
	 * 
	 * @param dto
	 * @return
	 */
	@RequestMapping(value = "/vocWrite.do", method = RequestMethod.POST)
	public ModelAndView vocWrite(VocDTO dto, 	
			HttpServletRequest req, 
			HttpServletResponse resp
			
			) {

		
		HttpSession session = req.getSession(); 
		String writer = (String) session.getAttribute("sId");
		
		dto.setWriter(writer);
		
		
		int res = vdao.vocAdd(dto);
		String msg = res > 0 ? "success" : "fail";

		String goURL = res > 0 ? "vocList.do" : "vocList.do";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goURL", goURL);
		mav.setViewName("admin/adminMsg");
		return mav;

	}

	@RequestMapping(value = "/vocCon.do")
	public ModelAndView vocCon(@RequestParam("idx") int idx) {

		VocDTO dto = vdao.vocCon(idx);
		dto.setContent(dto.getContent().replaceAll("\r", "<br>"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("con", dto);

		mav.setViewName("voc/vocCon");
		return mav;

	}
	@RequestMapping(value = "/vocConAdmin.do")
	public ModelAndView vocConAdmin(@RequestParam("idx") int idx) {
		
		VocDTO dto = vdao.vocCon(idx);
		dto.setContent(dto.getContent().replaceAll("\r", "<br>"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("con", dto);
		
		mav.setViewName("voc/vocConAdmin");
		return mav;
		
	}

}
