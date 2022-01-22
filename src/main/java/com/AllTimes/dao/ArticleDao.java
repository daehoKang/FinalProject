package com.AllTimes.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.CommentsDto;
import com.AllTimes.dto.ReporterDto;

public interface ArticleDao {

	int selectArticleCount(String ar_genre);

	ArrayList<ArticleDto> selectArticleList(String ar_genre);

	void updateArticleHits(int ar_no);
	
	int selectArticleHits(int ar_no);
	
	ArticleDto selectArticleRead(int ar_no);
	
	int selectCommentsNumber();
	
	int insertCommentsWrite(CommentsDto comment);
	
	//void updateCommentsNumber(int ar_no); 사용되지 않음
	
	ArrayList<CommentsDto> selectCommentsList(int ar_no);

	int selectCommentsCount(int ar_no);

	void deleteComments(int cm_no);
	
	ArrayList<ArticleDto> selectSearchArticle(String searchArticle);
	
	ArticleDto selectArticleInfo(String ar_no);

	ArrayList<ArticleDto> selectAllArticleList();

	ArrayList<ArticleDto> selectMainArticleHits();

	ArrayList<ArticleDto> selectRandomArticle();

	ArrayList<ArticleDto> selectArticleCovid();

	ArrayList<ArticleDto> selectArticlePolitics();

	ArrayList<ArticleDto> selectArticleSociety();

	ArrayList<ArticleDto> selectArticleCulture();

	ArrayList<ArticleDto> selectArticleEconomy();

	ArrayList<ArticleDto> selectArticleSports();

	ArrayList<ArticleDto> selectArticleInternational();

	ArrayList<ArticleDto> selectArticleLatest();
	
	ArrayList<ArticleDto> selectArticleLatestHits();

	ArrayList<ArticleDto> selectArticleLatestThumbsup();

	ArrayList<ArticleDto> selectArticleLatestFooter();


	int getArticleMaxNo();
	int insertArticle(ArticleDto article);
	ArrayList<ArticleDto> selectReporterModify(String test_Rid);

	int selectArticleNumber(int cm_no);

	int selectDuplicationCheck(@Param("ar_no" )int ar_no, @Param("mid") String mid);

	void updateArticleThumbsUp(int ar_no);

	void updateArticleThumbsDown(int ar_no);

	void insertDup_CheckThumbsUp(@Param("ar_no") int ar_no, @Param("mid") String mid);

	void insertDup_CheckThumbsDown(@Param("ar_no" )int ar_no, @Param("mid") String mid);

	void updateComments(@Param("cm_no") int cm_no, @Param("cm_detail") String cm_detail);
	
	ReporterDto ReporterModifyForm(String rid);
	
	@Select("SELECT * FROM ARTICLE WHERE AR_TITLE LIKE '%'||#{searchText}||'%'")
	ArrayList<ArticleDto> selectSearchArticleList_TITLE(String articleSearch);
	
	@Select("SELECT * FROM ARTICLE WHERE AR_DETAIL LIKE '%'||#{searchText}||'%'")
	ArrayList<ArticleDto> selectSearchArticleList_DETAIL(String articleSearch);


}
