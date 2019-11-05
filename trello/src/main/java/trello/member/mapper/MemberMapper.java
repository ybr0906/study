package trello.member.mapper;

import java.util.Map;

public interface MemberMapper {
	public int join(Map<String, String> map); 
	public String check(Map<String,String> map);
}
