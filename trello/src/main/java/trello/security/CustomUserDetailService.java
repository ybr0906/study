package trello.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import trello.member.domain.MemberVO;
import trello.member.mapper.MemberMapper;
import trello.security.domain.CustomUser;

public class CustomUserDetailService implements UserDetailsService {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + username);
		
		MemberVO vo = memberMapper.read(username);
		
		return vo ==null? null: new CustomUser(vo);
	}
}
