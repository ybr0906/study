package trello.member.mapper;

import trello.member.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
}
