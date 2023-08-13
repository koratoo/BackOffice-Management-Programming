package org.innobl.service;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.QNABoardVO;
import org.innobl.mapper.QNABoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QNABoardServiceImpl implements QNABoardService{

	@Autowired
	private QNABoardMapper mapper;
	
	@Override
	public List<QNABoardVO> getQNABoard(Criteria cri) {
	
		return mapper.getQNABoard(cri);
	}

	@Override
	public QNABoardVO getQNABoardByBno(int qnabno) {
		
		return mapper.getQNABoardByBno(qnabno);
	}

	@Override
	public void insertBoardReply(QNABoardVO vo) {
		mapper.insertBoardReply(vo);
	}

	@Override
	public void insertBoardWrite(QNABoardVO vo) {
		mapper.insertBoardWrite(vo);
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	
}
