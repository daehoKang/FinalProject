<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page session="false" %>
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
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      
      <!--  카카오로그인 js -->
      <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
      <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('a6db95f9db9a263ccff742e724f3e125');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
	  </script>
	  
	  <!-- 네이버로그인 js -->
	  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	  
	  
	  
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
						<section class="section-01 section_login">
					        <div class="container">
					    <div class="row">
					            <div class="col-lg-12 ">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 style="text-align:center; font-weight:bold;">로그인</h4>
                                </div>

                                	 <form action="MemberLogin" method="post" onsubmit="return LoginFormCheck();" class="user">
                                    <div class="form-group">
                                        <input type="text" name="mid"  class="login_text_box"
                                            id="inputMid" aria-describedby="emailHelp"
                                            placeholder="아이디를 입력하세요..." style="border-radius: 10px;">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="mpw"  class="login_text_box"
                                            id="inputMpw" placeholder="비밀번호를 입력하세요..."
                                            style="border-radius: 10px;">
                                    </div>
                       
                                    <input type="submit" class="btn login_btn login_button" value="로그인" style="border-radius: 10px;">
                                    
                                    <!-- 카카오 로그인 -->
                                    <div style="position:absolute; right:340px; margin-top:10px;">
                                    <a id="kakao-login-btn" ></a>
                                    </div>
                                    
                                    <!--  네이버 로그인 -->
                                    <div id="naver_id_login" style="position:absolute; left:365px; margin-top:10px;"></div>

                                    
                                    
                                    <hr style="margin-top: 4rem;">
                                    
                                </form>
                                
                                <div class="text-center" >
                                	<p style="margin-top:0; margin-bottom: 0.5rem; text-align:center; font-size:14px;">
                                		비회원이신가요? <a class="small" href="MemberJoinForm">회원가입</a>
                                	</p>
                                	
                                	<p style="text-align:center; font-size:14px;">
                                		<a class="small" href="MemberIDSearch">아이디찾기</a> | <a class="small" href="MemberPWSearch">비밀번호찾기</a>
                                	</p>
                                	
                                	<p style="text-align:center; font-size:14px;">
                                		<a class="small" href="ReporterLoginForm">기자 로그인</a>
                                	</p> 
                                	
                                	

                                </div>
                            </div>
                        </div>
                    </div>
				</div>
			</section>
			

			
			
	<!-- Footer -->
	<%@ include file="../includes/AnotherFooter.jsp" %>
	
<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- 카카오 로그인 자바스크립트 -->
<script type="text/javascript">
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(res) {
          //alert(JSON.stringify(res))
          kakaoLogin_Test(res);
         
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
              
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>

<script type="text/javascript">

	function kakaoLogin_Test(kakaoInfo){
		 console.log(kakaoInfo);
		 console.log("카카오닉네임 : " + kakaoInfo.kakao_account.profile.nickname)
		 
		 var mname = kakaoInfo.kakao_account.profile.nickname;
		 location.href = "MemberKakaoLogin?mname="+mname;
		 
	}
	
</script>


<!-- 네이버 로그인 자바스크립트 -->

<script type="text/javascript">
	var naver_id_login = new naver_id_login("DHTM7AOE6S02Qwjjnjdx", "http://localhost:9494/controller03");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,45);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
	
</script>	



<script type="text/javascript">
	

</script>

<!--  <script type="text/javascript">
  var naver_id_login = new naver_id_login("DHTM7AOE6S02Qwjjnjdx", "http://localhost:9494/controller03");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
    
    var mname = naver_id_login.getProfileData('nickname');
    location.href = "MemberNaverLogin?mname="+mname;
    
  }
</script>-->



<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="resources/js/jquery.min.js"></script> 
<script src="resources/js/bootstrap.min.js"></script> 
<script src="resources/js/core.js"></script> 

<!--  Jquery 사용 스크립트 -->
<script src="resources/js/lightbox-plus-jquery.min.js"></script> 



</body>
</html>

