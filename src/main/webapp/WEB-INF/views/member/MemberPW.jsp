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
                                    <h6 style="text-align:center; ">회원님의 비밀번호는</h6>
                                </div>
								
								<div>
									<h6 style="text-align:center; font-weight:bold;">${PwSearch.mpw}</h6> 
									
									<h6 style="text-align:center;">입니다.</h6>
								</div>
                                    
                                    <hr style="margin-top: 3rem; margin-bottom: 3rem;">
                                    
								<p style="text-align:center; font-size:14px;">
                                		<a class="small" href="MemberLoginForm">로그인</a>
                                </p>
                                
                                <p style="text-align:center; font-size:14px;">
                                		<a class="small" href="MemberIDSearch">아이디찾기</a>
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

	
	var checkMail = false;
	

		$(document).ready(function(){
		
		$("#inputMmail").keyup( function (){ 
			var userInputMail = $("#inputMmail").val();
			console.log("입력한 메일 : " + userInputMail);
			
			if(userInputMail.length <= 0){
				//alert("메일을 입력해주세요");
				checkMail = false;
				
			} else {
				$.ajax({ 
					type : "get",
					url : "MemberMailCheck",
					data : { "userInputMail" : userInputMail },
					success : function(result){  
						console.log("result : " + result);
						if(result == "OK"){
							alert("메일 인증에 성공하였습니다.");
							checkMail = true;
						} else {
							
							checkMail = false;
							alert("가입시 입력했던 메일을 입력해주세요");
						}
					},
					error : function(){
						alert("ajax 연결 실패!");
					}
				});
			}
			
			
			
		});
		
		
	});
		
</script>


<script type="text/javascript">
/*
function IdSearch(){
	
	var checkMmail = $("#inputMmail").val();
	
	if(checkMmail == ""){
		console.log("메일을 입력해야합니다.");
		alert("메일을 입력해주세요.");
		$("#inputMmail").focus();
		return false;
	
	}
	

}
*/
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
