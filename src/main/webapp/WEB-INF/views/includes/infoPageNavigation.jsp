<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar top-nav">
	<div class="container">
		<button class="navbar-toggler hidden-lg-up " type="button"
			data-toggle="collapse" data-target="#exCollapsingNavbar2"
			aria-controls="exCollapsingNavbar2" aria-expanded="false"
			aria-label="Toggle navigation">&#9776;</button>
		<div class="collapse navbar-toggleable-md" id="exCollapsingNavbar2">
			<a class="navbar-brand" href="#">Responsive navbar</a>
			<ul class="nav navbar-nav ">


				<c:choose>
					<c:when test="${sessionScope.loginMid != null }">
						<li class="nav-item active"><a class="nav-link" a
							href="MemberModifyForm?mid=${sessionScope. loginMid }">회원정보<span
								class="sr-only"></span></a></li>
					</c:when>
					<c:when test="${sessionScope.loginRid != null }">
						<li class="nav-item active"><a class="nav-link" a
							href="ReporterModifyForm?rid=${sessionScope.loginRid}">회원정보<span
								class="sr-only"></span></a></li>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${sessionScope.loginRid != null }">
						<li class="nav-item"><a class="nav-link"
							href="ReporterWriteForm?rid=${sessionScope.loginRid}">기사 작성</a></li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.loginRid != null }">
						<li class="nav-item"><a class="nav-link"
							href="ReporterArticleManagement?rid=${sessionScope.loginRid}">내
								기사 관리</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>




	</div>
</nav>