package org.innobl.domain;

import lombok.Data;

@Data
public class LoginDTO {

	private String userid;
	private String password;
	private int authno;
	private String name;
	private int mno;
}
