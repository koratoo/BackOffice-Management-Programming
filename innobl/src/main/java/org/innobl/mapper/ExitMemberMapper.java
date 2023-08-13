package org.innobl.mapper;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.MemberVO;

public interface ExitMemberMapper {

	public List<MemberVO> getExitMember(Criteria cri);

}
