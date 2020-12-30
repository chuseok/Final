<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
	<head>
		 <!-- 합쳐지고 최소화된 최신 CSS -->
		<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		부가적인 테마
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
	 	
	<link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	
	<title>회원 정보 확인</title>
	<style>
		.homeWrapper {
			padding-left: 4.5rem;
			display: flex;
			align-content: center;
			min-width: 985px;
			padding-top: 4.5rem;
		}
		.home {
			vertical-align: middle;
			padding-left: 2.5rem;
		}
		/* .updateForm {
			padding-left: 4.5rem;
			display: flex;
			align-content: center;
			width: 225px;
		} */
	</style>	
	</head>

	<body>
	<%@ include file="../includes/header.jsp" %>

 <div class="HomeLayout">
   <div class="HomeLayout-container">
		<%@ include file="../includes/sidebar.jsp" %>
		
		<section class="HomeLayout-main">
				<div class="mainWrapper">
		<div class="homeWrapper">
			<div class="home">
				<section id="container" class="updateForm">
					<form role="form" method="post" id="updateForm" action="/main/update"autocomplete="off">
						<div class="form-group has-feedback">
							<label class="control-label" for="userId">아이디</label>
							<input class="form-control" type="text" id="userId" name="userId" value="<sec:authentication property="principal.member.userId" />" readonly="readonly"/>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="userPwd">패스워드</label>
							<input class="form-control" type="password" id="userPwd" name="userPwd" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="userName">성명</label>
							<input class="form-control" type="text" id="userName" name="userName" value="<sec:authentication property="principal.member.userName" />" readonly="readonly"/>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
					</form>
					<div class="form-group has-feedback">
						<button class="btn btn-success" type="submit" id="submit">변경하러가기</button>
						<button class="cencle btn btn-danger" type="button">취소</button>
					</div>
					
				</section>
			</div>
			<!-- ./home -->
		</div>
		
		</div>
		</section>
		
	</div>
 </div>
 
	<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/";
					    
		})
	
			$("#submit").on("click", function(){
				if($("#userPwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPwd").focus();
					return false;
				}
				$.ajax({
					url : "/main/PwdCheck",
					type : "POST",
					dataType : "json",
					data : $("#updateForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm){
								$("#updateForm").submit();
							}
							
						}
					}
				})
				
			});			
		})
		
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
			});
	
	</script>	
		
	</body>	
</html>