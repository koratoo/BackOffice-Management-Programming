package org.innobl.mapper;

import java.util.List;

import javax.sql.DataSource;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper mapper;
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		List<MemberVO> list = mapper.getListWithPaging(cri);
//		list.forEach(member->log.info(member));
//	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("수정");
		cri.setType("NG");
		
		List<MemberVO> list = mapper.getListWithPaging(cri);
		list.forEach(member->log.info(member));
		
	}
}
