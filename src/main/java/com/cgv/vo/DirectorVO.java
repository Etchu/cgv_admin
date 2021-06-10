package com.cgv.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DirectorVO {
	private Integer cmd_seq;
	private String cmd_name;
	private String cmd_content;
	private Date cmd_reg_date;
	
	private Integer cmid_director_seq;
	private Integer cmid_info_seq;
}
