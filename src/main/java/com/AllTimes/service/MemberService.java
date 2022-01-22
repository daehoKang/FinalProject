package com.AllTimes.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.dao.ArticleDao;
import com.AllTimes.dao.MemberDao;
import com.AllTimes.dto.ArticleDto;
import com.AllTimes.dto.MemberDto;
import com.AllTimes.dto.ReporterDto;

@Service
public class MemberService {

	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private ArticleDao articleDao;

	
//	private String savePath = "";

	
		/* 회원 로그인 */
	public ModelAndView MemberLogin(String mid, String mpw) {
		
		mav = new ModelAndView();
		
		MemberDto MemberLogin = mdao.MemberLogin(mid,mpw);
		
		//아이디 비밀번호 확인
		if(MemberLogin != null) {
			//로그인성공
			System.out.println("로그인성공");
			//세션에 로그인 정보 저장
			session.setAttribute("loginMid", MemberLogin.getMid());
			session.setAttribute("loginMname", MemberLogin.getMname());
			mav.setViewName("redirect:/");
			
		} else {
			// 로그인 실패
			System.out.println("로그인실패");
			mav.setViewName("redirect:/MemberLoginForm");
		}
		
		return mav;
	}
	
	
	/* 기자 로그인 */
	public ModelAndView ReporterLogin(String rid, String rpw) {
		
		mav = new ModelAndView();
		
		ReporterDto ReporterLogin = mdao.ReporterLogin(rid,rpw);
		
		//아이디 비밀번호 확인
		if(ReporterLogin != null) {
			//로그인성공
			System.out.println("로그인성공");
			//세션에 로그인 정보 저장
			session.setAttribute("loginRid", ReporterLogin.getRid());
			session.setAttribute("loginRname", ReporterLogin.getRname());
			session.setAttribute("loginRprofile", ReporterLogin.getRprofile());
			mav.setViewName("redirect:/");
			
		} else {
			
			// 로그인 실패
			System.out.println("로그인실패");
			mav.setViewName("redirect:/ReporterLoginForm");
		}
		
		return mav;
	}

	/* 로그아웃 */
	public ModelAndView MemberLogout() {
		
		mav = new ModelAndView();
		
		session.invalidate();
		
		mav.setViewName("redirect:/");	
		
		return mav;
	}

	public ModelAndView memberModify(MemberDto member, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("MemberService.MemberModify()");
		mav = new ModelAndView();
		int updateResult = 0 ; 
		try {
			updateResult = mdao.updateMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정실패");
		}
		
		if(updateResult > 0) {
			ra.addFlashAttribute("modifyMsg", member.getMid()+" 회원의 정보를 수정하였습니다.");
		} else {
			ra.addFlashAttribute("modifyMsg", member.getMid()+ " 회원의 정보수정을 실패하였습니다.");
		}
		
		mav.setViewName("redirect:/");
		System.out.println("updateResult");
		return mav;

		}

	/*회원 정보 조회*/
	public ModelAndView MemberModifyForm(String mid) {
		System.out.println("MemberService.MemberModifyForm");
		mav = new ModelAndView();
		
		MemberDto MemberModify = mdao.selectMemberModifyForm(mid);
		
		mav.addObject("memberModify", MemberModify);
		mav.setViewName("member/MemberModifyForm");
		return mav;
	}


	public ModelAndView adminLogin() {
		System.out.println("MemberService.AdminLogin()");
		mav = new ModelAndView();
		mav.setViewName("redirect:/Admin_Home");
		session.setAttribute("loginRid", "Admin");
		
		return mav;
	}
	
	public ModelAndView MemberLoginForm() {
		mav = new ModelAndView();
		
		/*footer*/
		ArrayList<ArticleDto> ArticleHits = articleDao.selectMainArticleHits();
		ArrayList<ArticleDto> ArticleLatestFooter = articleDao.selectArticleLatestFooter();
		mav.addObject("ArticleHits", ArticleHits);
		mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
		
		mav.setViewName("member/MemberLoginForm");
		
		return mav;
	}


	public ModelAndView MemberJoinForm() {
		mav = new ModelAndView();
		
		/*footer*/
		ArrayList<ArticleDto> ArticleHits = articleDao.selectMainArticleHits();
		ArrayList<ArticleDto> ArticleLatestFooter = articleDao.selectArticleLatestFooter();
		mav.addObject("ArticleHits", ArticleHits);
		mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
		
		mav.setViewName("member/MemberJoinForm");
		
		return mav;
	}


	public ModelAndView MemberInfo() {
		mav = new ModelAndView();
		
		/*footer*/
		ArrayList<ArticleDto> ArticleHits = articleDao.selectMainArticleHits();
		ArrayList<ArticleDto> ArticleLatestFooter = articleDao.selectArticleLatestFooter();
		mav.addObject("ArticleHits", ArticleHits);
		mav.addObject("ArticleLatestFooter", ArticleLatestFooter);
		
		mav.setViewName("member/MemberInfo");
		
		return mav;
	}

	/* 회원가입 */
	public ModelAndView registMember(MemberDto member) {
		
		mav = new ModelAndView();
		
		int insertResult = mdao.insertMember(member);
		System.out.println("회원가입 결과 : " + insertResult);
		
		if(insertResult > 0) {
			System.out.println("회원가입 성공");
			mav.setViewName("redirect:/");
		} else {
			System.out.println("회원가입 실패");
		}
		
		return mav;
	}


	public String checkMemberId(String userInputId) {
		System.out.println("MemberService.checkMemberId()");
		
		String mid = mdao.checkMemberId(userInputId);
		System.out.println("중복확인 : " + mid);
		
		String checkResult = "NO";
		
		if(mid == null) {
			checkResult = "OK";
		}
		
		return checkResult;
	}

	/* 아이디찾기 페이지이동 */
	public ModelAndView MemberIDSearch() {
		
		
		mav = new ModelAndView();
		
		mav.setViewName("member/MemberIDSearch");
		
		return mav;
	}
	
	/* 비밀번호찾기 페이지이동 */
	public ModelAndView MemberPWSearch() {
		
		
		mav = new ModelAndView();
		
		mav.setViewName("member/MemberPWSearch");
		
		return mav;
	}


	public ModelAndView IdSearch(String mmail) {
		
		mav = new ModelAndView();
		
		
		MemberDto IdSearch = mdao.selectIdSearch(mmail);
		
		System.out.println(IdSearch);
		
		if(IdSearch != null) {
			System.out.println("인증 성공");
			
			mav.setViewName("member/MemberID");
			
			
		}else {
			System.out.println("인증 실패");
			
			
			mav.setViewName("member/MemberIDSearch");
		}
		
		
		mav.addObject("IdSearch", IdSearch);
		return mav;
	}


	public ModelAndView PwSearch(String mid, String mmail) {
		mav = new ModelAndView();
		
		
		MemberDto PwSearch = mdao.selectPwSearch(mid,mmail);
		
		System.out.println(PwSearch);
		
		if(PwSearch != null) {
			System.out.println("인증 성공");
			
			mav.setViewName("member/MemberPW");
			
			
		}else {
			System.out.println("인증 실패");
			
			
			mav.setViewName("member/MemberPWSearch");
		}
		
		
		mav.addObject("PwSearch", PwSearch);
		return mav;
	}


	
}
