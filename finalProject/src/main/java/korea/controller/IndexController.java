package korea.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index.do")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("/main.do")
	public String main() {
		
		return "main";
	}
	
	@RequestMapping("/header.do")
	public String header() {
		
		return "header";
	}
	
	@RequestMapping("/footer.do")
	public String footer() {
		
		return "footer";
	}
	
	
}
