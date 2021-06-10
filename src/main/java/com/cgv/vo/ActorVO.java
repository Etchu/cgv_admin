package com.cgv.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActorVO {
	private Integer cma_seq;
	private String cma_name;
	private String cma_content;
	private Date cma_reg_date;
	
	private Integer cmia_actor_seq;
	private Integer cmia_info_seq;
}
