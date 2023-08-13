package org.innobl.service;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.VO.VendorVO;

public interface VendorService {

	public List<VendorVO> getVendorList(Criteria cri);

	public void enrollVendor(VendorVO vendor);
}
