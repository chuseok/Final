<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암기용-Search</title>

  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
  

  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/css/search.css">
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>	

</head>
<body>

<%@ include file="includes/header.jsp" %>

	<div class="HomeLayout">
		<div class="HomeLayout-container">
			<section class="HomeLayout-main">
			
				<div class="mainWrapper">
					<div class="mainContents">
						<div class="mainContents-header"> <span>검색결과</span></div>
						<div class="mainContents-searchFeed">
							<div class="searchFeed-header">
								<h5>ID : ${fn:length(idList) }건</h5>
							</div>
							<div class="searchFeed-cards">							
							
								<c:forEach items="${idList }" var="word">
								<div class="searchFeed-cardItem">
	
										<div class="searchFeed-cardItem-inner">
											<div class="wordCardInfo">
												<div class="wordTitle">
													<span><c:out value="${word.title }" /></span>
												</div>
												<div class="userId">
													<span><c:out value="${word.id }" /></span>
												</div>
												<div class="wordListNum">
													<span> ${fn:length(word.item) }단어</span>
												</div>
											</div>
										</div>
										
										<div class="searchFeed-cardItem-LinkBox">
											<a class='move-wordList' href='/learn/get?id=<c:out value="${word.id }" />&title=<c:out value="${word.title }" />'></a>
											<%-- <a class='move-wordList' href='<c:out value="${vs.index }" />'></a> --%>
										</div>
									</div>
									
								</c:forEach>	
							</div>
							<div><a href="#" id="LoadMore"><i class="fas fa-angle-double-down"></i>Load More</a></div>
						</div>
						
						<div class="mainContents-searchFeed">
							<div class="searchFeed-header">
								<h5>TiTle : ${fn:length(titleList) }건</h5>
							</div>
							<div class="searchFeed-cards">		
												
								<c:forEach items="${titleList }" var="word">
									<div class="searchFeed-cardItem-large">
	
										<div class="searchFeed-cardItem-inner">
											<div class="wordCardInfo">
												<div class="wordTitle">
													<span><c:out value="${word.title }" /></span>
												</div>
												<div class="userId">
													<span><c:out value="${word.id }" /></span>
												</div>
												<div class="wordListNum">
													<span> ${fn:length(word.item) }단어</span>
												</div>
											</div>
											<div class="wordList">
												<c:forEach items="${word.item }" var="wordList" begin="0" end="3">
													<div class="wordList-word"><span>${wordList.word }</span><br><span class="colorGray">${wordList.meaning }</span></div>
												</c:forEach>
											</div>
										</div>
										
										<div class="searchFeed-cardItem-LinkBox-large">
											<a class='move-wordList' href='/learn/get?id=<c:out value="${word.id }" />&title=<c:out value="${word.title }" />'></a>
											<%-- <a class='move-wordList' href='<c:out value="${vs.index }" />'></a> --%>
										</div>
									</div>
									
								</c:forEach>
							
							</div>
							<div><a href="#" id="LoadMore-Title"><i class="fas fa-angle-double-down"></i>Load More</a></div>
							
						</div>						
						
					</div>
				</div>
			</section>
		</div>
	</div>

<script>


	var urlParams = new URLSearchParams(window.location.search);
	console.log(urlParams.get('keyword'));
	
	var keyWord = '<span>'+urlParams.get('keyword')+'</span>';
	$('.mainContents-header').prepend(keyWord);

	
	/* load more */
	$(function(){
			/* load more - id */
	    $(".searchFeed-cardItem").slice(0, 6).show();
	    $("#LoadMore").click(function(e){
	        e.preventDefault();
	        $(".searchFeed-cardItem:hidden").slice(0, 8).slideDown();
	        if($(".searchFeed-cardItem:hidden").length == 0)
	        { 
	        	$("#LoadMore").prop("disabled", false);	        
	        }
	    });
	    
	    /* load more - title */
	    $(".searchFeed-cardItem-large").slice(0, 8).show();
	    $("#LoadMore-Title").click(function(e){
	        e.preventDefault();
	        $(".searchFeed-cardItem-large:hidden").slice(0, 6).slideDown();
	        if($(".searchFeed-cardItem-large:hidden").length == 0){
	        	$("#LoadMore-Title").prop("disabled", false);
	        }
	    });
	});
</script>
</body>
</html>