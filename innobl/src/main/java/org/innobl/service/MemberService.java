package org.innobl.service;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.MemberVO;

public interface MemberService {

	public void enroll(MemberVO member);
	
	public void modify(MemberVO member);
	
	public void remove(int mno);
	
	public List<MemberVO> getMemberList(Criteria cri);

	public MemberVO getMemberByMno(int mno);
	
	public List<MemberVO> searchWithTypes(String skillLevel, String gender, String name, int pageNum, int amount,String from,String to);
	
	//프로젝트 배치 화면에서 사용됨
	public List<MemberVO> getMemberMnoNameIsNull();
	
	public int getTotal(Criteria cri);

	public List<MemberVO> searchNameOnWindow(String name);
	
	  int countSearchWithTypes(String skillLevel, String gender, String name, int pageNum, int amount, String from, String to);


}
