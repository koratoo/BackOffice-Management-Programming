package org.innobl.service;

import java.util.List;

import org.innobl.domain.PMDTO;
import org.innobl.domain.VO.PMVO;
import org.innobl.mapper.PMMapper;
import org.innobl.mapper.ProjectMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PMServiceImpl implements PMService {

	private PMMapper mapper;
	
	@Override
	public List<PMDTO> getPMList() {
		return mapper.getPMList();
	}

	@Override
	public List<PMDTO> getPMListByTypes(String name, String from,String to, String PRJMNG_ROLE  ) {
		return mapper.getPMListByTypes(name, from, to, PRJMNG_ROLE);
	}

	@Override
	public void enrollPMMembers(PMVO vo) {
		mapper.enrollPMMembers(vo);
	}

	@Override
	public List<PMDTO> getPMListByPrjno(int prjno) {
		return mapper.getPMListByPrjno(prjno);
	}

	

	
}
