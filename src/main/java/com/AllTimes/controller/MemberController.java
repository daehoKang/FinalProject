package com.AllTimes.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.AllTimes.dao.ArticleDao;
import com.AllTimes.dto.ArticleDto;
import com.AllTimes.service.MemberService;
import com.AllTimes.dto.MemberDto;

@Controller
public class MemberController {
	
	private ModelAndView mav;
	
	@Autowired

	private MemberService memSvc;
	
	@Autowired
	private ArticleDao artDao;
	
	@Autowired
    private JavaMailSender mailSender2;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/home")
	public String home() {
		System.out.println("/home 메인 페이지 이동");

		return "home";
	}
	
	/* 로그인 페이지 이동 */ 
	@RequestMapping(value = "/MemberLoginForm")
	public String MemberLoginForm( ) {
		System.out.println("/MemberLoginForm 로그인 페이지 이동");
		
		
		return "member/MemberLoginForm";
	}
	
	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/MemberJoinForm")
	public String MemberJoinForm( ) {
		System.out.println("/MemberJoinForm 회원가입 페이지 이동");
		

		
		return "member/MemberJoinForm";
	}
	
	/* 내정보보기 페이지 이동 */
	@RequestMapping(value = "/MemberModifyForm")
	public ModelAndView MemberModifyForm(String mid) {
		System.out.println("/MemberModifyForm 내정보보기 페이지 이동");
		
		mav = memSvc.MemberModifyForm(mid);
		
		return mav;
	}
	
	/* 회원 로그인 */
	@RequestMapping(value = "/MemberLogin")
	public ModelAndView MemberLogin(String mid, String mpw) {
		System.out.println("/MemberLogin 로그인 요청");
		System.out.println("아이디 : " + mid + " , 비밀번호 : " + mpw);
		
		mav = memSvc.MemberLogin(mid,mpw);
		
		return mav;
		
	}
	
	/* 기자 로그인 */
	@RequestMapping(value = "/ReporterLogin")
	public ModelAndView ReporterLogin(String rid, String rpw) {
		System.out.println("/ReporterLogin 로그인 요청");
		
		if(rid.equals("admin")&&rpw.equals("admin")) {
			mav = memSvc.adminLogin();
		}else {
		mav = memSvc.ReporterLogin(rid,rpw);
		}
		return mav;
		
	}
	
	/* 회원,기자 로그아웃 */
	@RequestMapping(value= "/MemberLogout")
	public ModelAndView memberLogut() {
		System.out.println("/memberLogut 로그아웃 요청");
		
		mav = memSvc.MemberLogout();
		
		return mav;
	}
	/* 회원 정보 수정 */
	@RequestMapping(value = "/MemberModify")
	public ModelAndView MemberModify(MemberDto member, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("/memberModify 정보수정 요청");
		System.out.println("수정할 회원 정보: " + member);
		
		mav = memSvc.memberModify(member, ra);
		
		return mav;
	}
	
	 /* 회원가입 */
    	@RequestMapping(value="/MemberJoin")
    	public ModelAndView MemberJoin(MemberDto member) {
    	
    	System.out.println("입력한 회원가입정보 : " + member);
    
    	mav = memSvc.registMember(member);
    	
    	return mav;
    	
    }
    
    /* 아이디 중복 체크 */
    @RequestMapping(value = "/MemberIdCheck")
	public @ResponseBody String MemberIdCheck(String userInputId) {
		System.out.println("/MemberIdCheck 아이디 중복확인");
		System.out.println("입력한 아이디 : " + userInputId);
		
		String checkResult = memSvc.checkMemberId(userInputId);
		
		
		return checkResult;
	}
    
    /* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        System.out.println("이메일 인증번호 :  " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 : " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "daehokok@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "저희 ALL TIMES 신문사 페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender2.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender2.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
    
	/* 아이디찾기 이메일 인증 */
    @RequestMapping(value="/mailIDCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailIDCheckGET(String email) throws Exception{
        
        System.out.println("이메일 인증번호 :  " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 : " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "daehokok@gmail.com";
        String toMail = email;
        String title = "ALL TIMES 아이디 찾기 이메일 입니다.";
        String content = 
                "저희 ALL TIMES 신문사 페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br><br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender2.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender2.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
    
    /* 비밀번호찾기 이메일 인증 */
    @RequestMapping(value="/mailPWCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailPWCheckGET(String email) throws Exception{
        
        System.out.println("이메일 인증번호 :  " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 : " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "daehokok@gmail.com";
        String toMail = email;
        String title = "ALL TIMES 비밀번호 찾기 이메일 입니다.";
        String content = 
                "저희 ALL TIMES 신문사 페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br><br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender2.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender2.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
	
    
    /* 카카오 로그인 */
    @RequestMapping(value ="/MemberKakaoLogin")
    public ModelAndView MemberKakaoLogin(String mname) {
    	
    	System.out.println(mname);
    	
    	mav = new ModelAndView();
    	
    	session.setAttribute("loginMid", mname);
    	session.setAttribute("loginMname", mname);
    	
    	
    	mav.setViewName("redirect:/");
    	
    	return mav;
    }
    
    /* 네이버 로그인 */
    @RequestMapping(value ="/MemberNaverLogin")
    public ModelAndView MemberNaverLogin(String mname) {
    	
    	System.out.println(mname);
    	
    	mav = new ModelAndView();
    	
    	session.setAttribute("loginMid", mname);
    	session.setAttribute("loginMname", mname);
    	
    	
    	mav.setViewName("redirect:/");
    	
    	return mav;
    	
    }
    
    /* 아이디찾기 페이지 이동 */
    @RequestMapping(value="/MemberIDSearch")
    public ModelAndView MemberIDSearch() {
    	System.out.println("아이디찾기 이동");
    	
    	mav = memSvc.MemberIDSearch();
    	
    	return mav;
    }
    
    /* 비밀번호찾기 페이지 이동 */
    @RequestMapping(value="/MemberPWSearch")
    public ModelAndView MemberPWSearch() {
    	System.out.println("비밀번호찾기 이동");
    	
    	mav = memSvc.MemberPWSearch();
    	
    	return mav;
    }

    /* 아이디찾기 */
    @RequestMapping(value="/IdSearch")
    public ModelAndView IdSearch(String mmail) {
    	System.out.println("입력한 이메일 :" + mmail);
    	
    	mav = memSvc.IdSearch(mmail);
    	
    	return mav;
    }
    
    
    /* 비밀번호찾기 */
    @RequestMapping(value="/PwSearch")
    public ModelAndView PwSearch(String mid, String mmail) {
    	System.out.println("입력한 아이디 :" + mid);
    	System.out.println("입력한 메일 :" + mmail);
    	
    	mav = memSvc.PwSearch(mid,mmail);
    	
    	return mav;
    }
	
	/*
	
	@RequestMapping (value="/Admin_Login")
	public String Admin_Login() {
		
		System.out.println("/Admin_Login 관리자 페이지 이동");
		
		
		
		return "Admin/Admin_Home";
	}
*/
	

}
