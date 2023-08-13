package org.innobl.service;

import java.util.List;

import org.innobl.domain.VO.DCodeDTLVO;
import org.innobl.domain.VO.DCodeVO;
import org.innobl.mapper.DCodeMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class DCodeServiceImpl implements DCodeService{

	private DCodeMapper mapper;
	
	@Override
	public List<DCodeDTLVO> getCodeVal(String DECODE) {
		return mapper.getCodeVal(DECODE);
	}
	
	@Override
	public List<DCodeDTLVO> getProjectStatusDcode() {
		return mapper.getProjectStatusDcode();
	}

	@Override
	public List<DCodeDTLVO> getDCodeList() {
		return mapper.getDCodeList();
	}

	@Override
	public List<DCodeVO> getDCode() {
		return mapper.getDCode();
	}

	@Override
	public void insertDecode(DCodeDTLVO vo) {
		mapper.insertDecode(vo);
	}

}
