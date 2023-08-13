package org.innobl.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.innobl.domain.Criteria;
import org.innobl.domain.PageDTO;
import org.innobl.domain.VO.MemberVO;
import org.innobl.domain.VO.PMVO;
import org.innobl.service.MemberService;
import org.innobl.service.PMService;
import org.innobl.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private ProjectService pservice;
	
	@Autowired
	private PMService pmservice;
	
	//전체 조회
	@GetMapping("/current_member")
	public String getCurrentMembers(
	    @RequestParam(value = "skillLevel",defaultValue="100", required = false) String skillLevel,
            @RequestParam(value = "gender", defaultValue="100",required = false) String gender,
            @RequestParam(value = "name", defaultValue="",required = false) String name,
            @RequestParam(value = "pageNum", defaultValue="1",required = false) int pageNum,
            @RequestParam(value = "amount", defaultValue="10",required = false) int amount,
            @RequestParam(value = "from", defaultValue="20230701",required = false) String from,
            @RequestParam(value = "to", defaultValue="20230801",required = false) String to,
			Criteria cri, Model model) {
		 
		model.addAttribute("from", from);
		model.addAttribute("to", to);
		model.addAttribute("gender", gender);
		model.addAttribute("skillLevel", skillLevel);
	    
		List<MemberVO> list= service.searchWithTypes(skillLevel,gender,name,pageNum,amount,from,to);
		int total = service.countSearchWithTypes(skillLevel, gender, name, pageNum, amount, from, to);
	
	    model.addAttribute("list", list);
	    model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/member/current_member";
	}
	
	@PostMapping("/current_member")
	public String postCurrentMembers( 
				      @RequestParam(value = "skillLevel", required = false) String skillLevel,
	                              @RequestParam(value = "gender", required = false) String gender,
	                              @RequestParam(value = "name", required = false) String name,
	                              @RequestParam(value = "pageNum", required = false) int pageNum,
	                              @RequestParam(value = "amount", required = false) int amount,
	                              @RequestParam(value = "from", required = false) String from,
	                              @RequestParam(value = "to", required = false) String to,
	                              Model model,Criteria cri,HttpSession session) {
	   
		model.addAttribute("from", from);
		model.addAttribute("to", to);
		model.addAttribute("gender", gender);
		model.addAttribute("skillLevel", skillLevel);
	    
		List<MemberVO> list= service.searchWithTypes(skillLevel,gender,name,pageNum,amount,from,to);
		int total=service.countSearchWithTypes(skillLevel, gender, name, pageNum, amount, from, to);
	    model.addAttribute("list", list);

	    model.addAttribute("pageMaker", new PageDTO(cri, total));

	    return "member/current_member";
	}

	
	//등록 관련
	@GetMapping("/enroll_member")
	public String showEnrollPage(Model model) {
		
		
		return "/member/enroll_member";
	}
	
	
	@PostMapping("/enroll_member")
	public String enrollMemberWithImageFile(@Valid @ModelAttribute MemberVO member,
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes,
			Model model, MultipartFile[] uploadFile) {
	   
		if(bindingResult.hasErrors()) {
			
			log.info("has errors...");
			log.info(bindingResult.getAllErrors());
			model.addAttribute("errors", bindingResult.getAllErrors());
			return "/member/enroll_member";
		}
	    
	    String uploadFolder = "C:\\Users\\-\\Desktop\\innoblife\\innobl\\src\\main\\webapp\\resources\\img";
	    for (MultipartFile multipartFile : uploadFile) {
	        String originalFileName = multipartFile.getOriginalFilename();
	        File saveFile = new File(uploadFolder, originalFileName);
	        try {
	            multipartFile.transferTo(saveFile);
	            String filePath = uploadFolder + "\\" + originalFileName;
	            member.setProfileImg(filePath);
	        } catch (Exception e) {
	            log.error(e.getMessage());
	        }
	    }
	    
	    try {
	    service.enroll(member);
	    }catch(Exception e) {
	    	log.error(e.getMessage());
	    	model.addAttribute("errors", "Member registration failed:" +e.getMessage());
	    	return "/member/enroll_member";
	    }
	    
	    return "redirect:/member/enroll_success";
	}

	
	@GetMapping("/enroll_success")
	public String enrollMemberSuccess() {
		return "/member/enroll_success";
	}
	
	//단일 멤버조회
	@GetMapping("/member_detail")
    public String memberDetail(@RequestParam("mno") int mno, Model model) {
        MemberVO member = service.getMemberByMno(mno);
        model.addAttribute("member", member);
        return "/member/member_detail";
    }
	
	//수정하기
	@GetMapping("/modify_member")
	public String modfiyMember(@RequestParam("mno") int mno, Model model) {
		
		MemberVO member = service.getMemberByMno(mno);
        model.addAttribute("member", member);
		return "/member/modify_member";
	}
	
	@PostMapping("/modify_member")
	public String PostModfiyMember(@ModelAttribute MemberVO member) {
	    service.modify(member);

	    return "redirect:/member/current_member";
	}
	
	@GetMapping("/remove_member")
	public String removeMemberByMno(@RequestParam("mno") int mno) {
		
		service.remove(mno);
		return "redirect:/member/current_member";
	}
	
   @GetMapping("/w_enroll_member")
   public String getWindowEnrollMemberIntoProjectPage(@RequestParam String selectedItems,Model model,Criteria cri) {
	  String[] selectedItemList = selectedItems.split(",");
	  List<MemberVO> mlist = new ArrayList<>();
	  for(int i=0;i<selectedItemList.length;i++) {
		MemberVO member =  service.getMemberByMno(Integer.parseInt(selectedItemList[i]));
		mlist.add(member);
	  }
	  model.addAttribute("mlist", mlist);
	  model.addAttribute("project", pservice.getPrjList(cri));
       return "/member/w_enroll_member";
  }
   

   @ResponseBody
   @PostMapping("/w_enroll_member")
   public ResponseEntity<?> postWindowEnrollMemberIntoProjectPage(
           @RequestParam("prjno") int prjno,
           @RequestParam("mno[]") List<Integer> mnoList,
           @RequestParam("prjmng_st[]") List<String> prjmngStList,
           @RequestParam("prjmng_end[]") List<String> prjmngEndList,
           @RequestParam("prjmng_role[]") List<String> prjmngRoleList,
           RedirectAttributes redirectAttributes) {

	   
       try {
           for (int i = 0; i < mnoList.size(); i++) {
               log.info(prjno);
               log.info(mnoList.get(i));
               log.info(prjmngStList.get(i));

               PMVO vo = new PMVO();
               vo.setPrjno(prjno);
               vo.setMno(mnoList.get(i));
               vo.setPrjmng_end(prjmngEndList.get(i));
               vo.setPrjmng_st(prjmngStList.get(i));
               vo.setPrjmng_role(prjmngRoleList.get(i));
               pmservice.enrollPMMembers(vo);

           }
       } catch (DuplicateKeyException ex) {
           return ResponseEntity.status(HttpStatus.CONFLICT).body("입력하신 데이터 중, 중복되는 항목이 있습니다. 확인 후 다시 시도해주세요.");
       } catch (NumberFormatException ne) {
    	   return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("잘못된 형식의 숫자 데이터가 있습니다. 확인 후 다시 시도해주세요.");
       }catch (Exception e) {
    	    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버에서 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
       }

       return ResponseEntity.ok("멤버 등록이 성공적으로 완료되었습니다.");
   }

	  
   @GetMapping("/w_member_search")
   public String getMemberSearchWindow() {
	   return "/member/w_member_search";
   }
   
   @PostMapping("/w_member_search")
   public String postMemberSearchWindow(Model model,@RequestParam("name")String name) {
	   
	   model.addAttribute("member", service.searchNameOnWindow(name));
	   return "/member/w_member_search";
   }
	  

}
