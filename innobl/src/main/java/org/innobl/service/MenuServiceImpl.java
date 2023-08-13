package org.innobl.service;

import java.util.List;

import org.innobl.domain.MenuDTO;
import org.innobl.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper mapper;

	@Override
	public List<MenuDTO> getMenuByAuthno(int authno) {
		return mapper.getMenuByAuthno(authno);
	}

	@Override
	public String getMenuNMbyMenuno(int menuno) {
		return mapper.getMenuNMbyMenuno(menuno);
	}
}
