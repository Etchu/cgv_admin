package com.cgv.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.mapper.MovieImageMapper;
import com.cgv.mapper.MovieMapper;
import com.cgv.vo.MovieVO;

@Service
public class MovieService {
	
	@Autowired
	MovieMapper mapper;
	
	@Autowired
	MovieImageMapper imageMapper;
	
	public void insertMovie(MovieVO vo) {
		mapper.insertMovie(vo);
	}
	
	public boolean checkedMovie(String name) {
		Integer result = mapper.selectMovieCntByName(name);
		if(result == 1) {
			return false;
		}
		return true;
	}
	
	public List<MovieVO> selectMovies(){
		return mapper.selectMovieList();
	}
	
	public MovieVO selectMovieBySeq(Integer no) {
		MovieVO list = mapper.selectMovieBySeq(no);
		Integer seq = no;
		String imageName = imageMapper.selectMovieImageName(seq);
		list.setImage_name(imageName);
		
		String prefix="/movie_img/";
		String uri = imageMapper.selectMovieImageURI(no);
		if(uri != null) {
			list.setImage_uri(prefix+uri);
		}
		return list;
	}
	
	public void updateMovie(MovieVO vo) {
		mapper.updateMovie(vo);
	}
	
	public void deleteMovie(Integer seq) {
		mapper.deleteMovie(seq);
	}
	
}
