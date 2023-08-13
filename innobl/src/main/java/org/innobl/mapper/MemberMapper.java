package org.innobl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.innobl.domain.Criteria;
import org.innobl.domain.VO.MemberVO;

public interface MemberMapper {

	@Select("select mno,name,juminNo,gender,skillLevel,emplYear from member order by desc")
	public List<MemberVO> getList();
	
	//페이징 처리
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	 List<MemberVO> searchWithTypes(
			 @Param("skillLevel") String skillLevel,
             @Param("gender") String gender,
             @Param("name") String name,
             @Param("pageNum") int pageNum,
             @Param("amount")int amount,
             @Param("from")String from,
             @Param("to")String to);
	 
	 
	public void enrollMember(MemberVO member);

	
	public MemberVO getMemberByMno(int mno);
	
	@Select("select count(*) from member where delete_col = 1")
	public int totalCount();
	
	public void modifyMember(MemberVO member);

	@Update("Update member set delete_col = 2 where mno = #{mno}")
	public void removeMemberByMno(int mno);
	
	//project 배치 화면에서 사용
	@Select("SELECT distinct M.MNO,  M.NAME "
			+ "FROM MEMBER M "
			+ "LEFT JOIN PRJMNG PRJ ON M.MNO = PRJ.MNO"
			)
	public List<MemberVO> getMemberMnoNameIsNull();
	
	public int getTotalCount(Criteria cri);
	
	@Select("SELECT mb.name as name,"
			+ " cd6.dtlcodenm as gender,"
			+ " cd5.dtlcodenm as skilllevel,"
			+ " mb.mno as mno"
			+ " from member  mb "
			+" left outer join dcodedtl cd5 on (cd5.dcode='M005' and mb.skilllevel = cd5.dtlcode)"
  			+" left outer join dcodedtl cd6 on (cd6.dcode='M006' and mb.gender = cd6.dtlcode)"
  			+" where name like  '%' || #{name} || '%' ")
	public List<MemberVO> searchNameOnWindow(String name);
	
	public int countSearchWithTypes( 
			 @Param("skillLevel") String skillLevel,
             @Param("gender") String gender,
             @Param("name") String name,
             @Param("pageNum") int pageNum,
             @Param("amount")int amount,
             @Param("from")String from,
             @Param("to")String to);
}
