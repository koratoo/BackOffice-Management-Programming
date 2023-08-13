package org.innobl.controller;

import javax.servlet.http.HttpSession;

import org.innobl.domain.LoginDTO;
import org.innobl.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService service;

	@GetMapping("/login")
	public String showLoginPage(Model model) {
		 if (model.containsAttribute("loginFailed")) {
	            model.addAttribute("loginFailed", true);
	        }
		return "login/login";
	}
	
	@PostMapping("/login")
	public String LoginCheck(
			@RequestParam String userid, 
			@RequestParam String password, 
			RedirectAttributes redirectAttributes,
			HttpSession session) {
		
		LoginDTO dto = service.LoginCheck(userid,password); 
		if(!dto.getUserid().equals(null)) {
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("authno", dto.getAuthno());
			session.setAttribute("name", dto.getName());
			session.setAttribute("mno", dto.getMno());
			return "redirect:/member/current_member";
		}else {
			
			redirectAttributes.addFlashAttribute("loginFailed", true);
			return "redirect:/login/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login/login";
	}
}
