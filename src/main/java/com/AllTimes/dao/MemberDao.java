package com.AllTimes.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.AllTimes.dto.MemberDto;
import com.AllTimes.dto.ReporterDto;

public interface MemberDao {

	//@Select("SELECT * FROM MEMBER WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto MemberLogin(@Param("mid")String mid, @Param("mpw")String mpw);

	ReporterDto ReporterLogin(@Param("rid")String rid, @Param("rpw")String rpw);

	MemberDto selectMemberModifyForm(String mid);
	
	int updateMember(MemberDto member);
	
	int insertMember(MemberDto member);
	
	@Select("SELECT MID FROM MEMBER WHERE MID = #{userInputId}")
	String checkMemberId(String userInputId);

	MemberDto selectIdSearch(String mmail);
	
	@Select("SELECT MID FROM MEMBER WHERE MMAIL = #{userInputMail}")
	String checkMemberMail(String userInputMail);

	MemberDto selectPwSearch(@Param("mid")String mid, @Param("mmail")String mmail);


}
