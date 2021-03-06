package korea.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import korea.member.model.MemberDAO;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired

	private MemberDAO mdao ; 
	// mailForm
	@RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
	public ModelAndView mailForm(@RequestParam(value = "receiver") int receiver) {

		ModelAndView mav = new ModelAndView();
		
		String receiverMail = mdao.getUserEmail(receiver);
		
		
		
		mav.addObject("receiver", receiverMail);
	
		mav.setViewName("mail/mailForm");
		return mav;
		// return "mail/mailForm";
	}

	// mailSending 코드
	@RequestMapping(value = "/sendMail.do", method = RequestMethod.POST)
	public String mailSending(HttpServletRequest request) {

		String setfrom = "khuser303@gmail.com";
		String tomail = request.getParameter("tomail"); // 받는 사람 이메일
		String title = request.getParameter("title"); // 제목
		String content = request.getParameter("content"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "mail/mailMsg";
	}
}