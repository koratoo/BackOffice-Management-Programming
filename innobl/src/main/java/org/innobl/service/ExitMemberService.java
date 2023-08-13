package org.innobl.service;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.MemberVO;

public interface ExitMemberService {

	public List<MemberVO> getExitMember(Criteria cri);

}
