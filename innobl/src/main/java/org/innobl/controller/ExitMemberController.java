package org.innobl.controller;

import org.innobl.domain.Criteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/exit")
public class ExitMemberController {

	@GetMapping("/exit_member")
	public void getExitMember(Criteria cri, Model model) {
		
	}
}
