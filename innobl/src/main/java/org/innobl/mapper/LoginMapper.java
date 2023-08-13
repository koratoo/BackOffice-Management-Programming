package org.innobl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.innobl.domain.LoginDTO;

public interface LoginMapper {

	@Select(
			"SELECT "
			+ "mno,"
			+ "name,"
			+ "authno,"
			+ "userid, "
			+ "password "
			+ "FROM MEMBER "
			+ "WHERE delete_col=1 "
			+ "and userid=#{userid} "
			+ "and password=#{password}"
			)
	public LoginDTO LoginCheck(@Param("userid") String userid,@Param("password") String password);
}
