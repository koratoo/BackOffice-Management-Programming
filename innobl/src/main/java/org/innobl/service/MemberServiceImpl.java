package org.innobl.service;

import java.util.Date;
import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.MemberVO;
import org.innobl.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;

	@Override
	public void enroll(MemberVO member) {
		mapper.enrollMember(member);
	}

	@Override
	public void modify(MemberVO member) {
		mapper.modifyMember(member);
	}

	@Override
	public void remove(int mno) {
		mapper.removeMemberByMno(mno);
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public MemberVO getMemberByMno(int mno) {
		return mapper.getMemberByMno(mno);
	}

	@Override
	public List<MemberVO> searchWithTypes(String skillLevel, String gender, String name,int pageNum,int amount,String from, String to) {
        log.info("서비스 null처리 정상작동");

		return mapper.searchWithTypes(skillLevel, gender, name, pageNum,amount,from,to);
	}

	@Override
	public List<MemberVO> getMemberMnoNameIsNull() {
		
		return mapper.getMemberMnoNameIsNull();
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<MemberVO> searchNameOnWindow(String name) {
		
		return mapper.searchNameOnWindow(name);
	}

	@Override
	public int countSearchWithTypes(String skillLevel, String gender, String name, int pageNum, int amount, String from,
			String to) {
		
		return mapper.countSearchWithTypes(skillLevel, gender, name, pageNum, amount, from, to);
	}


	


}
