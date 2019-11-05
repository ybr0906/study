package trello.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import trello.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/all")
	public void loginForm() {
	}
	
	@PostMapping("/join")
	public String join(@RequestParam HashMap<String, String> map) {
		
	    if(memberService.join(map)) {
			/* 회원가입 성공 */
	    	return "/member/all";
	    }else {
			/* 회원가입 실패 */
	    	return "/member/all";
	    }
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(@RequestParam HashMap<String, String> map) {
		
		String check = memberService.login(map);
		log.info("map:"+ check);

		if(check == "Y") {		
			log.info("if문접근:");
			return  "redirect:/board/list";
		}else {
			return "/member/all";
		}
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		
	}
}
