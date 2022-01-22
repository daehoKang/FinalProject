package com.AllTimes.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.AllTimes.dto.MemberDto;
import com.AllTimes.dto.ReporterDto;
import com.AllTimes.paging.Criteria;

@Mapper
public interface AdminDao {

	ArrayList<MemberDto> MemberList(Criteria cri);

//	MemberDto ReporterModifyForm(String mid);

	String MemberPwGet(String mid);
	
	String memberTelCheck(String inputContact);

	ReporterDto ReporterInfo(String rid);

	String ReporterModifyForm(String rid);
	
	String ReporterPwGet(String rid);
	
	int ReporterModify(ReporterDto reporterInfo);

	int reporterDelete(String rid);

	int stateToggle(@Param("rid") String rid, @Param("rstate") int rstate);

	int registReporter(ReporterDto reporterForm);

	String oldFileSelect(String rid);

	int profileChange(ReporterDto reporter);

	String reporterIdCheck(String inputId);

	String reporterTelCheck(String inputContact);
	
	ArrayList<ReporterDto> rSearchAll(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<ReporterDto> rSearchName(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<ReporterDto> rSearchId(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<MemberDto> mSearchAll(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<MemberDto> mSearchId(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<MemberDto> mSearchName(@Param("keyword") String keyword, @Param("cri") Criteria cri);

	ArrayList<ReporterDto> reporterListPaging(Criteria cri);
	
	ArrayList<ReporterDto> ReporterArticleManagement(String rid);
	
	int getTotalAccountR();

	int getSearchAccountR(String keyword);

	int getTotalAccountM();
	
	int getSearchAccountM(String keyword);


	int MemberModify(MemberDto memberInfo);

	MemberDto selectReporterModify(String mid);




	

	



}
