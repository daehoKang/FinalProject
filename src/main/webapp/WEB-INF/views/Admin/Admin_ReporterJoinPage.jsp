<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page session="false" %>
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

      <style type="text/css">
      	.small-top{background: orangered;}
      	.top-head{background: orangered;}
      	.check{color: white; }
      	.filebox .file-name{
			display: inline-block;
			height: 40px;
			padding: 0 10px;
			vertical-align: middle;
			border: 1px solid #dddddd;
		    width: 78%;
		    color: #999999;
		    width: 60%;
		    overflow:hidden;
		    text-overflow: ellipsis;
		}
		.filebox label{
		    display: inline-block;
		    padding: 10px 20px;
		    color: #fff;
		    vertical-align: middle;
		    cursor: pointer;
		    height: 40px;
		    margin-left: 10px;
		}
		.filebox input[type="file"]{
		    position: absolute;
		    width: 0;
		    height: 0;
		    padding: 0;
		    overflow: hidden;
		    border: 0;
		}
      </style>

      </head>

 <body>
 <%@ include file="./includes/Admin_Header.jsp" %>
<section>
	<div class="container">
		<div class="col-lg-2"></div>
                    <div class="col-lg-8" style="background-color: white;">
                        <div class="p-5">
                            <br>
                            <form action="Admin_ReporterJoin"  method="post"  onsubmit="return joinFormCheck();" enctype="multipart/form-data" class="user" style="font-weight: bold" >
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="inputRid">?????????</label>
                                        <input type="text" name="rid"  id="inputRid" class="form-control form-control-user" placeholder="???????????????..." value="">
                                        <span id="idCheckMsg" style="font-size: 10px;"> </span>
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="inputRpw">????????????</label>
                                        <input type="text" name="rpw" id="inputRpw"  class="form-control form-control-user" placeholder="??????????????????...">
                                    </div>
                                </div>
               
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label for="inputRname">??????</label>
                                        <input type="text" name="rname" id="inputRname" class="form-control form-control-user"  placeholder="??????...">
                                        <span id="nameCheckMsg" style="font-size: 10px;"> </span>
                                    </div>
                                     <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label for="inputRcontact">?????????</label>
                                        <input type="text" name="rcontact" id="inputRcontact" class="form-control form-control-user"  placeholder="?????????...">
                                        <span id="telCheckMsg" style="font-size: 10px;"> </span>
                                        
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                	<label for="inputRmail">?????????</label>
                                    <input type="email" name="rmail"  id="inputRmail" class="form-control form-control-user" placeholder="????????? ??????...">
                                </div>
                                
                                <div class="form-group">
                                	<label for="">?????????</label>
	                                <div class="filebox">
	                                	<input class="form-control form-control-user file-name" id="file-name" value="" placeholder="????????? ????????? ?????????." disabled="disabled">
	                                	<label for="inputFile" class="btn btn-primary btn-user" style="float: right;">????????????</label>
	                                    <input type="file" id="inputFile" onchange="fileChange(this)" name="rfile" class="form-control form-control-ser">
	                                </div>
                                </div>
                                <hr>
                                <input type="submit" class="btn btn-primary btn-user" value="?????? ??????" style="float: right;">
                          
                            </form>
                           <a href="Admin_ReporterManagement" class="btn btn-secondary btn-user">????????????</a>
                           
                        </div>
                    </div>
	</div>
</section>

<script type="text/javascript">
	function fileChange(file){
		var fileInfo = $('#inputFile').val();
		var fileName = file.value.substring(fileInfo.lastIndexOf("\\")+1);
		$('#file-name').val(fileName);
	}

</script>
<script type="text/javascript">
	var checkId = false;
	var checkName = false;
	var checkTel = false;
	
	document.addEventListener("DOMContentLoaded", function(){
		$("#inputRid").keyup(function() {
			var inputId = $("#inputRid").val();
			
			if(inputId.length > 0){
				$.ajax({
					type : "get",
					url : "reporterIdCheck",
					data : {"inputId" : inputId},
					success : function(result){
						
						if(result == "OK"){
							$("#idCheckMsg").css("color", "green").text("?????? ???????????????.");
							checkId = true;
						}else{
							$("#idCheckMsg").css("color", "red").text("????????? ??????????????????.");
							checkId = false;
						}
					}
					
				});
			}else{
				$("#idCheckMsg").css("color","red").text("???????????? ??????????????????");
				checkId = false;
			}
		});
		
		$("#inputRname").keyup(function() {
			var inputName = $("#inputRname").val();
			
			if(inputName.length > 0){
				$("#nameCheckMsg").css("color", "white").text("");
				checkName = true;
			}else{
				$("#nameCheckMsg").css("color", "red").text("????????? ??????????????????.");
				checkName = false;
			}
		});
		
		$("#inputRcontact").keyup(function() {
			var inputContact = $("#inputRcontact").val();
			
			
			if(inputContact.length > 0){
				$.ajax({
					type : "get",
					url : "reporterTelCheck",
					data : {"inputContact" : inputContact},
					success : function(result){
						if(result == "OK"){
							$("#telCheckMsg").css("color", "green").text("?????? ???????????????.");
							checkTel = true;
						}else{
							$("#telCheckMsg").css("color", "red").text("???????????? ????????? ?????????.");
							checkTel = false;
						}
					}
				});
			}else{
				$("#telCheckMsg").css("color", "red").text("???????????? ??????????????????.");
				checkTel = false;
			}
		});
	});
</script>
<script type="text/javascript">
	function joinFormCheck() {
			
		console.log("???????????? ?????? : " + checkId);
		
		if(!checkId){
			alert("???????????? ?????? ????????????!");
			$("#inputRid").focus();
			return false;
		}
		
		var checkRpw = $("#inputRpw").val();
		if (checkRpw.length == 0) {
			console.log("??????????????? ???????????? ?????????. ");
			alert("??????????????? ??????????????????!");
			$("#inputRpw").focus();
			return false;
		}
		
		
		if (checkName.length == 0) {
			console.log("????????? ???????????? ?????????. ");
			alert("????????? ??????????????????!");
			$("#inputRname").focus();
			return false;
		}
		var checkRcontact = $("#inputRcontact").val();
		
		
		if (!checkTel) {
			
			alert("???????????? ??????????????????!");
			$("#inputRcontact").focus();
			return false;
		}
		var checkFile = $("#inputFile").val();
		
		if (checkFile.length == 0) {
			console.log("????????? ????????? ???????????? ?????????.");
			alert("????????? ????????? ??????????????????");
			return false;
		}
	}
</script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script> 
	<script src="${pageContext.request.contextPath }/resources/js/core.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/lightbox-plus-jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>
