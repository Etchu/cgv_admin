package com.cgv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cgv.vo.DirectorVO;

@Mapper
public interface DirectorMapper {
	public void insertDirector(DirectorVO vo);
	public Integer selectDirectorCntByName(String name);
	public void updateDirector(DirectorVO vo);
	public void deleteDirector(Integer seq);
	public List<DirectorVO> selectDirectorList();
	
	public List<DirectorVO> selectDirectorPopupList(String keyword);
	public DirectorVO selectDirectorBySeq(Integer seq);
	
	public void insertDirectorInMovie(DirectorVO vo);
	public List<DirectorVO> selectDirectorByMovieSeq(Integer seq);
	
	public void deleteMovieInDirector(Integer seq);
}
