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
<title>ReporterModifyForm</title>

<!--Bootstrap core CSS-->
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/custom.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/responsive-style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/weather-icons.min.css"
	rel="stylesheet">
<link rel="${pageContext.request.contextPath}/stylesheet"
	type="text/css" href="resources/css/font-awesome.min.css" />
<link
	href="${pageContext.request.contextPath}/resources/css/lightbox.min.css"
	rel="stylesheet">
<link rel="${pageContext.request.contextPath}/stylesheet"
	type="text/css" href="resources/css/loaders.css" />

</head>

<body>
	<div class="loader loader-bg">
		<div class="loader-inner ball-pulse-rise">
		</div>
	</div>
	<!-- Header -->
	<%@ include file="../includes/Header.jsp" %>
	
	<!-- Navigation -->
	<%@ include file="../includes/infoPageNavigation.jsp" %>



			<div class="container">
			<table>
			<form action="ReporterModify" method="post">
					<div style="margin: 40px;">
						<div class="form-group row">
							<div class="col-sm-4 mb-3">
								<label>아이디</label> <input type="text" name="rid"
									class="form-control form-control-user"
									value="${reporterModify.rid }" disabled="disabled">
									<input type="hidden" name="rid" class="form-control form-control-user"
									value="${reporterModify.rid }">
							</div>
							<div class="col-sm-4">
								<label>비밀번호</label> <input type="text" name="rpw"
									class="form-control form-control-user "
									value="${reporterModify.rpw }">
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-4 mb-3">
								<label>이름</label> <input type="text" name="rname"
									class="form-control form-control-user"
									value="${reporterModify.rname }">
							</div>
							<div class="col-sm-4 mb-3">
								<label for="viewMmail">전화번호</label> <input type="text"
									name="rcontact" class="form-control form-control-user "
									value="${reporterModify.rcontact }">
							</div>

						</div>
						<div class="form-group row">
							<div class="col-sm-4">
								<label for="viewMmail">이메일</label> <input type="email"
									name="rmail" class="form-control form-control-user "
									value="${reporterModify.rmail }">
							</div>
							<div class="col-sm-4">
								<label for="viewMagel">나이</label> <input type="text" name="rage"
									class="form-control form-control-user "
									value="${reporterModify.rage }">
							</div>
						</div>
						<div class="form-group row">
							
							<div class="col-sm-4">
								<input type="submit"
									class="btn-primary form-control form-control-user "
										id="submitBtn" style="float: right;" value="정보수정">
							</div>
						</div>
		
							</div>
				</form>	

			</table>
		</div>
	

	
	<!--footer start from here-->

	<%@ include file="../includes/AnotherFooter.jsp" %>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/core.js?val=1"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/lightbox-plus-jquery.min.js"></script>

</body>
</html>
