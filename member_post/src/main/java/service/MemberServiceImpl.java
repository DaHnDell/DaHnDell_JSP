package service;

import java.util.List;

import dao.MemberDao;
import vo.Member;

public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao = MemberDao.getInstancce();
	@Override
	public int register(Member member) {
		return memberDao.insert(member);
	}

	@Override
	public Member findBy(String id) {
		return null;
	}

	@Override
	public boolean login(String id, String pw) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Member> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(Member member) {
		// TODO Auto-generated method stub
		return false;
	} 
	// implement 구현
	
	
}