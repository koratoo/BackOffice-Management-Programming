package org.innobl.service;

import java.util.List;

import org.innobl.domain.PMDTO;
import org.innobl.domain.VO.PMVO;

public interface PMService {

	public List<PMDTO> getPMList();
	public List<PMDTO> getPMListByTypes(String name,String from,String to,String PRJMNG_ROLE );
	public void enrollPMMembers(PMVO vo);
	public List<PMDTO> getPMListByPrjno(int prjno);
	
}
