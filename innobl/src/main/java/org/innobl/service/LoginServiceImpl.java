package org.innobl.service;

import java.util.List;

import org.innobl.domain.LoginDTO;
import org.innobl.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LoginServiceImpl implements LoginService{

	@Autowired LoginMapper mapper;
	@Override
	public LoginDTO LoginCheck(String userid, String password) {
		return mapper.LoginCheck(userid, password);
	}

}
