package com.cgv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cgv.vo.MovieVO;

@Mapper
public interface MovieMapper {
	public void insertMovie(MovieVO vo);
	public Integer selectMovieCntByName(String name);
	public List<MovieVO> selectMovieList();
	public MovieVO selectMovieBySeq(Integer no);
	public void updateMovie(MovieVO vo);
	public void deleteMovie(Integer seq);
}
