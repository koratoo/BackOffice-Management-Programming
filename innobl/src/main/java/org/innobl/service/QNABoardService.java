package org.innobl.service;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.QNABoardVO;

public interface QNABoardService {

	public List<QNABoardVO> getQNABoard(Criteria cri);
	public QNABoardVO getQNABoardByBno(int qnabno);
	public void insertBoardReply(QNABoardVO vo);
	public void insertBoardWrite(QNABoardVO vo);
	public int getTotalCount();

}
