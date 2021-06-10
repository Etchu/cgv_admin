package com.cgv.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.mapper.DirectorMapper;
import com.cgv.vo.DirectorVO;

@Service
public class DirectorService {
	
	@Autowired
	DirectorMapper mapper;
	
	public void insertDirector(DirectorVO vo) {
		mapper.insertDirector(vo);
	}
	
	public boolean checkedDirector(String name) {
		Integer result = mapper.selectDirectorCntByName(name);
		if(result == 1) {
			return false;
		}
		return true;
	}
	
	public List<DirectorVO> selectDirectors(){
		return mapper.selectDirectorList();
	}
	
	public void updateDirector(DirectorVO vo) {
		mapper.updateDirector(vo);
	}
	
	public void deleteDirector(Integer seq) {
		mapper.deleteDirector(seq);
	}
	
	public List<DirectorVO> selectDirectorPopupList(String keyword){
		List<DirectorVO> resultList = new ArrayList<DirectorVO>();
		
		resultList = mapper.selectDirectorPopupList(keyword);
		
		return resultList;
	}
	
	public DirectorVO selectDirectorBySeq(Integer seq) {
		
		return mapper.selectDirectorBySeq(seq);
	}
	
	public void insertDirectorInMovie(DirectorVO vo) {
		mapper.insertDirectorInMovie(vo);
	}
	
	public List<DirectorVO> selectDirectorByMovieSeq(Integer seq) {
		List<DirectorVO> resultList = new ArrayList<DirectorVO>();
		
		resultList = mapper.selectDirectorByMovieSeq(seq);
		
		return resultList;
	}
	
	public void deleteMovieInDirector(Integer seq) {
		mapper.deleteMovieInDirector(seq);
	}
	
}
