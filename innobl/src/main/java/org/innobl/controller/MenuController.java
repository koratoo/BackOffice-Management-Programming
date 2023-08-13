package org.innobl.controller;

import java.util.List;

import org.innobl.domain.MenuDTO;
import org.innobl.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MenuController {

	@Autowired
	MenuService service;
	
	@ResponseBody
	@GetMapping("/left_side_menu")
	public List<MenuDTO> getMenuInfoByAuthno(@RequestParam int authno){
		List<MenuDTO> menu= service.getMenuByAuthno(authno);
		return menu;
	}
	
	@ResponseBody
	@GetMapping(value="/getMenuName", produces = "application/json;charset=UTF-8")
	public String getMenuNameByMenuno(@RequestParam int menuno) {
		String menunm = service.getMenuNMbyMenuno(menuno);
		return menunm;
	}
}
