package org.innobl.service;

import java.util.List;

import org.innobl.domain.VO.DCodeDTLVO;
import org.innobl.domain.VO.DCodeVO;

public interface DCodeService {

	public List<DCodeDTLVO> getCodeVal(String DECODE);

	public List<DCodeDTLVO> getProjectStatusDcode();
	
	public List<DCodeDTLVO> getDCodeList();

	public List<DCodeVO> getDCode();
	
	public void insertDecode(DCodeDTLVO vo);

}
