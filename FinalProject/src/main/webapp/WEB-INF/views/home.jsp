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
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style>
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

<div class="HomeLayout">
	<section class="homeBanner">
		<div class="homeBanner-description">
			<div class="banner-text">
				<h1>가장 거침없는  자기 자신이 되세요</h1>
				<div class="banner-text-middle">
					<p>어떤 주제든 마스터</p>
				</div>
			</div>
		</div>
		<div class="homeBanner-img">
			<img src="/resources/images/home/learn1.jpg" alt="pic">
			<div class="img-description">
				<div class="description-title">
					<p>암기용은 이러한 학생들을 위해 만들어졌습니다.</p>
				</div>
				<div class="description-content">
					<p>“이번 주말에 나갈 수 있게 오늘 밤 학교 공부를 끝낼 거야."라고 말하는 학생들</p>
				</div>
			</div>
		</div>		
	</section>
	<section class="homeHighlightText">
		
	</section>

</div>


</body>
</html>