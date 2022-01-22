package com.AllTimes.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.dto.ReporterDto;
import com.AllTimes.dao.ArticleDao;
import com.AllTimes.dto.ArticleDto;

@Service
public class ReporterService {

		private ModelAndView mav;
		
		@Autowired
		private ArticleDao artDao;

		@Autowired
		private HttpSession session;
		
		private String savePath 
		= "C:\\Users\\mm\\Documents\\workspace-sts-3.9.18.RELEASE\\AllTimes\\src\\main\\webapp\\resources\\upLoadedFile";
		
		public ModelAndView reporterWrite(ArticleDto article,RedirectAttributes ra)	throws IllegalStateException, IOException {
		
			System.out.println("ReporterWrite.reporterWrite()");
			mav = new ModelAndView();
		
			// 글번호 생성
			int ar_no = artDao.getArticleMaxNo();
			System.out.println("ar_no : " + ar_no);
			article.setAr_no(ar_no + 1);
			
			// 첨부파일
			MultipartFile AR_FILE = article.getAr_file();
			String AR_FILENAME = "";
			
			if(!AR_FILE.isEmpty()) {
				AR_FILENAME = AR_FILE.getOriginalFilename();
				//파일명을 추출하는 부분
				UUID uuid = UUID.randomUUID();
				//중복방지를 위한 임의의 파일명
				AR_FILENAME = uuid.toString()+"_"+AR_FILENAME;
				//임의의 파일명 + 파일명을 합쳐서 파일명 재정의
				System.out.println("첨부파일명 : " + AR_FILENAME);
				AR_FILE.transferTo( new File(savePath, AR_FILENAME) );
				//아무 내용도 없이 이름만있는(AR_FILENAME)에다가 웹에서 올린파일을 덮어쓰기
			}
			article.setAr_filename(AR_FILENAME);
			
			// insert문 수행
					String test_Rid = "TEST2";
					article.setAr_name(test_Rid);
					System.out.println(article);
					
					int insertResult = artDao.insertArticle(article);
					System.out.println("insertResult : " +insertResult);
					
					ra.addFlashAttribute("msg", article.getAr_no()+"번 글이 등록 되었습니다.");
					
			// 기자 이름
					
			// addObject : key와 value를 담아 보낼 수 있는 메서드
			
			mav.setViewName("redirect:/ReporterModifyForm");
			return mav;
		
			
		}
		
			
			
		public ModelAndView reporterWriteForm() {
			System.out.println("/ReporterService.ReporterWriteForm ()");
			mav = new ModelAndView();
			mav.setViewName("Reporter/ReporterWriteForm");
			return mav;
		}
		
		
		
		
		
		public ModelAndView reporterModifyForm(String rid) {
			System.out.println("ReporterService.ReporterModifyForm()");
			mav = new ModelAndView();	
			
			ArrayList<ArticleDto> Article = artDao.selectReporterModify(rid);
			
			mav.addObject("Article",Article);
			//MemberModify에서 value값
			mav.setViewName("Reporter/ReporterModifyForm");
			return mav;
		}

		
		public ModelAndView reporterModify(ReporterDto rid, RedirectAttributes ra) throws IllegalStateException, IOException {
			System.out.println("/ReporterService.ReporterModifyForm ()");
			mav = new ModelAndView();
			
			mav.setViewName("Reporter/ReporterModifyForm");
			return mav;
		}



		public ModelAndView ReporterInfo(String rid) {
			System.out.println("ReporterService.ReporterInfo()");
			mav.setViewName("Reporter/ReporterInfo");
			
			return mav;
		}
		
		public ModelAndView ReporterArticleManagement() {
			System.out.println("ReporterService.ReporterArticleManagement()");
			mav = new ModelAndView();	
			
			mav.setViewName("ReporterArticleManagement");
			return mav;
		}

}
