<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>AllTimes</title>

      <!--Bootstrap core CSS-->
      <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

      <!-- Custom styles for this template -->

      <link href="${pageContext.request.contextPath }/resources/css/custom.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath }/resources/css/responsive-style.css" rel="stylesheet">  
      <link href="${pageContext.request.contextPath }/resources/css/weather-icons.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" />
      <link href="${pageContext.request.contextPath }/resources/css/lightbox.min.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loaders.css"/>
      <style>
      	.small-top{background: orangered;}
      	.top-head{background: orangered;}
      	.check{color: white; }
      </style>
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
<header>
  <div class="small-top">
    <div class="container">
            <div class="col-lg-4 date-sec hidden-sm-down">
        <div id="Date"></div>
      </div>
            <div class="col-lg-3 offset-lg-5">
        <div class="social-icon"> <a target="_blank" href="#" class=" fa fa-facebook"></a> <a target="_blank" href="#" class=" fa fa-twitter"></a> <a target="_blank" href="#" class=" fa fa-google-plus"></a> <a target="_blank" href="#" class=" fa fa-linkedin"></a> <a target="_blank" href="#" class=" fa fa-youtube"></a> <a target="_blank" href="#" class=" fa fa-vimeo-square"></a> </div>
      </div>
          </div>
  </div>
  <div class="top-head left">
    <div class="container">
            <div class="row">
        <div class="col-md-6 col-lg-4">
                <h1>AllTimes<small>Reporter Management</small></h1>
              </div>
        <div class="col-md-6 col-lg-5 offset-lg-3 admin-bar hidden-sm-down"><!-- 관리자 로그인 => 로그인 폼 연결로 변경 해야함 -->
                <nav class="nav nav-inline"> <a href="#" class="nav-link"><span class="ping"></span><i class="fa fa-envelope-o"></i></a> <a href="#" class="nav-link"><i class="fa fa-bell-o"></i></a> <a href="home" class="nav-link">Admin <img class="img-fluid img-circle" src="${pageContext.request.contextPath }/resources/img/admin-bg.jpg"></a> </nav>
              </div>
      </div>
          </div>
  </div>
</header>
<nav class="navbar top-nav">
        <div class="container">
    <button class="navbar-toggler hidden-lg-up " type="button" data-toggle="collapse" data-target="#exCollapsingNavbar2" aria-controls="exCollapsingNavbar2" aria-expanded="false" aria-label="Toggle navigation"> &#9776; </button>
    <div class="collapse navbar-toggleable-md" id="exCollapsingNavbar2"> <a class="navbar-brand" href="#">Responsive navbar</a>
            <ul class="nav navbar-nav ">
        <li class="nav-item active"> <a class="nav-link" href="#">홈페이지 </a> </li>
        <li class="nav-item"> <a class="nav-link" href="Admin_MemberManagement">회원 관리<span class="sr-only">(current)</span></a> </li>
        <li class="nav-item" > <a class="nav-link" href="Admin_ReporterJoinPage">기자 추가</a> </li>
        <li class="nav-item"> <a class="nav-link" href="Admin_ReporterManagement">기자 관리</a> </li>
      </ul>
            <form class="pull-xs-right">
        <div class="search">
                <input type="text" class="form-control" maxlength="64" placeholder="Search" />
                <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
              </div>
      </form>
          </div>
  </div>
</nav>
</body>

</html>