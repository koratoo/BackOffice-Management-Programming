package org.innobl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/exception")
public class ExceptionController {

	@GetMapping("/duplicate_key")
	public String showDuplicateErrorPage() {
		
		return "/exception/duplicate_key";
	}
}
