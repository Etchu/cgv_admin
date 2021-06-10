package com.cgv.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.cgv.vo.MovieImageVO;

@Mapper
public interface MovieImageMapper {
	public void insertMovieImage(MovieImageVO vo);
	public MovieImageVO selectMovieImage(String uri);
	public String selectMovieImageURI(Integer seq);
	public String selectMovieImageName(Integer seq);
}
