package org.innobl.service;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.ProjectVO;
import org.innobl.mapper.ProjectMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProjectServiceImpl implements ProjectService{

	private ProjectMapper mapper;

	@Override
	public List<ProjectVO> getPrjList(Criteria cri) {
		return mapper.getPrjList(cri);
	}

	@Override
	public ProjectVO getPrjDetail(int prjno) {
		return mapper.getPrjDetail(prjno);
	}

	@Override
	public void modifyProject(int prjno) {
		mapper.modifyProject(prjno);
	}

	@Override
	public void deleteProject(int prjno) {
		mapper.deleteProject(prjno);
	}

	@Override
	public List<ProjectVO> searchWithTypes(String from, String to, String prjstatus, String prjname, int pageNum,
			int amount) {
		return mapper.searchWithTypes(from, to, prjstatus, prjname, pageNum, amount);
	}

	@Override
	public void enrollProject(ProjectVO prj) {
		mapper.enrollProject(prj);
		
	}

	@Override
	public List<String> getPrjMNames(int prjno) {
		return mapper.getPrjMNames(prjno);
	}

	@Override
	public int getTotalCount(String from, String to, String PRJSTATUS, String PRJNAME, int pageNum, int amount) {
		
		return mapper.getTotalCount(from, to, PRJSTATUS, PRJNAME, pageNum, amount);
	}


}
