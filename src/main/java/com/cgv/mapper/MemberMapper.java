package com.cgv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cgv.vo.LoginVO;
import com.cgv.vo.MemberUpdateVO;
import com.cgv.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	public boolean loginMember(LoginVO vo);
	public List<MemberVO> selectMembers(Integer offset);
	public Integer selectMemberCount();
	public void updateMemberInfo(MemberUpdateVO vo);
	public void deleteMember(Integer seq);
}
