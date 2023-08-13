package org.innobl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.innobl.domain.MenuDTO;

public interface MenuMapper {

	@Select("SELECT m.* "
			+ "FROM menu m "
			+ "JOIN menu_auth_mng mam "
			+ "ON m.menuno = mam.menuno "
			+ "WHERE mam.authno = #{authno}")
	public List<MenuDTO> getMenuByAuthno(@Param("authno") int authno);
	
	
	@Select("SELECT menunm from menu where menuno =#{menuno}")
	public String getMenuNMbyMenuno(@Param("menuno")int menuno);
}
