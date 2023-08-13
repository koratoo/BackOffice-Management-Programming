package org.innobl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.innobl.domain.Criteria;
import org.innobl.domain.VO.MemberVO;
import org.innobl.domain.VO.ProjectVO;

public interface ProjectMapper {

	public List<ProjectVO> getPrjList(Criteria cri);
	
	public ProjectVO getPrjDetail(int prjno);
	
	public void modifyProject(int prjno);
	
	@Update("Update project SET delete_col = 2 where prjno=#{prjno}")
	public void deleteProject(int prjno);
	
	public void enrollProject(ProjectVO prj);
	
	public List<String> getPrjMNames(int prjno);

	@Select("select count(*) from PROJECT where delete_col =1")
	public int totalCount();
	
	public List<ProjectVO> searchWithTypes(
			 @Param("from") String from,
             @Param("to") String to,
             @Param("PRJSTATUS") String PRJSTATUS,
             @Param("PRJNAME")String PRJNAME,
             @Param("pageNum") int pageNum,
             @Param("amount")int amount);
	

	public int getTotalCount(
			@Param("from") String from,
            @Param("to") String to,
            @Param("PRJSTATUS") String PRJSTATUS,
            @Param("PRJNAME")String PRJNAME,
            @Param("pageNum") int pageNum,
            @Param("amount")int amount);
}
