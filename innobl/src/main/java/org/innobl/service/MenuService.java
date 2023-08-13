package org.innobl.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.innobl.domain.MenuDTO;

public interface MenuService {

	public List<MenuDTO> getMenuByAuthno(int authno);
	public String getMenuNMbyMenuno(int menuno);

}
