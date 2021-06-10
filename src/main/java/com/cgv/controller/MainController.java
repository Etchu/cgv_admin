package com.cgv.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String getLogin() {
		return "/login";
	}
	
	@GetMapping("/logout")
	public String getLogout(HttpSession session) {
		session.setAttribute("user", null);
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/main")
	public String getMain() {
		return "/main";
	}
}
