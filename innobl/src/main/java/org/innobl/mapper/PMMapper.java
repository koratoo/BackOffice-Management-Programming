package org.innobl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.innobl.domain.PMDTO;
import org.innobl.domain.VO.PMVO;

public interface PMMapper {

	public List<PMDTO> getPMList();
	
	public List<PMDTO> getPMListByTypes(
	        @Param("name") String name,
	        @Param("from") String from,
	        @Param("to") String to,
	        @Param("PRJMNG_ROLE") String PRJMNG_ROLE
	);
	
	public void enrollPMMembers(PMVO vo);

	public List<PMDTO> getPMListByPrjno(int prjno);
	
	
}
