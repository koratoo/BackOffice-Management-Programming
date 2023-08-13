package org.innobl.domain.VO;

import lombok.Data;

@Data
public class QNABoardVO {

	private int qnabno;
	private int prnt_qnabno;
	private int qnalvl;
	private String title;
	private String content;
	private String writedate;
	private String qna_cd;
	private int mno;
	
	//member테이블 정보
	private String name;
}
