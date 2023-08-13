package org.innobl.controller;

import java.util.List;

import org.innobl.domain.Criteria;
import org.innobl.domain.PageDTO;
import org.innobl.domain.VO.QNABoardVO;
import org.innobl.service.QNABoardService;
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
@RequestMapping("/board")
public class QNABoardController {
	
	@Autowired
	private QNABoardService service;
	
	@GetMapping("/qna_board")
	public String getQNABoardPage(Model model,Criteria cri) {
		
		List<QNABoardVO> qnaBoardList = service.getQNABoard(cri);
		model.addAttribute("qnaBoardList", qnaBoardList);
		
		int total=service.getTotalCount();
	    model.addAttribute("pageMaker", new PageDTO(cri, total));

		return "/board/qna_board";
	}
	
	@GetMapping("qna_board_dtl")
	private String GetQNABoardDTL(@RequestParam int qnabno,Model model) {
		
		model.addAttribute("qna",service.getQNABoardByBno(qnabno));
		return "/board/qna_board_dtl";
	}
	
	@GetMapping("qna_board_repl")
	private String GetQNABoardRPL(@RequestParam int qnabno,Model model) {
		
		model.addAttribute("qna",service.getQNABoardByBno(qnabno));
		model.addAttribute("qnabno",qnabno);
		return "/board/qna_board_repl";
	}
	
	@PostMapping("qna_board_repl")
	private String PostQNABoardRPL(@ModelAttribute QNABoardVO board) {
		
		board.setQnalvl(board.getQnalvl()+1);
		
		service.insertBoardReply(board);
		return "redirect:/board/qna_board";
	}
	
	@GetMapping("qna_board_write")
	private String getQNABoardWritePage() {
		return "/board/qna_board_write";
	}
	
	@PostMapping("qna_board_write")
	private String postQNABoardWritePage(@ModelAttribute QNABoardVO board) {
		service.insertBoardWrite(board);
		return "redirect:/board/qna_board";
	}
}
