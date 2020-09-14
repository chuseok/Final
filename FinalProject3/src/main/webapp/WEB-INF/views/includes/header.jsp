<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/login.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script src="/resources/jquery/jquery.validate.min.js"></script>	
<script src="/resources/js/login.js"></script>	
<link	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
</head>
<style>

.header__notification {
  width: 30px;
  /* height: 20px; */
  margin: 0 10px;
  display: -webkit-box;
  display: flex;
  justify-content: space-around;
}
.header__notification .bell-icon {
  position: relative;
  cursor: pointer;
}
.header__notification .bell-icon:hover {
  color: #eee;
}
.header__notification .bell-icon .notification-number {
  font-size: 0.6em;
  border-radius: 50%;
  background-color: #00BFBE;
  border: 2px solid #00BFBE;
  color: #FFFFFF;
}
.header__notification .bell-icon .bell-number {
  position: absolute;
  top: -50%;
  width: 15px;
  height: 15px;
  text-align: center;
  line-height: 15px;
  transform: translate(-30%, 70%);
}
.header__notification .bell-icon .notification__list {
  position: absolute;
  background: rgb(255 232 232);
  width: 230px;
  list-style-type: none;
  text-align: center;
  left: -90px;
  top: 50px;
  border-radius: 7px;
  -webkit-animation: fadeIn 1s;
  animation: fadeIn 1s;
  z-index: 30;
  border: 1px solid transparent;
}

.header__notification .bell-icon .notification__list:before {
  content: "";
  position: absolute;
  width: 0;
  height: 0;
  border: 10px solid transparent;
  border-bottom-color: #fff;
  left: 48.5%;
  top: -20px;
  -webkit-transform: translate(-50%);
          transform: translate(-50%);
}

.header__notification .bell-icon .notification__list__name {
  background: #fff;
  color: #9BB7C5;
  padding: 10px 0;
  border-top-left-radius: 7px;
  border-top-right-radius: 7px;
  
  -webkit-transition: all 1s ease-in-out;
  transition: all 1s ease-in-out;
  font-size: 15px;
}
.header__notification .bell-icon .list__item {
  border-top: 1px solid rgb(214 156 156);
  -webkit-transition: all 1s ease-in-out;
  transition: all 1s ease-in-out;
}
.header__notification .bell-icon .list__item .user-image {
  width: 40px;
  height: 40px;
  border-radius: 50px;
}
.header__notification .bell-icon .list__item .messages {
  padding-left: 10px;
  color: #909DA8;
}
.header__notification .bell-icon .list__item--link {
  display: -webkit-box;
  display: flex;
  padding: 10px;
  text-decoration: none;
  text-align: left;
  font-size: 0.6em;
  opacity: 0.8;
  -webkit-box-align: center;
          align-items: center;
}
.header__notification .bell-icon .list__item--link:hover {
  opacity: 1;
}

.small-icon {
  font-size: 1.5em;
  fill: #D0DADF;
}
.hide {
  display: none;
}
.clicked {
  background-color: white;
}

@-webkit-keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

/*무경씨꺼 코드 */
.menu {
	position: absolute;
	
}
.menu a {
	cursor: pointer;
}

.menu .hide {
	background-color: #f9d56e;
	margin-top: 10px;
	z-index: 100;
	padding: 8px 0;
}

.menu .hide:visible {
	display: block;
	z-index: 100;
}

.menu .hide li {
	display: flex;
	align-item: center;
	justify-content: center;
	height: 17px;
}

.menu .hide li a {
	display: block;
}

.menu .hide li a :hover {	
	opacity: 0.5;
  cursor: pointer;
}

#logoutBtn {
	height: 18px;
	font-size: 12px;
	backgroung-color: #2d4059;
	text-align: right;
	color: #fff;
}

</style>
<body>

