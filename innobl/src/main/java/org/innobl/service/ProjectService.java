package org.innobl.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.innobl.domain.Criteria;
import org.innobl.domain.VO.ProjectVO;

public interface ProjectService {

	public List<ProjectVO> getPrjList(Criteria cri);
	
	public ProjectVO getPrjDetail(int prjno);
	
	public void modifyProject(int prjno);
	
	public void deleteProject(int prjno);
	
	public void enrollProject(ProjectVO prj);

	public List<String> getPrjMNames(int prjno);
	
	List<ProjectVO> searchWithTypes(String from,String to,String PRJSTATUS,String PRJNAME,int pageNum,int amount);
	
	public int getTotalCount(String from,String to,String PRJSTATUS,String PRJNAME,int pageNum,int amount);
}
