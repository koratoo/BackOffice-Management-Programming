package org.innobl.service;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.VendorVO;
import org.innobl.mapper.VendorMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class VendorServiceImpl implements VendorService{

	private VendorMapper mapper;

	@Override
	public List<VendorVO> getVendorList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void enrollVendor(VendorVO vendor) {
		mapper.enrollVendor(vendor);
	}
}
