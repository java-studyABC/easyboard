package org.easyboard.controller;

import javax.inject.Inject;

import org.easyboard.domain.BoardVO;
import org.easyboard.domain.Criteria;
import org.easyboard.domain.PageMaker;
import org.easyboard.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	@Inject
	private BoardService service;

	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPageGET(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.info("listPage 호출");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.getBoardCount());

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", service.getBoardList(cri));

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO vo) throws Exception {

		service.registerBoard(vo);

		return "redirect:/board/listPage";
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void readPageGET(@RequestParam("bno") Integer bno
				,@ModelAttribute("cri")Criteria cri,Model model)throws Exception{
		
		model.addAttribute("vo", service.readBoard(bno));
	}
	
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPageGET(@ModelAttribute("cri") Criteria cri, Integer bno, Model model) throws Exception {

		model.addAttribute("vo", service.readBoard(bno));
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(BoardVO boardVO, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		service.modifyBoard(boardVO);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
		model.addAttribute("bno", boardVO.getBno());
		
		return "redirect:/board/readPage";
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public String remove(Integer bno,RedirectAttributes rttr,Criteria cri)throws Exception{
		
		service.removeBoard(bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		
		return "redirect:/board/listPage";
	}

}
