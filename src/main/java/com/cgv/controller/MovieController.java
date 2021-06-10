package com.cgv.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cgv.service.ActorService;
import com.cgv.service.DirectorService;
import com.cgv.service.GenreService;
import com.cgv.service.MovieService;
import com.cgv.vo.ActorVO;
import com.cgv.vo.DirectorVO;
import com.cgv.vo.GenreVO;
import com.cgv.vo.MovieVO;

@Controller
public class MovieController {
	
	@Autowired
	MovieService service;
	
	@Autowired
	ActorService actorService;
	
	@Autowired
	DirectorService directorService;
	
	@Autowired
	GenreService genreService;
	
	@GetMapping("/movie")
	public String getMovie(Model model){
		
		model.addAttribute("menu_num", 3);
		
		List<MovieVO> list = service.selectMovies();
		model.addAttribute("list", list);
		
		return "/movie/movie_list";
	}
	
	@GetMapping("/add_movie")
	public String getAddMovie(){
		return "/movie/add_movie_info";
	}
	
	@GetMapping("/movie_detail")
	public String getMovie(Model model, @RequestParam Integer no){
		
		MovieVO list = service.selectMovieBySeq(no);
		model.addAttribute("list", list);
		
		Integer seq = no;
		List<ActorVO> actorList = actorService.selectActorByMovieSeq(seq);
		model.addAttribute("actorList", actorList);
		
		List<DirectorVO> directorList = directorService.selectDirectorByMovieSeq(seq);
		model.addAttribute("directorList", directorList);
		
		List<GenreVO> genreList = genreService.selectGenreByMovieSeq(seq);
		model.addAttribute("genreList", genreList);
		
		return "/movie/movie_detail";
	}
	
	@GetMapping("/movie_modify")
	public String getModifyMovie(Model model, @RequestParam Integer no){
		
		MovieVO list = service.selectMovieBySeq(no);
		
		SimpleDateFormat Datetime = new SimpleDateFormat("yyyy-MM-dd");
		Date movieDate = list.getCmi_open_date();
		String format = Datetime.format(movieDate);
		
		list.setChangeDate(format);
		
		model.addAttribute("list", list);
		
		Integer seq = no;
		List<ActorVO> actorList = actorService.selectActorByMovieSeq(seq);
		model.addAttribute("actorList", actorList);
		
		List<DirectorVO> directorList = directorService.selectDirectorByMovieSeq(seq);
		model.addAttribute("directorList", directorList);
		
		List<GenreVO> genreList = genreService.selectGenreByMovieSeq(seq);
		model.addAttribute("genreList", genreList);
		
		return "/movie/movie_modify";
	}
	
	@GetMapping("/schedule")
	public String getSchedule(Model model){
		
		model.addAttribute("menu_num", 4);
		
		return "/movie/schedule";
	}
	
}
