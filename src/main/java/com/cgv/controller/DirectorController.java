package com.cgv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cgv.service.DirectorService;
import com.cgv.vo.DirectorVO;

@Controller
public class DirectorController {
	
	@Autowired
	DirectorService service;
	
	@GetMapping("/director")
	public String getDirector(Model model) {
		model.addAttribute("menu_num", 2);
		
		List<DirectorVO> list = service.selectDirectors();
		model.addAttribute("list", list);
		
		return "/director/director_list";
	}
	
}
