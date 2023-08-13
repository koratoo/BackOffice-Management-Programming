package org.innobl.controller;

import org.innobl.domain.Criteria;
import org.innobl.domain.PageDTO;
import org.innobl.domain.VO.VendorVO;
import org.innobl.service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/vendor")
public class VendorController {

	@Autowired
	private VendorService service;
	
	@GetMapping("/vendor_list")
	public String getVendorList(Model model, Criteria cri){
		model.addAttribute("list",service.getVendorList(cri));
		model.addAttribute("pageMaker",new PageDTO(cri,123));
		
		return "/vendor/vendor_list";
	}
	
	@GetMapping("/enroll_vendor")
	public String showEnrollVendorPage() {
		
		return "/vendor/enroll_vendor";
	}
	
	@PostMapping("/enroll_vendor")
	public String enrollVendor(@ModelAttribute VendorVO vendor) {
		service.enrollVendor(vendor);
		return "redirect:/vendor/vendor_list";
	}
	
	@GetMapping("/vendor_detail")
	public void getVendorByVno() {
		
	}
	
	
	
}
