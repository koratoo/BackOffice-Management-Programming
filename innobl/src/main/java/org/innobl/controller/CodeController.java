package org.innobl.controller;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.PageDTO;
import org.innobl.domain.VO.DCodeDTLVO;
import org.innobl.domain.VO.DCodeVO;
import org.innobl.service.DCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/code")
public class CodeController {

	@Autowired
	private DCodeService dservice;
	
	@GetMapping("/codeVal")
	@ResponseBody
	public List<DCodeDTLVO> getCodeVal(@RequestParam String codeVal){
		
		List<DCodeDTLVO> codes = dservice.getCodeVal(codeVal);
		return codes;
	}
	
	@GetMapping("/code_list")
	public String getDCodeList(Model model, Criteria cri){
		model.addAttribute("list", dservice.getDCodeList());
		model.addAttribute("pageMaker",new PageDTO(cri,123));

		return "/code/code_list";
	}
	
	@GetMapping("/enroll_code")
	public String getEnrollPage(Model model) {
		model.addAttribute("list", dservice.getDCode());
		return "/code/enroll_code";
	}
	
	@PostMapping("/enroll_code")
	public String postEnroll(@ModelAttribute DCodeDTLVO vo) {
		dservice.insertDecode(vo);
		
		return "redirect:/code/code_list";
	}
}
