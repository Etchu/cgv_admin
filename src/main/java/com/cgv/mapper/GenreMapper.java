package com.cgv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cgv.vo.GenreVO;

@Mapper
public interface GenreMapper {
	public void insertGenre(String name);
	public Integer selectGenreCntByName(String name);
	public List<GenreVO> selectGenreList();
	public void updateGenre(GenreVO vo);
	public void deleteGenre(Integer seq);
	
	public List<GenreVO> selectGenrePopupList(String keyword);
	public GenreVO selectGenreBySeq(Integer seq);
	
	public void insertGenreInMovie(GenreVO vo);
	public List<GenreVO> selectGenreByMovieSeq(Integer seq);
	
	public void deleteMovieInGenre(Integer seq);
}
