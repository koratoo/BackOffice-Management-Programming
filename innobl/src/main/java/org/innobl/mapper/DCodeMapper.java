package org.innobl.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.innobl.domain.VO.DCodeDTLVO;
import org.innobl.domain.VO.DCodeVO;

public interface DCodeMapper {

	@Select("SELECT DTLCODE,DTLCODENM FROM DCODEDTL WHERE DCODE = #{DCODE}")
    public List<DCodeDTLVO> getCodeVal(String DECODE ); 
	
	@Select("SELECT DTLCODE,DTLCODENM FROM DCODEDTL WHERE DCODE = 'P001'")
	public List<DCodeDTLVO> getProjectStatusDcode();
	
	//코드마스터 목록에서 사용됨
	@Select("SELECT * FROM DCODEDTL ORDER BY DCODE,DTLCODE")
	public List<DCodeDTLVO> getDCodeList();
	
	@Select("SELECT * FROM DCODE")
	public List<DCodeVO> getDCode();
	
	@Insert ("Insert INTO DCODEDTL (DCODE, DTLCODE, DTLCODENM) VALUES (#{DCODE}, #{DTLCODE}, #{DTLCODENM})")
	public void insertDecode(DCodeDTLVO vo);
	
}
