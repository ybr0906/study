package trello.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
	
		log.warn("login success");
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(i ->{
			roleNames.add(i.getAuthority());
		});
		
		log.warn("ROLE NAMES: "+roleNames);
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/member/member");
			return;
		}
		response.sendRedirect("/");

	}

}
