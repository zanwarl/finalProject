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

import korea.msg.model.MsgDAO;
import korea.msg.model.MsgDTO;

@Controller
public class MsgController {
	@Autowired
	private MsgDAO mdao;

	@RequestMapping(value = "/sendMsg.do", method = RequestMethod.GET)
	public ModelAndView sendMsgFm(@RequestParam(value = "receiver") String receiver, HttpServletRequest req,
			HttpServletResponse resp) {
		//

		// receiver = 2;

		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("sId");
		int sender = mdao.getUserIdx(userId);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("msg/sendMsg");
		mav.addObject("sender", sender);

		return mav;

	}

	@RequestMapping(value = "/sendMsg.do", method = RequestMethod.POST)
	public ModelAndView sendMsg(@RequestParam(value = "receiver") String receiver, MsgDTO dto, HttpServletRequest req,
			HttpServletResponse resp) {

		// int sender = 1 ;
		HttpSession session = req.getSession();
		String sender = (String) session.getAttribute("sId");
		// int sender = mdao.getUserIdx(userId);

		// 기존에 대화가 있는지 찾기

		int msgIdx = 0;
		boolean isFirst = mdao.isFirst(sender, receiver);
		if (isFirst) {
			// 기존 대화가 있으면
			msgIdx = mdao.getMsgIdx(sender, receiver);
			// 없으면
		} else {
			msgIdx = mdao.getMaxMsgIdx(sender);

		}

		dto.setMsgIdx(msgIdx);

		dto.setSender(sender);
		dto.setReceiver(receiver);

		ModelAndView mav = new ModelAndView();
		int res = mdao.sendMsg(dto);
		String goURL = res > 0 ? "msgContent.do?msgIdx="+dto.getMsgIdx() : "/sendMsg.do?receiver=" + receiver;
		String msg = res > 0 ? "성공" : "실패	";
		mav.addObject("msg", msg);

		mav.addObject("goURL", goURL);

		mav.setViewName("admin/adminMsg");

		return mav;

		//

	}

	@RequestMapping("/msgList.do")
	public ModelAndView msgList(@RequestParam(value = "cp", defaultValue = "1") int cp, HttpServletRequest req,
			HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String userIdx = (String) session.getAttribute("sId");
		// int userIdx = mdao.getUserIdx(userId);

		// int userIdx = 1;

		int totalCnt = mdao.getTotalCnt(userIdx);
		// System.out.println("totalCnt "+totalCnt);

		int listSize = 5;
		int pageSize = 5;

		List<MsgDTO> list = mdao.msgList(cp, listSize, userIdx);

		String pageStr = korea.page.PageModule.makePage("msgList.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		// mav.addObject("sIdx", userIdx);

		mav.setViewName("msg/msgList");

		return mav;
	}

	@RequestMapping("/msgContent.do")
	public ModelAndView msgContent(@RequestParam(value = "msgIdx") int msgIdx, HttpServletRequest req,
			HttpServletResponse resp) {

		HttpSession session = req.getSession();
		String userIdx = (String) session.getAttribute("sId");

		int read = mdao.readMsg(msgIdx, userIdx);

		List<MsgDTO> list = mdao.msgContent(msgIdx);

		String partner = list.get(0).getSender().equals(userIdx) ? list.get(0).getReceiver() : list.get(0).getSender();

		

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", list);
		// mav.addObject("pageStr", pageStr);
		mav.addObject("partner", partner);
		

		mav.setViewName("msg/msgContent");

		return mav;
	}

}
