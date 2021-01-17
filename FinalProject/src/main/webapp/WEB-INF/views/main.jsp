<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
  <title>암기용-Home</title>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Gothic&display=swap" rel="stylesheet">

</head>
<body>
  
<%@ include file="includes/header.jsp" %>

<div class="HomeLayout">
 <div class="HomeLayout-container">
  <%@ include file="includes/sidebar.jsp" %>
  
  <section class="HomeLayout-main">
    <div class="mainWrapper">
      <div class="mainContents">
      
      	
    
        <div class="mainContents-recentFeed">
          <div class="recentFeed-header">
            <h5>최근 학습함</h5>
          </div>
          <c:choose>							
						<c:when test="${empty recentList }">
							<div class="emptyList"><span>최근 학습한 단어장이 없습니다.</span></div>
						</c:when>
						
						<c:otherwise>
						<div class="recentFeed-cards">
							
						<c:forEach items="${recentList }" var="word" varStatus="vs">
							<div class="recentFeed-cardItem" style="display:none">

								<div class="recentFeed-cardItem-inner">
									<div class="wordTitle">
										<span><c:out value="${word.bookTitle }" /></span>
									</div>
									<div class="userId">
										<span><c:out value="${word.bookId }" /></span>
									</div>
								</div>
								
								<div class="recenFeed-cardItem-LinkBox">
									<a class='move-wordList' href='/learn/get?id=<c:out value="${word.bookId }" />&title=<c:out value="${word.bookTitle }" />'></a>
								</div>
							</div>
						</c:forEach>						
						</div>
						<div><a href="#" id="LoadMore"><i class="fas fa-angle-double-down"></i>Load More</a></div>
					 </c:otherwise>		
					</c:choose>
					
        </div>
        
        <div class="mainContents-recentFeed">
					<div class="recentFeed-header">
						<h5>내가 만든 단어장</h5>
					</div>
					
					<c:choose>							
						<c:when test="${empty myList }">
							<div class="emptyList"><span>아직 만들어진 단어장이 없습니다.</span></div>
						</c:when>
						
						<c:otherwise>
						<div class="recentFeed-cards">
							
						<c:forEach items="${myList }" var="word" varStatus="vs">
							<div class="recentFeed-cardItem-small" style="display:none">

								<div class="recentFeed-cardItem-inner">
									<div class="wordTitle">
										<span><c:out value="${word.title }" /></span>
									</div>
									<div class="wordListNum">
										<span> ${fn:length(word.item) }단어</span>
									</div>
								</div>
								
								<div class="recenFeed-cardItem-LinkBox">
									<a class='move-wordList' href='/learn/get?id=<c:out value="${word.id }" />&title=<c:out value="${word.title }" />'></a>
									<%-- <a class='move-wordList' href='<c:out value="${vs.index }" />'></a> --%>
								</div>
							</div>
						</c:forEach>						
						</div>
						<div><a href="/learn/list?id=<sec:authentication property='principal.member.userId'/>" >내 단어장 보기</a></div>
					 </c:otherwise>		
					</c:choose>
					
				</div>
        
       </div>
    </div>
  </section>
</div>
</div>

	
	<script>
	/* load more */
	$(function(){
			/* load more - id */
			$(".recentFeed-cardItem-small").slice(0, 4).show();
	    $(".recentFeed-cardItem").slice(0, 4).show();
	    $("#LoadMore").hide();
	    if($(".recentFeed-cardItem:hidden").length > 0)
        { 
        	$("#LoadMore").show();	        
        }
	    
	    $("#LoadMore").click(function(e){
	        e.preventDefault();
	        $(".recentFeed-cardItem:hidden").slice(0, 8).slideDown();
	        if($(".recentFeed-cardItem:hidden").length == 0)
	        { 
	        	$("#LoadMore").hide();	        
	        }
	    });
	});
	</script>

</body>
</html>