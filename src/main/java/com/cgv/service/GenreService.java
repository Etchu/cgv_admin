package com.cgv.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.mapper.GenreMapper;
import com.cgv.vo.GenreVO;

@Service
public class GenreService {
	
	@Autowired
	GenreMapper mapper;
	
	public void insertGenre(String name) {
		mapper.insertGenre(name);
	}
	
	public boolean checkedGenre(String name) {
		Integer result = mapper.selectGenreCntByName(name);
		if(result == 1) {
			return false;
		}
		return true;
	}
	
	public List<GenreVO> selectGenres(){
		return mapper.selectGenreList();
	}
	
	public void updateGenre(GenreVO vo) {
		mapper.updateGenre(vo);
	}
	
	public void deleteGenre(Integer seq) {
		mapper.deleteGenre(seq);
	}
	
	public List<GenreVO> selectGenrePopupList(String keyword){
		List<GenreVO> resultList = new ArrayList<GenreVO>();
		
		resultList = mapper.selectGenrePopupList(keyword);
		
		return resultList;
	}
	
	public GenreVO selectGenreBySeq(Integer seq) {
		
		return mapper.selectGenreBySeq(seq);
	}
	
	public void insertGenreInMovie(GenreVO vo) {
		mapper.insertGenreInMovie(vo);
	}
	
	public List<GenreVO> selectGenreByMovieSeq(Integer seq) {
		List<GenreVO> resultList = new ArrayList<GenreVO>();
		
		resultList = mapper.selectGenreByMovieSeq(seq);
		
		return resultList;
	}
	
	public void deleteMovieInGenre(Integer seq) {
		mapper.deleteMovieInGenre(seq);
	}
}
