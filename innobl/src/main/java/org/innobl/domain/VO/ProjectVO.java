package org.innobl.domain.VO;

import lombok.Data;

@Data
public class ProjectVO {

	private int PRJNO;
    private String PRJNAME;
    private String PRJST;
    private String PRJEND;
    private String PRJDESC;
    private String PRJSTATUS;
    private String VNAME;
    private char delete_col;
}
