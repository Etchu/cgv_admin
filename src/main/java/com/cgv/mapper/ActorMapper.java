package com.cgv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cgv.vo.ActorVO;

@Mapper
public interface ActorMapper {
	public void insertActor(ActorVO vo);
	public Integer selectActorCntByName(String name);
	public List<ActorVO> selectActorList();
	public void updateActor(ActorVO vo);
	public void deleteActor(Integer seq);
	
	public List<ActorVO> selectActorPopupList(String keyword);
	public ActorVO selectActorBySeq(Integer seq);
	
	public void insertActorInMovie(ActorVO vo);
	public List<ActorVO> selectActorByMovieSeq(Integer seq);
	
	public void deleteMovieInActor(Integer seq);
}
