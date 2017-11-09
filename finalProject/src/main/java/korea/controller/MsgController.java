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
	
	
	
	
	@RequestMapping (value="/sendMsg.do" , method=RequestMethod.GET )
	public String sendMsgFm(
			@RequestParam (value = "receiver" )int receiver ,
			HttpServletRequest req, 
			HttpServletResponse resp
			){
		//
		receiver = 2 ; 
		
		return "msg/sendMsg";
		
		
		
	}
	
	
	@RequestMapping (value="/sendMsg.do" , method=RequestMethod.POST )
	public ModelAndView sendMsg(
			@RequestParam (value = "receiver")int receiver ,
			MsgDTO dto ,
			HttpServletRequest req, 
			HttpServletResponse resp
			){
		
		int sender = 1 ; 
		
		//������ ��ȭ�� �ִ��� ã��
		
		int msgIdx = 0 ; 
		boolean isFirst= mdao.isFirst(sender, receiver);
		if (isFirst){
			//���� ��ȭ�� ������
			msgIdx = mdao.getMsgIdx(sender, receiver);
			
			
		}
		else {
			msgIdx=mdao.getMaxMsgIdx(sender);
			
		}
		
		dto.setMsgIdx(msgIdx);
		
		
/*		int msgIdx = mdao.getMsgIdx(sender, receiver)==null?
				mdao.getMaxMsgIdx(sender):mdao.getMsgIdx(sender, receiver);
		
		
				System.out.println("msgIdx"+msgIdx);
		dto.setMsgIdx(msgIdx);
	*/
		
		
		dto.setSender(sender);
		dto.setReceiver(receiver);
		
		ModelAndView mav = new ModelAndView();
		int res = mdao.sendMsg(dto);
		String goURL = res>0? "msgList.do":"/sendMsg.do?receiver="+receiver; 
		String msg =res>0?"����":"����	";
		mav.addObject("msg", msg);
	
		mav.addObject("goURL", goURL);
		
		
		mav.setViewName("admin/adminMsg");
		
		
		
		
		
		return mav; 
		
		
		
		
		
		//
	
		
		
		
	}
	
	
	@RequestMapping("/msgList.do")
	public ModelAndView msgList(
			@RequestParam(value = "cp", defaultValue ="1") int cp ,
			HttpServletRequest req, 
			HttpServletResponse resp
			){
		
		//sId
	//	HttpSession session = req.getSession(); 
		
		//int userIdx =(Integer) session.getAttribute("sId");
		
		int userIdx = 1 ;
	
		int totalCnt = mdao.getTotalCnt(userIdx);
//	System.out.println("totalCnt "+totalCnt);
		
		
		int listSize = 5;
		int pageSize = 5;
		
		
		
		List<MsgDTO> list = mdao.msgList(cp, listSize, 1);
		
		
		String pageStr = korea.page.PageModule.makePage("msgList.do", totalCnt, listSize, pageSize, cp);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("msg/msgList");
	
		return mav ; 
	}
	
	@RequestMapping("/msgContent.do")
	public ModelAndView msgContent(
			@RequestParam(value = "cp", defaultValue ="1") int cp ,
			@RequestParam(value = "msgIdx") int msgIdx ,
			
			HttpServletRequest req, 
			HttpServletResponse resp
			){
		
		//sId
		//	HttpSession session = req.getSession(); 
		
		//int userIdx =(Integer) session.getAttribute("sId");
		
		int userIdx = 1 ;
		
		int totalCnt = mdao.getMsgContentTotalCnt(msgIdx);
		
				
		
		int listSize = 5;
		int pageSize = 5;
		
		
		
		List<MsgDTO> list = mdao.msgContent(cp, listSize, msgIdx);
		
		
		String pageStr = korea.page.PageModule.makePage("msgContent.do", totalCnt, listSize, pageSize, cp);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("msg/msgContent");
		
		return mav ; 
	}
	
	
	
	
	
}
