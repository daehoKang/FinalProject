<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      	
      	.pageInfo{
		    list-style : none;
		    display: inline-block;
		     
		}

		.pageInfo li{
		    float: left;
		    font-size: 20px;
		    padding: 8px 17px;
		    font-weight: 500;
		}
		#pageInfo a:link {color:black; text-decoration: none;}
		#pageInfo a:visited {color:black; text-decoration: none;}
		#pageInfo a:hover {color:black; text-decoration: underline;}
		#pageInfo .active{background-color: #FFAE95; border: solid 1px darkorange;}
		
      </style>
      </head>

 <body>
 	<%@ include file="./includes/Admin_Header.jsp" %>
<section>
	<div class="container">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>?????????</th>
					<th>??????</th>
					<th>?????????</th>
					<th>??????</th>
					<th>??????</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${MemberList }" var="member">
					<tr>
						<td>${member.mid }</td>
						<td>${member.mname }</td>
						<td>${member.mmail }</td>
						<td>${member.mage }</td>
						<td><a class="btn btn-sm btn-primary text-xs" href="Admin_MemberModifyPage?mid=${member.mid }"><i class="check">??????</i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pageInfo_wrap" style="text-align:center;">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo" >
				<!-- ??????????????? ?????? -->
				<c:if test="${paging.prev }">
					<li class="pageInfo_btn previous"><a href="${paging.startPage-1 }">????????????</a></li>
				</c:if>
				<!-- ????????? ?????? -->
				<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
					<li class="pageInfo_btn ${paging.cri.pageNo == num ? 'active':'' }"><a href="${num }">${num }</a></li>
				</c:forEach>
				<!-- ?????? ????????? ?????? -->
				<c:if test="${paging.next }">
					<li class="pageInfo_btn next"><a href="${paging.endPage+1 }">????????????</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<form id="pageMoveForm" method="get">
		<input type="hidden" name="pageNo" value="${paging.cri.pageNo }">
		<input type="hidden" name="amount" value="${paging.cri.amount }">
	</form>
	<form action="memberSearch" method="post" class="form-group" style="border: 0px; float: right;">
		<div class='input-group'>
			<select name ="searchType">
				<option label="??????" value="tAll"></option>
				<option label="?????????" value="tId"></option>
				<option label="??????" value="tName"></option>
			</select>
			<input type="text" class="input-group-prepend" name="keyword">
			<button type="submit" class="btn btn-search input-group-append"><i class="fa fa-search"></i></button>
		</div>
	</form>
	</div>
</section>

	<script type="text/javascript">
		var msg = '${ModifyMsg}';
		if(msg != ''){
			alert(msg);
		}
	</script>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded",function(){
			$(".pageInfo a").on("click",function(e){
				e.preventDefault();
				$("#pageMoveForm").find("input[name='pageNo']").val($(this).attr("href"));
				$("#pageMoveForm").attr("action", "Admin_MemberManagement");
				$("#pageMoveForm").submit();
			});
		});
	</script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js"></script>
</body>
</html>
