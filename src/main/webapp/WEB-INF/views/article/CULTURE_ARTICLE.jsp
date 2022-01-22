<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<head>
<meta charset="UTF-8">
<title>문화 - 올타임즈</title>
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
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<style type="text/css">
html,body{
	margin:0;
	padding:0;
	width:100%;
	height:100%
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
.article-main {
	overflow: auto; /* 기사 내용이 길어지면  */
	width: 1200px;
	margin: 0 auto;
}

.article-header {
	margin-bottom:15px;
}
.article-title {
	margin-bottom: 20px;
}

.article-attribute {
	padding-bottom: 10px;
	border-bottom: 1px solid #cdcdcd;
	display: block;
}

.article-attribute-reportername {
	margin-right: 100px;
}

.article-attribute-hits {
	float: right;
}

.article-main-img img{
	max-width:800px;
	max-height:600px;
}

.article-recommend-outer {
	text-align: center;
	margin-bottom: 20px;
}

.article-recommend-inner {
	display: inline-clock;
}

.btn-recommend {
	width: 80px;
	text-decoration: none;
	font-size: 1.2em;
	color: white;
	padding: 10px 10px 10px 10px;
	display: inline-block;
	border-radius: 10px;
	font-family: 'Black Han Sans', sans-serif;
}

.btn-good {
	background-color: #1f75d9;
	margin-right: 10px;
}

.btn-bad {
	background-color: #ff521e;
}

.comments-write-textarea {
	width: 100%;
	height: 6.25em;
	resize: none;
}

.comments-write-submit {
	float: right;
}

.comments-write-list {
	margin-top: 50px;
}

.comments-list {
	margin-bottom: 8px;
}

.comments-list-count {
	margin-top: 20px;
	margin-bottom: 20px;
	border-bottom: 1px solid #cdcdcd;
}

.comments-list-wrapper {
	margin-bottom: 30px;
}

.comments-list-top{
	margin-bottom:7px;
}

.comments-list-bottom{
	margin-top:7px;
}
.modify {
	float: right;
	float: right;
	color: black; text-decoration : none;
	padding:2 3 2 3px; display : inline-block;
	border-radius: 5px;
	border: 1px solid black;
	display: inline-block;
	text-decoration: none;
}

.comments-list-delete {
	float: right;
	color: black; text-decoration : none;
	padding:2 3 2 3px; display : inline-block;
	border-radius: 5px;
	border: 1px solid black;
	display: inline-block;
	text-decoration: none;
}
div.replyModal {
	position:relative; z-index:1;display:none;
}
div.modalBackground {
	position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1;
}
div.modalContent {
	position:fixed; top:20%; left:calc(50% - 250px); width:700px; height:400px; padding:20px 10px; background:#fff; border:2px solid #666;
}
div.modalContent textarea { 
	font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:680px; height:300px; 
}
div.modalContent button { 
	font-size:20px; padding:5px 10px; margin:10px 0 0 10px;; background:#fff; border:1px solid #ccc; float:right;
}
div.modalContent button.modal_cancel { 
	margin-left:20px; 
}
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
	<div class="wrapper">
	<!-- Header -->
	<%@ include file="../includes/Header.jsp"%>

	<!-- Navigation -->
	<%@ include file="../includes/Navigation.jsp"%>
	<section>
	<!-- 기사 내용 출력 -->
	<div class="article-main">
		<div class="article-header">
			<!-- 제목과 기자명 등이 출력될 기사 상단부 -->
			<h3 class="heading-large" style="border-bottom:2px solid #FD3A13; color:#FD3A13;
			 float: left; width:100%; padding: 0 0 6px; margin:0 0 18px;
			  text-align:center;">${articleRead.ar_genre }</h3>
			
			<div class="article-title">
				<h1 style="text-align:center; font-weight:bold;">${articleRead.ar_title}</h1>
				<!-- 기사 제목 -->
			</div>
			<div class="article-attribute">
				<span class="article-attribute-reportername">
					${articleRead.ar_name} 기자 </span> <span class="article-attribute-date">등록일자
					: ${articleRead.ar_date} </span> <span class="article-attribute-hits">
					조회수 : ${articleRead.ar_hits} </span>
			</div>
		</div>
		<!-- 기사본문 -->
		<div class="article-main-text">
			<div class="article-main-img" style="text-align:center;">
				<!-- 기사 대표 사진 -->
				<img
					src="resources/img/${articleRead.ar_img}"
					alt="사진이 없는 기사입니다.${articleRead.ar_img}">
				<p class="##">
					<!-- 사진의 간략한 설명 -->
				</p>
			</div>
			<p class="##">${articleRead.ar_detail} ${sesseionScope.loginMid}</p>
			<div class="article-recommend-outer">
				<!-- 기사 추천 -->
				<c:if test="${sesseionScope.loginMid != null}">
					<span class="article-recommend-inner"> <a
						href="articleRecommend?bool=good&ar_no=${articleRead.ar_no}&mid=${sesseionScope.loginMid}&ar_genre=${articleRead.ar_genre}"
						class="btn-recommend btn-good">${articleRead.ar_thumbsup}<br>추천
					</a> <a
						href="articleRecommend?bool=bad&ar_no=${articleRead.ar_no}&ar_genre=${articleRead.ar_genre}"
						class="btn-recommend btn-bad">${articleRead.ar_thumbsdown}<br>비추천
					</a>
					</span>
				</c:if>
			</div>
		</div>
		<div class="comments-write">
			<!-- 댓글 입력 -->
			<div class="comments-write-board">
				<form action="commentsWrite" method="get">
					<div class="##">
						<div class=##">
							<textarea class="comments-write-textarea" name="cm_detail"></textarea>
						</div>
						<input type="hidden" name="cm_writer" value="${sesseionScope.loginMid}">
						<input type="hidden"
							name="cm_ar_no" value="${articleRead.ar_no}"> <input
							type="hidden" name="ar_genre" value="${articleRead.ar_genre}">
						<div class="comments-write-submit">
							<input type="submit" class="##" value="등록">
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- 댓글 목록 -->
		<div class="comments-list-count">
			<!-- 댓글 갯수 -->
			댓글 <span class="##">${commentsCount}</span>
		</div>
		<c:if test="${commentsCount != null}">
			<c:forEach items="${commentsList}" var="comments">
				<div class="comments-list-wrapper">
					<div class="comments-list-top">
						<span class="comments-list-writter"> ${comments.cm_writer } </span> <span
							class="comments-date"> ${comments.cm_date } </span>
					</div>
					<div class="comment-list-bottom">
						<span class="comments-list-text">${comments.cm_detail }</span>
						<c:if test="${comments.cm_writer == sesseionScope.loginMid}">
							<a
								href="commentsDelete?cm_no=${comments.cm_no}&ar_genre=${articleRead.ar_genre}"
								class="comments-list-delete">삭제</a>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</c:if>
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
	
< 	
</body>
</html>