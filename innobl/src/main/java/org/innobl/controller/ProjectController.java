package org.innobl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.innobl.domain.Criteria;
import org.innobl.domain.PMDTO;
import org.innobl.domain.PageDTO;
import org.innobl.domain.VO.DCodeDTLVO;
import org.innobl.domain.VO.ProjectVO;
import org.innobl.service.DCodeService;
import org.innobl.service.PMService;
import org.innobl.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService service;
	
	@Autowired
	private DCodeService dservice;
	
	@Autowired
	private PMService pmservice;
	
	@GetMapping("/project_list")
	public String getProjectList(
			 @RequestParam(value = "PRJNAME", defaultValue="", required = false) String PRJNAME,
			 @RequestParam(value = "from",defaultValue="20230101", required = false) String from,
			 @RequestParam(value = "to",defaultValue="20230801", required = false) String to,
             @RequestParam(value = "PRJSTATUS",defaultValue="100", required = false) String PRJSTATUS,
             @RequestParam(value = "pageNum",defaultValue="1", required = false) int pageNum,
             @RequestParam(value = "amount",defaultValue="10", required = false) int amount,
            
			Criteria cri, Model model) {
		
		model.addAttribute("from", from);
		model.addAttribute("to", to);
		model.addAttribute("PRJSTATUS", PRJSTATUS);
		
		
		int total = service.getTotalCount(from, to, PRJSTATUS, PRJNAME, pageNum, amount);
		model.addAttribute("list", service.searchWithTypes(from, to, PRJSTATUS, PRJNAME, pageNum, amount));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		return "/project/project_list";
	}
	
	@PostMapping("/project_list")
	public String postCurrentMembers( 
								  @RequestParam(value = "PRJNAME", required = false) String PRJNAME,
								  @RequestParam(value = "from", required = false) String from,
								  @RequestParam(value = "to", required = false) String to,
	                              @RequestParam(value = "PRJSTATUS", required = false) String PRJSTATUS,
	                              @RequestParam(value = "pageNum", required = false) int pageNum,
	                              @RequestParam(value = "amount", required = false) int amount,
	                              Model model,Criteria cri) {
		int total = service.getTotalCount(from, to, PRJSTATUS, PRJNAME, pageNum, amount);
	    model.addAttribute("from", from);
		model.addAttribute("to", to);
		model.addAttribute("PRJSTATUS", PRJSTATUS);

	    List<DCodeDTLVO> decode = dservice.getProjectStatusDcode();

		model.addAttribute("decode", decode);	
	    model.addAttribute("list", service.searchWithTypes(from, to, PRJSTATUS, PRJNAME, pageNum, amount));
	    model.addAttribute("pageMaker", new PageDTO(cri, total));
	    
	    return "project/project_list";
	}

	
	@GetMapping("/enroll_project")
	public String showEnrollPage(Model model) {
		List<DCodeDTLVO> decode = dservice.getProjectStatusDcode();
		
		model.addAttribute("decode", decode);
		return "/project/enroll_project";
	}
	
	@PostMapping("/enroll_project")
	public String enrollProject(@ModelAttribute ProjectVO prj) {
		service.enrollProject(prj);
		return "redirect:/project/project_list";
	}
	
	@GetMapping("/project_detail")
	public String getPrjByPrjNo(@RequestParam("PRJNO")int prjno, Model model) {
		ProjectVO project = service.getPrjDetail(prjno);
		model.addAttribute("pm", pmservice.getPMListByPrjno(prjno));
		model.addAttribute("project", project);
		return "/project/project_detail";
	}
	
	@GetMapping("/w_project_detail")
	@ResponseBody
	public ProjectVO getPrjByPrjNoInWindow(@RequestParam("PRJNO")int prjno, Model model) {
		ProjectVO project = service.getPrjDetail(prjno);
		return project;
	}
	@GetMapping("/w_project_members")
	@ResponseBody
	public List<PMDTO> getPrjMembersByPrjNoInWindow(@RequestParam("PRJNO")int prjno, Model mode) {
		
		List<PMDTO> pmList = pmservice.getPMListByPrjno(prjno);
		return pmList;
	}
	
	@PostMapping("/delete_projects")
	@ResponseBody
	 public ResponseEntity<Map<String, String>> deleteProjects(@RequestBody List<Integer> projectIds) {

		for(int id : projectIds) {
			log.info(id+"번 프로젝트 삭제됨");
			service.deleteProject(id);
		}
	    Map<String, String> response = new HashMap<>();
	    response.put("message", "프로젝트가 삭제되었습니다.");

	    return ResponseEntity.ok(response);
	  }

}
