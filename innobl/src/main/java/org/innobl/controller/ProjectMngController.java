package org.innobl.controller;


import org.innobl.domain.Criteria;
import org.innobl.domain.PageDTO;
import org.innobl.domain.VO.PMVO;
import org.innobl.service.MemberService;
import org.innobl.service.PMService;
import org.innobl.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/pm")
public class ProjectMngController {

	@Autowired
	private PMService service;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private ProjectService pservice;
	
	
	@GetMapping("/pm_list")
	public String getPMList(Model model, Criteria cri) {
		
		model.addAttribute("list", service.getPMList());
		model.addAttribute("pageMaker", new PageDTO(cri,123));
		return "/pm/pm_list";
	}
	
	@PostMapping("/pm_list")
	public String postPMList(Model model,  
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "from", required = false) String from,
			@RequestParam(value = "to", required = false) String to,		
            @RequestParam(value = "PRJMNG_ROLE", required = false) String PRJMNG_ROLE,Criteria cri) {

		model.addAttribute("list", service.getPMListByTypes(name, from	, to, PRJMNG_ROLE));
		model.addAttribute("pageMaker", new PageDTO(cri,123));

		return "pm/pm_list";
	}
	
	@GetMapping("/enroll_pm")
	public void enrollProjectMembers(Model model,@RequestParam("PRJNO") int prjno) {
		
		model.addAttribute("project", pservice.getPrjDetail(prjno));

		model.addAttribute("member", mservice.getMemberMnoNameIsNull());
		
		
	}
	
	@PostMapping("/enroll_project")
	public String enrollProjectMembers(@ModelAttribute PMVO pmvo,Model model) {
	    try {
	        service.enrollPMMembers(pmvo);
	    }catch (Exception e) {
	        model.addAttribute("error", "duplicate");
	        return "redirect:/pm/enroll_pm";
	    } 

	    return "redirect:/member/enroll_success";
	}
	
	
}
