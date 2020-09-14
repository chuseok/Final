<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>암기용-Home</title>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/css/home.css">
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style>

.HomeLayout-vertical {
	margin: 0 auto;
    min-height: 100vh;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.homeHighlightText {
	width: 100%;
	padding: 10.5rem 0;
}

.splitBanner {
	width: 100%;
}



.homeBanner {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #fff;
	
}

.homeBanner-img {
	width: 50%;
	align-self: stretch;
}

.homeBanner-img img {
	width: 100%;
	align-self: stretch;
} 

.img-description {
	background-color: #124789;
	padding: 1rem 0;
	color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.img-description div {
	padding: 1rem 0;
	width: 80%;
}

.description-title p {
	font-size: 3vw;
}

.description-content p {
	font-size: 2vw;
}

.homeBanner-description {
	width: 50%;
	display: flex;
	margin-left: auto;
	margin-right: auto;
	align-self: stretch;
	padding: 1rem 0;
}

.banner-text {
	max-width: 26rem;
	margin-left: auto;
	margin-right: auto;
	padding: 0 auto;
}




</style>

</head>
<body>
  
<%@ include file="includes/header.jsp" %>

<div class="HomeLayout-vertical">

	<section class="homeHighlightText">
		<h2>암기용을 사용하는 학생의 90%가 높은 점수를 받았다고 합니다.</h2>
	</section>

	<section class="splitBanner">		
			<div class="splitBanner-img">
				<div class="img-center">
					<img alt="img" src="">
				</div>
			</div>
			<div class="splitBanner-text">
				<div class="description-title">
					<h3>학습에 필요한 모든 것을 제공해드리겠습니다.</h3>
				</div>
				<div class="description-content">
					<p>영어를 배우는 데 도움이 되는 낱말카드부터 역사를 쉽게 이해할 수 있는 게임에 이르기까지 다양한 도구를 사용하여 모든 도전을 극복할 수 있습니다.</p>
				</div>
			</div>			
	</section>
	
	<section class="splitBanner">			
			<div class="splitBanner-text">
				<div class="description-title">
					<h3>다음 성공이 코앞으로 다가왔습니다.</h3>
				</div>
				<div class="description-content">
					<p>회원님이 배우는 각각의 새로운 사실은 성취입니다. 암기용은 주제를 세분화하여 모든 단계에서 새로운 것을 성취할 수 있도록 합니다.</p>
				</div>
			</div>	
			<div class="splitBanner-img">
				<div class="img-center">
					<img alt="img" src="">
				</div>
			</div>		
	</section>
	
	<section class="splitBanner">		
			<div class="splitBanner-img">
				<div class="img-center">
					<img alt="img" src="">
				</div>
			</div>
			<div class="splitBanner-text">
				<div class="description-title">
					<h3>좌절하지 마세요. 완료하세요.</h3>
				</div>
				<div class="description-content">
					<p>아무리 작은 레슨이라도 승리처럼 느껴질 때, 계속하기 쉽습니다.</p>
				</div>
			</div>			
	</section>
	
</div>



</body>
</html>