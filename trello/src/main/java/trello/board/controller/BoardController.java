package trello.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import trello.board.domain.BoardVO;
import trello.board.domain.Criteria;
import trello.board.domain.PageDTO;
import trello.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/register")
	public void register() {

	}
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model, RedirectAttributes rttr) {
		
		int total = service.getTotal(cri);
		PageDTO page = new PageDTO(cri, total);
		
		log.info("cri: "+cri);
		List<BoardVO> list = service.getList(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", page);
		
		rttr.addFlashAttribute("result", ""); //addFlashAttribute 두개 생성해주면 자동으로 null됨
		return "/board/list";
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("get: "+ cri);
	
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		System.out.println(board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
			log.info("modify");
		}
		return "redirect:/board/list";
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
}
