package org.innobl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.innobl.domain.Criteria;
import org.innobl.domain.VO.QNABoardVO;

public interface QNABoardMapper {
	@Select("SELECT "
	        + "qb.qnabno AS qnabno, "
	        + "qb.prnt_qnabno AS prnt_qnabno, "
	        + "qb.qnalvl AS qnalvl, "
	        + "qb.title AS title, "
	        + "qb.content AS content, "
	        + "qb.writedate AS writedate, "
	        + "qb.mno AS mno, "
	        + "cd.dtlcodenm AS qna_cd, "
	        + "m.name AS name "
	        + "FROM QNA_BOARD qb "
	        + "JOIN member m ON qb.mno = m.mno "
	        + "left outer join dcodedtl cd on (cd.dcode='QNA001' and qb.qna_cd = cd.dtlcode) "
	        + "START WITH qb.qnalvl=0 "
	        + "CONNECT BY PRIOR qb.qnabno = qb.prnt_qnabno "
	        + "ORDER SIBLINGS BY "
	        + "CASE WHEN qb.qnalvl = 0 THEN qb.writedate END DESC, "
	        + "CASE WHEN qb.qnalvl > 0 THEN qb.writedate END ASC")
	public List<QNABoardVO> getQNABoard(Criteria cri);
	
	
	@Select("SELECT * FROM  QNA_BOARD WHERE qnabno = #{qnabno}")
	public QNABoardVO getQNABoardByBno(@Param("qnabno") int qnabno);
	
	
	@Insert("Insert into "
			+ "QNA_BOARD(qnabno,prnt_qnabno,qnalvl,title,qna_cd,content,writedate,mno) "
			+ "values(board_seq.nextval,#{prnt_qnabno},#{qnalvl},#{title},#{qna_cd},#{content},#{writedate},#{mno})")
	public void insertBoardReply(QNABoardVO vo);
	
	@Insert("Insert into "
			+ "QNA_BOARD(qnabno,qnalvl,title,qna_cd,content,writedate,mno) "
			+ "values(board_seq.nextval,#{qnalvl},#{title},#{qna_cd},#{content},#{writedate},#{mno})")
	public void insertBoardWrite(QNABoardVO vo);
	
	@Select("Select count(*) from QNA_BOARD")
	public int getTotalCount();
}
