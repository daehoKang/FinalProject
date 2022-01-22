<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
      <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>All Times News</title>

      <!--Bootstrap core CSS-->
	  <link href="resources/css/bootstrap.min.css" rel="stylesheet">
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

      <!-- Custom styles for this template -->

      <link href="resources/css/custom.css" rel="stylesheet">
      <link href="resources/css/responsive-style.css" rel="stylesheet">  
      <link href="resources/css/weather-icons.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css" />
      <link href="resources/css/lightbox.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="resources/css/loaders.css"/>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
      
</head>
<body>

<%@ include file="../includes/Header.jsp" %>

<section class="section-01 section_login">
					        <div class="container">
					    <div class="row">
					            <div class="col-lg-12 ">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 style="text-align:center; font-weight:bold;">비밀번호찾기</h4>
                                </div>

                                	 <form action="PwSearch" method="post" onsubmit="return PWSearch();" class="user">
                                    <div class="form-group" style="margin-bottom:0rem" >
                                        <input type="text" name="mid"  class="login_text_box"
                                            id="inputMid" aria-describedby="emailHelp"
                                            placeholder="아이디를 입력하세요..." style="border-radius: 10px; margin-top:30px;">
                                        <span id="mailCheckMsg" style="font-size: 15px; padding-left:350px; font-weight:bold;"></span>
                                    </div>
                                    
                                    <div class="form-group" style="margin-bottom:0rem">
                                    <input type="email" name="mmail"  class="login_text_box"
                                            id="inputMmail" aria-describedby="emailHelp"
                                            placeholder="이메일을 입력하세요..." style="border-radius: 10px; ">
                                        <span id="mailCheckMsg" style="font-size: 15px; padding-left:350px; font-weight:bold;"></span>
                                    </div>
  									
  									 <div class="form-group" class="mail_check_input_box" style="margin-bottom:2rem">
                                        <input type="text"   class="join_email_check_false"
                                            id="mail_check_input" disabled="disabled" style="border-radius: 10px; ">
                                        <button type="button" class="mail_check_button" style="position:absolute; float:right; right:360px; 
                                        	 border-radius:5px; border-color:lightgray; background-color:white; margin-top:3px; ">인증번호 전송</button>
                                        <span id="mail_check_input_box_warn" style="position:absolute; margin-top:45px; left:360px;"></span>
                                    </div>
  
                       
                                    <input type="submit" class="btn login_btn login_button" value="확인" style="border-radius: 10px; margin-top:10px;">
                                    
                                   

                                    
                                    
                                    <hr style="margin-top: 2rem;">
                                    
                                </form>
                                
                                <p style="text-align:center; font-size:14px;">
                                		<a class="small" href="MemberIDSearch">아이다찾기</a>
                                </p>
                                
                                <p style="text-align:center; font-size:14px;">
                                		<a class="small" href="MemberLoginForm">로그인</a>
                                </p>
                                
                                <div class="text-center" >
                                	<p style="margin-top:0; margin-bottom: 0.5rem; text-align:center; font-size:14px;">
                                		 <a class="small" href="MemberJoinForm">회원가입</a>
                                	</p>
                                	
                                	
                                	

                                	
                                	

                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</section>


<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>



<script type="text/javascript">

var code = "";  
/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
    
    var email = $("#inputMmail").val();        	 // 입력한 이메일
    var checkBox = $("#mail_check_input");       // 인증번호 입력란
    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
    
	$.ajax({
        type:"GET",
        url:"mailPWCheck?email=" + email,
        success:function(data){
        	
        	checkBox.attr("disabled",false);
        	boxWrap.attr("class", "join_email_check_false_true");
        	code = data;
        }
                
    });
    
});
/* 인증번호 비교 */
$("#mail_check_input").blur(function(){
    var inputCode = $("#mail_check_input").val();        // 입력코드    
    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과  
    
    if(inputCode == code){                            // 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct");        
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
 
    }    
    
});

</script>


<script type="text/javascript">

function PWSearch(){
	
	var checkMmail = $("#inputMid").val();
	
	if(checkMmail == ""){
		console.log("아이디를 입력해야합니다.");
		alert("아이디를 입력해주세요.");
		$("#inputMid").focus();
		return false;
	
	}
	
	var checkMmail = $("#inputMmail").val();
	
	if(checkMmail == ""){
		console.log("메일을 입력해야합니다.");
		alert("메일을 입력해주세요.");
		$("#inputMmail").focus();
		return false;
	
	}
	
	var quoteMmail = $("#mail_check_input").val();
	
	if(quoteMmail == ""){
		console.log("인증번호를 입력해주세요.");
		alert("인증번호를 입력해주세요.");
		$("mail_check_input").focus();
		return false;
	
	}
	
	if($("#mail_check_input_box_warn").hasClass("incorrect")){
		console.log("인증에 실패하였습니다.");
		alert("인증에 실패하였습니다. 인증번호를 다시 입력해주세요");
		$("#mail_check_input").focus();
		return false;
		
	}
	

}

</script>


	
	










<%@ include file="../includes/AnotherFooter.jsp" %>


<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="resources/js/jquery.min.js"></script> 
<script src="resources/js/bootstrap.min.js"></script> 
<script src="resources/js/core.js?ver=1"></script> 

<!--  Jquery 사용 스크립트 -->
<script src="resources/js/lightbox-plus-jquery.min.js"></script> 



</body>
</html>
