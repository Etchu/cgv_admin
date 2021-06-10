package com.cgv.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieVO {
	
	private Integer cmi_seq;
	private String cmi_name;
	private String cmi_sub_name;
	private String cmi_content;
	private String cmi_country;
	private String cmi_runningtime;
	private Date cmi_open_date;
	private Integer cmi_type;
	private Integer cmi_screen;
	private Integer cmi_grade;
	private Integer cmi_mimg_seq;
	private Date cmi_reg_date;
	private String changeDate;
	
	private String image_uri;
	private String image_name;
	
	
}
