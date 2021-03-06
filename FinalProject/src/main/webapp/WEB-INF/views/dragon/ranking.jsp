<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>암기용-Home</title>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <style type="text/css">
/*ranking top css*/
h2.connection {
  font-size: 1em;
}
.rankingrow {
  margin-bottom: 5px;
  position: relative;
  top: 10%;
  height: 100px;
  font-size: 20px;
}
.card {
 box-sizing: border-box;
  display: -webkit-box;
  display: inline-block;
  background: #fff;
  min-width: 50%;
  border-radius: 5px;
  overflow: hidden;
  /* box-shadow: 0 2px 4px 0 rgba(34, 36, 38, 0.12), 0 2px 10px 0 rgba(34, 36, 38, 0.15), 0 55px 50px -20px rgba(34, 36, 38, 0.25); */
}
.card-section {
  -webkit-box-flex: 1;
          flex-grow: 1;
  padding: 30px;
}
.card-section i.fa-info-circle{
	position: absolute;
	left: 10px;
	top: 10px;
}
i.fa-info-circle .tooltiptext{
	visibility: hidden;
  	width: 120px;
  	background-color: #555;
  	color: #fff;
  	text-align: center;
  	border-radius: 6px;
  	padding: 5px 0;
  	position: absolute;
  	z-index: 1;
  	bottom: 125%;
  	left: 50%;
  	margin-left: -60px;
  	opacity: 0;
  	transition: opacity 0.3s;
}
i.fa-info-circle .tooltiptext::after{
	content: "";
  	position: absolute;
  	top: 100%;
  	left: 50%;
  	margin-left: -5px;
  	border-width: 5px;
  	border-style: solid;
  	border-color: #555 transparent transparent transparent;
}
.card-section i.fa-info-circle:hover .tooltiptext{
	visibility: visible;
  	opacity: 1;
}
.card-info {
  position: relative;
  background: -webkit-gradient(linear, left top, left bottom, from(#626d82), to(#343d4d));
  background: linear-gradient(to bottom, #626d82 0%, #343d4d 100%);
  color: rgba(255, 255, 255, 0.8);
  text-align: center;
  width: 650px;
  height: 350px;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
}
.card-info h2.sub.header {
  color: rgba(255, 255, 255, 0.3);
}
.card-info .menu, .card-info .search {
  position: absolute;
  font-size: 3em;
  left: 40px;
}
.card-info .menu {
  top: 40px;
}
.card-info .search {
  bottom: 40px;
}
.card-details {
  position: relative;
  color: rgba(0, 0, 0, 0.6);
  width: 100%;
}
.avatar {
  display: inline-block;
  background-image: url("${profile}");
  background-size: 60px;
  background-repeat: no-repeat;
  background-position: center;
  border-radius: 50%;
  height: 100px;
  width: 100px;
  border: 3px solid #e45b6c;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.12), 0 2px 10px 0 rgba(0, 0, 0, 0.15);
  position: relative;
  top: 0%;
  left: 50%;
  transform: translate(-50%, 50px);
}
.statistics {
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: center;
          justify-content: center;
  position: relative;
    top: 20%;
    overflow: hidden;
}
.statistics .statistic {
  padding: 0px 20px;
  min-width: 120px;
  height: 70px;
}
.statistics .statistic:not(:last-child) {
  box-shadow: 20px 0px 0px -19px rgba(255, 255, 255, 0.2);
}
.statistics .statistic-title {
  font-size: 1.5em;
}
.statistics .statistic-value {
  color: #e45b6c;
  font-size: 2em;
}
.dial {
  	color: #e45b6c;
    text-shadow: inset 1px 1px 0 white;
    background: #fff;
    border-radius: 50%;
    display: inline-block;
    height: 130px;
    width: 130px;
    padding-top: 5%;
    box-shadow: 0 4px 15px -10px rgba(0, 0, 0, 0.1), 0 5px 15px 1px rgba(0, 0, 0, 0.18), 0 0 0 15px #fff, 0 0 0 22px #e45b6c, 0 55px 50px -20px rgba(34, 36, 38, 0.25);
    top: 50%;
    position: relative;
    left: 50%;
    transform: translate(-50%, -50%);
}
.dial-title {
  font-size: 3.8em;
  font-weight: 400;
  line-height: .5;
}
.dial-value {
  font-size: 1.8em;
}
/*ranking top css end*/

/*ranking 전체 영역 menu*/
.card-section .card-menu {
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: justify;
          justify-content: space-between;
  margin-bottom: 40px;
}
.menu-item {
  font-size: 1.6em;
  font-weight: 400;
  padding: 20px 40px;
  color: rgba(0, 0, 0, 0.3);
  min-width: 50%;
  cursor: pointer;
}
.menu-item:not(:last-child) {
  box-shadow: 25px 0px 0 -24px rgba(0, 0, 0, 0.2);
}
.menu-item:last-child {
  text-align: right;
}
.menu-item-active {
  color: tint(#e45b6c, 20%);
}
/*ranking 전체 영역 menu end*/

/*ranking bottom css*/
.ranking-window {
  position: absolute;
  left:0; right:0;
  top: 50px;
  margin: auto;
  width: 600px;
  border-radius: 4px;
  background: #fff;
  overflow: hidden;
}
.ranking-window-body {
  background-color: #f9f9f9;
}
.ranking-row {
  margin:0;
  padding: 10px 20px;
  list-style: none;
}
.ranking-row:after {
  content: '';
  display: table;
  clear:both;
}
.ranking-row-even {
  background-color: #fff;
}
.ranking-row li {
  display:inline-block;
  vertical-align: top;
  float: left;
}
.ranking-header {
  text-align: center;
  padding: 20px;
}
.ranking-profile{
	width: 18%;
}
.ranking-level, .ranking-score,
.ranking-header-profile, .ranking-header-level, .ranking-header-score{
  min-width: 54px;
  text-align: center;
  width: 10%;
}
.ranking-rank{
	width: 10%;
	line-height: 45px;
	text-align: center;
}
.ranking-member {
  width: 32%;
  min-width: 160px;
  font-size: 18px;
  font-weight: normal;
  padding-top: 3px;
}
.ranking-header-member {
  width: 50%;
  min-width: 160px;
}
.ranking-subtitle {
  color: #858585;
  font-size: 14px;
  font-weight: 300;
}
.ranking-level{
  width: 20%;
  min-width: 110px;
  font-size: 18px;
  line-height: 45px;
}
.ranking-score{
	width: 20%;
	min-width: 80px;
  	font-size: 18px;
  	line-height: 45px
}
.ranking-header-level{
  width: 20%;
  min-width: 110px;
}
.ranking-header-score {
  width: 20%;
  min-width: 80px;
}
.ranking-level .null, .ranking-score .null {
  color:#bababa;
}
.profile {
  display:block;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  border: 2px solid #e45b6c;
  border-color: #e45b6c;
   background: white;  
  margin: 0 auto;
  background-size: 70%;
  background-repeat: no-repeat;
  background-position: center;
}
.goldprofile {
 	border-color: #f9d56e;
}
.silverprofile {
	border-color: #55a4dc;
    
}
.bronzeprofile {
  border-color: #b19242;
  
}
#connection{
	font-size: 1em;
	color: rgba(255, 255, 255, 0.3);
}
.menu-item-active a{
	color:#e45b6c;
}
/*ranking bottom css end*/

.overlay{
	position: absolute;
	top: 3%;
	display: flex;
    align-items: center;
    justify-content: center;
    display: none;
}
.overlay h1{
	font-size: 30px;
	margin-top: 30px;
}
</style>
</head>
<body onload="showClock()">
  
<%@ include file="../includes/header.jsp" %>
<!-- 89행,321행 변경 요망!!!  -->
  <div class="HomeLayout">
    <div class="HomeLayout-container">
    <%@ include file="../includes/sidebar.jsp" %>
    
	  <section class="HomeLayout-main">
	  <div class="mainWrapper">
		<div class="mainContents">
	    <div class="card">
		<section class="card-info card-section">
			<div class="avatar rankingrow">
			</div>
			
			<section class="statistics">
				<article class="statistic">
					<h4 class="statistic-title">
						Rank
					</h4>
					<h3 class="statistic-value">
						${userInfo.rank}
					</h3>
				</article>
				
				<article class="statistic">
					<h4 class="statistic-title">
						Score
					</h4>
					<h3 class="statistic-value">
						${userInfo.score}
					</h3>
				</article>
			</section>
			
			<section class="user rankingrow">
				<h1 class="user-header">
					${userInfo.userId}
					<h2 id="connection">
						
					</h2>
				</h1>
			</section>
			
			<div class="dial">
				<h2 class="dial-title">
					${userInfo.totalLevel}
				</h2>
				<h3 class="dial-value">
					Level
				</h3>
			</div>
		</section>
		<section class="card-info card-section overlay">
		<div>
		<img alt="" src="../resources/images/icon/alertIcon.svg" width="100px">
		<h1>용을 구입해주세요!!</h1>
		</div>
		</section>
		<section class="card-details card-section">
			<!-- 
			<nav class="card-menu">
				<article class="global menu-item menu-item-active">
					<a href="#tab_global">Global</a> 
				</article>
				<article class="friends menu-item">
					<a href="#tab_friends">Friends</a> 
				</article>
			</nav> -->
			<div class="ranking-window-body">
	    <div class="ranking-window-awards" id="tab_global">
	      <ul class="ranking-row ranking-header">
	        <li class="ranking-header-profile">RANK</li>
	        <li class="ranking-header-member">MEMBER</li>
	        <li class="ranking-header-level">TOTAL LEVEL</li>
	        <li class="ranking-header-score">SCORES</li>
	      </ul>
	      <c:forEach items="${rank}" var="item">
	      	<c:choose>
	      		<c:when test="${item.rank%2==0}">
					<ul class="ranking-row ">
	      		</c:when>
	      		<c:otherwise>
	      			<ul class="ranking-row ranking-row-even">
	      		</c:otherwise>
	      	</c:choose>
	      	
	      		<c:choose>
	      			<c:when test="${item.rank eq 1}">
	      				<li class="ranking-rank">
	      					<img src="../resources/images/ranking/medal.svg" width="35px">
	      				</li>
	      				<li class="ranking-profile">
	      				<span class="profile goldprofile" style="background-image: url('${item.img}')">
	      				</span></li>
	      			</c:when>
	      			<c:when test="${item.rank eq 2}">
	      				<li class="ranking-rank">
	      					<img src="../resources/images/ranking/silvermedal.svg" width="35px">
	      				</li>
	      				<li class="ranking-profile">
	      				<span class="profile silverprofile" style="background-image: url('${item.img}')">
	      				</span></li>
	      			</c:when>
	      			<c:when test="${item.rank eq 3}">
	      				<li class="ranking-rank">
	      					<img src="../resources/images/ranking/bronzemedal.svg" width="35px">
	      				</li>
	      				<li class="ranking-profile">
	      				<span class="profile bronzeprofile" style="background-image: url('${item.img}')">
	      				</span></li>
	      			</c:when>
	      		<c:otherwise>
	      		<li class="ranking-rank">${item.rank}</li>
	      		<li class="ranking-profile">
	      		<span class="profile" style="background-image: url('${item.img}')">
	      		</span></li>
	      			
	      		</c:otherwise>
	      		</c:choose>
	      	
	        <li class="ranking-member">${item.userId}
	          <div class="ranking-subtitle">
	          <sec:authentication var="principal" property="principal" />
	          <c:choose>
	          <c:when test="${item.userId eq principal.username}">
	          	접속중
	          </c:when>
	          <c:otherwise>
	          ${item.totalConnection}
	          </c:otherwise>
	          </c:choose>
	          </div>
	        </li>
	        <li class="ranking-level"><span class="null">${item.totalLevel}</span></li>
	        <li class="ranking-score"><span class="null">${item.score}</span></li>
	      </ul>
	      </c:forEach>
	      </div>
	      <div class="ranking-window-awards" id="tab_friends">
	      <ul class="ranking-row ranking-header">
	        <li class="ranking-header-profile">RANK</li>
	        <li class="ranking-header-member">MEMBER</li>
	        <li class="ranking-header-level">TOTAL LEVEL</li>
	        <li class="ranking-header-score">SCORES</li>
	      </ul>
	      <c:forEach items="${rank}" var="item">
	      	<c:choose>
	      		<c:when test="${item.rank%2==0}">
					<ul class="ranking-row ">
	      		</c:when>
	      		<c:otherwise>
	      			<ul class="ranking-row ranking-row-even">
	      		</c:otherwise>
	      	</c:choose>
	      	
	      		<c:choose>
	      			<c:when test="${item.rank eq 1}">
	      				<li class="ranking-rank">
	      					<img src="../resources/images/ranking/medal.svg" width="35px">
	      				</li>
	      				<li class="ranking-profile"><span class="profile goldprofile"></span></li>
	      			</c:when>
	      			<c:when test="${item.rank eq 2}">
	      				<li class="ranking-rank">
	      					<img src="../resources/images/ranking/silvermedal.svg" width="35px">
	      				</li>
	      				<li class="ranking-profile"><span class="profile silverprofile"></span></li>
	      			</c:when>
	      			<c:when test="${item.rank eq 3}">
	      				<li class="ranking-rank">
	      					<img src="../resources/images/ranking/bronzemedal.svg" width="35px">
	      				</li>
	      				<li class="ranking-profile"><span class="profile bronzeprofile"></span></li>
	      			</c:when>
	      		<c:otherwise>
	      			<li class="ranking-rank">${item.rank}</li>
	      			<li class="ranking-profile"><span class="profile"></span></li>
	      			
	      		</c:otherwise>
	      		</c:choose>
	      	
	        <li class="ranking-member">${item.userId}
	          <div class="ranking-subtitle"></div>
	        </li>
	        <li class="ranking-level"><span class="null">${item.totalLevel}</span></li>
	        <li class="ranking-score"><span class="null">${item.score}</span></li>
	      </ul>
	      </c:forEach>
	      </div>
	  </div>
		</section>
	</div>
	</div>
	</div>
	  </section>
	</div>
	</div>
	<input type="hidden" name="connectionTime" value="${connectionTime}">
</body>
<script type="text/javascript">
var currentDate = '<c:out value="${connectionTime}"/>';

function showClock() {
	
	var Now = String(new Date().getTime());
	var hr = 0;
	var min = Math.round((parseInt(Now) - parseInt(currentDate))/60000);
	if(min>=60){
		hr = Math.floor(min/60);
		min = min-60*(hr);
		$("#connection").text(hr+" hr "+min+" min");
	}else{
		$("#connection").text(min+"min");
	}
	
	setTimeout(showClock,60000);
}

$(document).ready(function() {
	if('<c:out value="${alert}"/>'){//로그아웃상태일시 차단
		document.location.href="/main";
		alert('로그인이 필요합니다!');
		return false;
	}
	if('<c:out value="${profile}"/>'==-1){
		$('.overlay').css('display','flex');
	}
	
	$('.ranking-window-awards').hide();
	$('.ranking-window-awards:first').show();
	$('.menu-item').on('click',function(){
		$('.menu-item').removeClass('menu-item-active');
		$(this).addClass('menu-item-active');
		$('.ranking-window-awards').hide();
		
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});
	
});

</script>
</html>