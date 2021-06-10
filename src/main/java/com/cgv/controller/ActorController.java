package com.cgv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cgv.service.ActorService;
import com.cgv.vo.ActorVO;

@Controller
public class ActorController {
	
	@Autowired
	ActorService service;
	
	@GetMapping("/actor")
	public String getActor(Model model) {
		model.addAttribute("menu_num", 1);
		
		List<ActorVO> list = service.selectActors();
		model.addAttribute("list", list);
		
		return "/actor/actor_list";
	}
	
}
