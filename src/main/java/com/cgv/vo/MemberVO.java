package com.cgv.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;



@Getter
@Setter
public class MemberVO {
	private Integer cmm_seq;
	private String cmm_id;
	private String cmm_name;
	private String cmm_email;
	private String cmm_address;
	private Integer cmm_gen;
	private String cmm_birth;
	private Integer cmm_collect_agree_other;
	private Integer cmm_receive_type;
	private Date cmm_reg_date;
	private Integer cmm_status;
	private Integer cmm_grade;
	private Integer cmm_type;
}