<header>
    <nav class="header-navbar">
      <div class="header-logo">
        <a href="">암기용</a>        
      </div>
      <div style='display:none' class="header-transitionGroup-Wrapper">
     		<div class="header-search">
     			<i class="fas fa-search"></i><input class="header-searchInput" type="search" name="headerSearch" autofocus/>
     		</div>
     		<div class="header-searchClose">
     			<i class="fas fa-times"></i>
     		</div>
      </div>
      
      <div class="header-transitionGroup-Wrapper">
        <div class="header-searchSection">
          <button id="header-searchBtn"><i class="fas fa-search"></i>찾아보기</button>
        </div>

        <div class="header-createSection">
          <a href="">
            <i class="fas fa-folder-plus"></i>만들기
          </a>
        </div>
        
        <div class="header__notification">
      		<div class="far fa-bell bell-icon small-icon">
        		<span class="notification-number bell-number">0</span>
        		<ul class="notification__list dropdown hide">
          			<li><h3 class="notification__list__name">Notifications</h3></li>
        		</ul>
      		</div> <!-- bell-icon-->
  		</div> <!--  header__notification -->
        
        <div class="header-userSection">
        
          <div class="userInfo">
             <sec:authorize access="isAnonymous()">
             	<div class="header-signIn">
        				<button type="button" class="header-loginBtn"><span class="loginBtn-span">로그인</span></button>
        				<button type="button" class="header-signInBtn"><span>회원가입</span></button>
        			</div>
             </sec:authorize>

						<sec:authorize access="isAuthenticated()" var="loginSuccess">
							<div class="userInfo-name">
								<sec:authentication property="principal.member.userName" />님
            	</div>
            </sec:authorize>
            
						<sec:authorize access="isAuthenticated()">
							<div class="userInfo-menu">
							<ul>
								<li class="menu"><a><i class="fas fa-bars"></i>메뉴</a>
									<ul class="hide">								
										<li><a href="../main/update">회원정보변경</a></li>
										<li>친구추천</li>
										<li><a href="/withdrawal">회원탈퇴</a></li>
										<li><form action="/customLogout" method="post">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
													<button id="logoutBtn">로그아웃</button>											
												</form>
										</li>
									</ul>							
								</li>
							</ul>
							</div>
						</sec:authorize>

					</div>
        </div>
      </div>
    </nav>
  </header>
  
  <!-- 로그인 모달 -->
	<div class="modal" style="display:none;" id="loginModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">로그인</h4>
				<div class="close">+</div>
			</div>
	
			<h2>
				<c:out value="${error}" />
			</h2>
			<h2>
				<c:out value="${logout}" />
			</h2>
			<form class="form" method="POST" action="/login" novalidate>
				<fieldset>
					<p class="clearfix">
						<label>아이디</label> <input type="text" id="Id" name="username" placeholder="영문,숫자 6~12자 입력하세요.">
					</p>
					<p class="clearfix">
						<label>비밀번호</label> <input type="password" id="password" name="password" placeholder="영문+숫자+특수문자 포함 8~16자로 입력해주세요.">
					</p>				
	
					<p class="clearfix">
						<input type="submit" value="로그인" class="button" id="loginModalBtn">
					</p>
					<input type="checkbox" name='remember-me'>아이디 저장
					<p>
						아이디가 없으신가요?<a href="/main/join"> 여기를 눌러주세요</a>
					</p>
						아이디를 잊어버리셨나요? <a href="#">아이디 찾기</a> 
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</fieldset>
			</form>
			<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
			<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
			<div id="naver_id_login" style="text-align:center"><a href="${url}">
				<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
			</div>
		</div>
	</div>
	
	<!-- 회원가입모달 -->
	<div class="modal" style="display:none;" id="joinModal">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">회원가입</h4>
				<div class="close">+</div>
			</div>
			<form class="form" action="/main/join" method="POST" enctype="multipart/form-data" novalidate>
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
					<p class="닉네임">
						<label>이름</label> <input type="text" id="userName" name="userName"
							placeholder="한글 2~5자로 입력해주세요.">
							<button class="nameCheck" type="button" id="nameCheck" name="nameCheck"onclick="fn_nameCheck();" value="N">중복확인</button>
					</p>
					<p class="clearfix">
						<label>이메일</label> 
						<input type="email" id="email" name="email"
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
						<button type="submit"class="button" id="uploadBtn">가입하기</button>
					</p>					
					<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
				</fieldset>
			</form>
		</div>
	</div>

	

</body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" 
integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous"></script>

<Script>
/* modal */
	$('.close').on("click",function(){
		$('.modal').hide();
	})

		$('.header-loginBtn').on("click",function(){
			$('#loginModal').show();
		});
				
		$('.header-signInBtn').on("click",function(){
			$('#joinModal').show();
		})
		
</Script>

