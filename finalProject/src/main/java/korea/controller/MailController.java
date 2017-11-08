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

	// mailSending �ڵ�
	@RequestMapping(value = "/sendMail.do", method = RequestMethod.POST)
	public String mailSending(HttpServletRequest request) {

		String setfrom = "khuser303@gmail.com";
		String tomail = request.getParameter("tomail"); // �޴� ��� �̸���
		String title = request.getParameter("title"); // ����
		String content = request.getParameter("content"); // ����

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // �����»�� �����ϰų� �ϸ� �����۵��� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ������ �����ϴ�
			messageHelper.setText(content); // ���� ����

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "mail/mailMsg";
	}
}