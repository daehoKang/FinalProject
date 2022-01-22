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
      <style></style>
      </head>

      <body>
          <div class="loader loader-bg">
        <div class="loader-inner ball-pulse-rise">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>


	<!-- Header -->
	<%@ include file="../includes/Header.jsp" %>
	


	
	<!-- Content -->
						<section class="section-01 section_login" style="padding:148px;">
					        <div class="container">
					    <div class="row">
					            <div class="col-lg-12 ">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 style="text-align:center; font-weight:bold;">기자 로그인</h4>
                                </div>

                                	 <form action="ReporterLogin" method="post" onsubmit="return LoginFormCheck();" class="user">
                                    <div class="form-group">
                                        <input type="text" name="rid"  class="login_text_box"
                                            id="exampleInputEmail" aria-describedby="emailHelp"
                                            placeholder="아이디를 입력하세요..." style="border-radius: 10px;">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="rpw"  class="login_text_box"
                                            id="exampleInputPassword" placeholder="비밀번호를 입력하세요..."
                                            style="border-radius: 10px;">
                                    </div>
                       
                                    <input type="submit" class="btn login_btn login_button" value="로그인" style="border-radius: 10px;">
                                        
                                   
                                    
                                </form>
                                

                            </div>
                        </div>
                    </div>
				</div>
			</section>
			
			

			
			
	<!-- Footer -->
	<%@ include file="../includes/AnotherFooter.jsp" %>
	
	





<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="resources/js/jquery.min.js"></script> 
<script src="resources/js/bootstrap.min.js"></script> 
<script src="resources/js/core.js"></script> 

<!--  Jquery 사용 스크립트 -->

<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>






</body>
</html>

