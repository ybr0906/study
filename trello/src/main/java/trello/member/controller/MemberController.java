package trello.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/member")
	public String join() {
		log.info("시크리티거쳐서");
		return "/board/list";
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		
	}
}