<script type="text/javascript">
		$(document).ready(function(){
						
			$("#uploadBtn").on("click", function(){
				
				var idChkVal = $("#idCheck").val();
				if(idChkVal == "N"){
					alert("아이디 중복확인 버튼을 눌러주세요.");
					return false;
				}
				var nameChkVal = $("#nameCheck").val();
				if(nameChkVal == "N"){
					alert("이름 중복확인 버튼을 눌러주세요.");
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
		function fn_nameCheck(){
			$.ajax({
				url : "/main/nameCheck",
				type : "post",
				dataType : "json",
				data : {"userName" : $("#userName").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 닉네임입니다.");
					}else if(data == 0){
						$("#nameCheck").attr("value", "Y");
						alert("사용가능한 닉네임입니다.");
					}
				}
			});			
		}
		
		$(document).ajaxSend(function(e, xhr, options) {
			var asd = "${_csrf.headerName}";
			console.log("aaa" + asd);
			xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
			});	
	</script>
	
	<script>
	$(document).ready(function(){
		$("#uploadBtn").on("click",function(e){
			var formdata = new FormData();
		    var inputFile = $("input[name='uploadFile']");
		    var files = inputFile[0].files;
		    console.log(files);
		    //add filedate to formdata
		    for(var i =0; i<files.length; i++){
		    	formData.append("uploadFile",files[i]);
		    }
		    $.ajax({
		    	url : "/main/join",
				processData: false,
				contentType: false,
				data: formData,
		    	type : "post",
				success: function(result){
					alert("회원가입 완료되었습니다.");
				}
		    });
		});
	});
	</script>


<script type="text/javascript">
var bellIcon = document.querySelector('.bell-icon');
var dropdownMenu = document.querySelector('.dropdown');
var listItem = document.querySelector('.list__item');
var notificationNumber = document.getElementsByClassName('notification-number');
var notificationInterval = setInterval(checkNumber, 0);
var size = document.getElementsByClassName('list__item').length;
var text = '<c:out value="${text}"/>';
var hungry = '<c:out value="${hungry}"/>';
var clicked = '<c:out value="${clicked}"/>';

//sessionStorage.setItem("clickedItem", clicked);


var stompClient = null;

function bellCheck(event){
  var isClickInside = bellIcon.contains(event.target);
  
    if (isClickInside) {
      dropdownMenu.classList.toggle('hide');
      if(dropdownMenu.classList.contains('hide')){
    	var arr = document.querySelectorAll('.list__item');
    	for(var i=0;i<arr.length;i++){
    		arr[i].classList.add('clicked');
    	}
    	
        clearInterval(notificationInterval);
        notificationInterval = setInterval(checkNumber, 0);  
        sessionStorage.setItem("clickedItem", "clicked");
      }
      else{
      for(var i = 0; i < notificationNumber.length;i++){
         notificationNumber[i].textContent = size;
         clearInterval(notificationInterval);
      }
    }
    }
    else {
      dropdownMenu.classList.add('hide');
      clearInterval(notificationInterval);
      notificationInterval = setInterval(checkNumber, 5000);
    }
}
function checkNumber() {
	size = document.getElementsByClassName('list__item').length - 
	document.getElementsByClassName('clicked').length;
	for(var i = 0; i < notificationNumber.length;i++){
        notificationNumber[i].textContent = size;
	}
	
	
	
}
function connect() {
    var socket = new SockJS('/chat');
    stompClient = Stomp.over(socket);  
    stompClient.connect({}, function(frame) {
        
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/messages', function(messageOutput) {
            showMessageOutput(JSON.parse(messageOutput.body));
        });
    });
}
function disconnect() {
    if(stompClient != null) {
        stompClient.disconnect();
    }
    
    console.log("Disconnected");
}

function sendMessage() {
	
    stompClient.send("/app/chat", {}, 
      JSON.stringify({'text':text,
      'clicked':sessionStorage.getItem("clickedItem")}));
    if(hungry!=""){
    	stompClient.send("/app/chat", {}, 
      	      JSON.stringify({'text':hungry,
      	      'clicked':sessionStorage.getItem("clickedItem")}));
    }
    
}

function showMessageOutput(messageOutput) {
    var response = document.getElementsByClassName('notification__list');
    //var li = document.createElement('li');
    for(var i=0;i<response.length;i++){
    	var str = '<li class="list__item '+messageOutput.clicked+'">'
    	    +'<a href="#" class="list__item--link">'
    	    +'<img src="https://cdn.tutsplus.com/net/uploads/legacy/213_chris/ChrisThumbnail.jpg" alt="" class="user-image" />'
    	    +'<span class="messages">'
    	    +messageOutput.text+' ('+messageOutput.time+')'
    	    +'</span></a></li>';
    	response.item(i).innerHTML +=str;
    }
    
}
window.addEventListener('click', bellCheck);

if(<c:out value="${loginSuccess}"/> == true&&size==0){
	connect();
	setTimeout(sendMessage, 1000);
	
}
$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>a").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});
</script>

<script>

	$('#header-searchBtn').on("click",function(){
		toggleSearch();
	});
	
	$('.header-searchClose').on("click",function(){
		toggleSearch();
	})	
	
	function toggleSearch() {
		$('.header-transitionGroup-Wrapper').toggle();
	}
	
 </script>
</html>