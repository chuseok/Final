<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>validate</title>

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/jquery/jquery.validate.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/join.css">
<script type="text/javascript" src="/resources/js/join.js"></script>


</head>
<body>
	<jsp:include page="menu.jsp" />


	<div class="modal">
		<div class="modal-content">
			<div class="content-header">
				<div class="login">회원가입</div>
				<div class="close">+</div>
			</div>
			<form class="form" action="/main/join" method="POST" novalidate>
				<fieldset>
					<p class="clearfix">
						<label>아이디</label> <input type="text" id="userId" name="userId"
							placeholder="영문,숫자 6~12자 입력하세요.">
							<button class="idCheck" type="button" id="idCheck" name="idCheck"onclick="fn_idCheck();" value="N">중복확인</button>
					</p>
					

					<p class="clearfix">
						<label>비밀번호</label> <input type="password" id="password"
							name="userPwd" placeholder="영문+숫자+특수문자 포함 8~16자로 입력해주세요.">
					</p>
					<p class="clearfix">
						<label>이름</label> <input type="text" id="name" name="userName"
							placeholder="한글 2~5자로 입력해주세요.">
					</p>
					<p class="clearfix">
						<label>이메일</label> <input type="email" id="email" name="email"
							placeholder="ex)aaa@email.com">
					</p>

					<p class="clearfix">
						<label>생년월일</label> <input type="date" id="date" name="birthday"
							placeholder="생년월일을 입력해주세요.">
					</p>

					
					<p class="clearfix">
						<label>전화번호</label> <input type="text" id="phoneno" name="phoneNo"
							placeholder="ex)01012345678">
					</p>

					<p class="clearfix">
						<button type="submit"class="button">가입하기</button>
					</p>
					<P>
					아이디가 있으신가요?<a href="/main/login">로그인하기</a>
					</P>
					<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
				</fieldset>
			</form>
		</div>
	</div>

	<Script>
                   document.querySelector('.close').addEventListener('click',function(){
                   document.querySelector('.modal').style.display='none';
                      });
                  </Script>
                 
     <script type="text/javascript">
		$(document).ready(function(){
						
			$(".button").on("click", function(){
				
				var idChkVal = $("#idCheck").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
				}
			});
		})
		
		function fn_idCheck(){
			$.ajax({
				url : "/main/idCheck",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idCheck").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
			
			
		}
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
			});	
	</script>
</body>
</html>


