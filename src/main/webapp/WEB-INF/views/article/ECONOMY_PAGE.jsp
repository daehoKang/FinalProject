<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>AllTimes : 경제 기사 페이지</title>
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
<link rel="stylesheet" type="text/css"
	href="resources/css/font-awesome.min.css" />
<link href="resources/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/loaders.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%
}

* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.wrapper {
	min-height: 100%;
	position: relative;
	padding-bottom: 19px; /* footer height */
}

.page_info {
	float: right;
}

.article-list-wrap {
	
}

.article-list-main {
	overflow: auto; /* 기사 내용이 길어지면  */
	width: 1200px;
	margin: 0 auto;
	min-height: 700px;
}

.article-list-title {
	padding-top: 15px;
}

.article-list-ul {
	list-style: none;
}

.article-list-ul li {
	display: table;
	position: relative;
	margin: 30px;
}

.article-list-thumbnail {
	float: left;
	position: relative;
	margin-right: 20px;
}

.article-list-table {
	display: table-cell;
	vertical-align: middle;
	text-decoration:none;
	width:1200px;
}
.title{
	overflow:hidden;
}

.article-list-table-title {	
	color: black;	
}

.article-list-table-detail{
	width:900px;
	height:80px;
	margin:0;
	padding:0;
	
	display:-webkit-box;
	line-height:16px;
	max-height:32px;
	-webkit-line-clamp:4;
	-webkit-box-orient:vertical;
	word-wrap: vertical;	
	vertical-align:top;
	overflow:hidden;
	text-overflow: ellipsis;
	white-space:nowrap;
	word-break:keep-all;
}
.article-list-table-detail a{
	text-decoration:none;
 	height:100%;
	width:100%;
	overflow:hidden;
	 
}
</style>
</head>
<body>
	<!-- 메뉴 바 -->

	<div class="loader loader-bg">
		<div class="loader-inner ball-pulse-rise">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<div class="wrapper">
		<!-- Header -->
		<%@ include file="../includes/Header.jsp"%>

		<!-- Navigation -->
		<%@ include file="../includes/Navigation.jsp"%>
		<section>
			<!-- 기사 목록 -->
			<div class="article-list-main">
				<div class="article-list-title">
					<h3 style="position:absolute; left:180px;">경제 기사 목록</h3>
				</div>
				<hr style="margin-top:42px; border-color:#FD3A13; border-width:4px;">
				<div class="page_info">
					총 ${articleCount} 건의 기사가 있습니다.
					<!--  -->
				</div>
				<!-- AR_GENRE가 POLITICS인 행 -->
				<div class="article-list-wrap">
					<ul class="article-list-ul">
						<c:forEach items="${articleList}" var="article">
							<li style="margin:50px;">
								<div class="article-list-thumbnail">
									<a
										href="articleRead?ar_no=${article.ar_no}&ar_genre=${article.ar_genre}">
										<img
										src="resources/img/${article.ar_img}"
										class="article-list-img" width="150px" height="120px"> <!-- 기사의 대표 이미지  -->
									</a>
								</div>
								<div class="article-list-table">
									<!-- 기사의 제목. 길면 중간부터 생략하기(css에서 text-overflow) -->
									<div class="title">
										<h5 class="article-list-table-title">
											<a
												href="articleRead?ar_no=${article.ar_no}&ar_genre=${article.ar_genre}"
												class="article-list-table-title">${article.ar_title}</a>
										</h5>
									</div>
									<p class="article-list-table-detail"> <!-- 기사의 본문. 중간부터 생략하기(css에서 text-overflow) -->
										<a
										href="articleRead?ar_no=${article.ar_no}&ar_genre=${article.ar_genre}" style="color:black;">${article.ar_detail}</a>
									</p>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>
		<!-- Footer -->
		<%@ include file="../includes/Footer.jsp"%>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/core.js?ver=1"></script>

	<!--  Jquery 사용 스크립트 -->
	<script src="resources/js/lightbox-plus-jquery.min.js"></script>
	
		<script type="text/javascript">
	
		var genre_Check = '${param.ar_genre}';
		$(".Navigation a").css("color","black").css("font-weight","bold");
		$("#"+genre_Check).css("color","#FD3A13").css("font-weight","bold").css("border-bottom","2px solid #FD3A13");
		
		
	</script>
	
</body>
</html>