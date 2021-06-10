package com.cgv.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.mapper.ActorMapper;
import com.cgv.vo.ActorVO;

@Service
public class ActorService {
	
	@Autowired
	ActorMapper mapper;
	
	public void insertActor(ActorVO vo) {
		mapper.insertActor(vo);
	}
	
	public boolean checkedActor(String name) {
		Integer result = mapper.selectActorCntByName(name);
		if(result == 1) {
			return false;
		}
		return true;
	}
	
	public List<ActorVO> selectActors(){
		return mapper.selectActorList();
	}
	
	public void updateActor(ActorVO vo) {
		mapper.updateActor(vo);
	}
	
	public void deleteActor(Integer seq) {
		mapper.deleteActor(seq);
	}
	
	public List<ActorVO> selectActorPopupList(String keyword){
		List<ActorVO> resultList = new ArrayList<ActorVO>();
		
		resultList = mapper.selectActorPopupList(keyword);
		
		return resultList;
	}
	
	public ActorVO selectActorBySeq(Integer seq) {
		
		return mapper.selectActorBySeq(seq);
	}
	
	public void insertActorInMovie(ActorVO vo) {
		mapper.insertActorInMovie(vo);
	}
	
	public List<ActorVO> selectActorByMovieSeq(Integer seq) {
		List<ActorVO> resultList = new ArrayList<ActorVO>();
		
		resultList = mapper.selectActorByMovieSeq(seq);
		
		return resultList;
	}
	
	public void deleteMovieInActor(Integer seq) {
		mapper.deleteMovieInActor(seq);
	}
}
