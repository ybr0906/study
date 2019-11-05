package trello.member.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trello.member.mapper.MemberMapper;

@Service
public class MemberService {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MemberMapper memberMapper;
	
	public boolean join(Map<String, String> map) {
		
		return memberMapper.join(map) == 1;
	}
	
	public String login(Map<String, String> map) {
		
		/*
		 * HttpServletRequest request = null;
		 * 
		 * log.info("¸®Äù½ºÆ®°´Ã¼È®ÀÎ:"+request.getSession());
		 * 
		 * HttpSession session = request.getSession();
		 */
		
		String checkValue = memberMapper.check(map);
		
		if(checkValue.equals("Y")) {
			log.info("checkValue:"+checkValue);
			
			/* session.setAttribute("value", map.get("email")); */
			return "Y";
		}else {
			return "N";
		}
		
	}
	
}
