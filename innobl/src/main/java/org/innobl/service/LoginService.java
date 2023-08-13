package org.innobl.service;

import java.util.List;

import org.innobl.domain.LoginDTO;

public interface LoginService {

	public LoginDTO LoginCheck(String userid,String password);
}
