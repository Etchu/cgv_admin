package com.cgv.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GenreVO {
	
	private Integer cmg_seq;
	private String cmg_name;
	private Date cmg_reg_date;
	
	private Integer cmig_genre_seq;
	private Integer cmig_info_seq;
}
