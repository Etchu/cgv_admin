package com.cgv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cgv.service.GenreService;
import com.cgv.vo.GenreVO;

@Controller
public class GenreController {
	
	@Autowired
	GenreService service;
	
	@GetMapping("/genre")
	public String getGenre(Model model) {
		model.addAttribute("menu_num", 0);
		
		List<GenreVO> list = service.selectGenres();
		model.addAttribute("list", list);
		
		return "/genre/genre_list";
	}
}
