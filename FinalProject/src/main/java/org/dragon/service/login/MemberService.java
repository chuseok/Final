package org.dragon.service.login;

import java.util.List;

import org.dragon.domain.login.AuthVO;
import org.dragon.domain.login.MemberVO;

public interface MemberService {

	public int register(MemberVO mem);
	public int register(AuthVO vo);
	
	public void withdrawal(MemberVO mem);
	public void withdrawal(AuthVO vo);

	public MemberVO get(String userId);

	public List<MemberVO> getList();
	
	public void modify(MemberVO mem);
	public void modify2(MemberVO mem);
	public void modify3(MemberVO mem);
	public void modify4(MemberVO mem);
	
	public int idCheck(MemberVO mem);
	
	public int nameCheck(MemberVO mem);
	
	
	public int PwdCheck(MemberVO mem);
}
