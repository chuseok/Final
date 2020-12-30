<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
  <title>암기용-Learn</title>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
  

  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/css/learn/list.css">
  
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Gothic&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>	
</head>
<body>

<%@ include file="../includes/header.jsp" %>

	<div class="HomeLayout">
		<div class="HomeLayout-container">
			<%@ include file="../includes/sidebar.jsp" %>
			
			<section class="HomeLayout-main">
				<div class="mainWrapper">
					<div class="mainContents">
					<h2>내 세트</h2>
						<div class="mainContents-myCards">
							<div class="myCards-header">
								<h5>내가 만든 단어장(${fn:length(myList) })</h5>
							</div>
							<c:choose>							
								<c:when test="${empty myList }">
									<div class="emptyList"><span>아직 만들어진 단어장이 없습니다.</span></div>
								</c:when>
								
								<c:otherwise>
								<div class="myCards">
									
									<c:forEach items="${myList }" var="word" varStatus="vs">
										<div class="myCards-cardItem" style="display:none">
			
											<div class="myCards-cardItem-inner">
												<div class="wordTitle">
													<span><c:out value="${word.title }" /></span>
												</div>
												<div class="wordListNum">
													<span> ${fn:length(word.item) }단어</span>
												</div>
											</div>
											
											<div class="myCards-cardItem-LinkBox">
												<a class='move-wordList' href='/learn/get?id=<c:out value="${word.id }" />&title=<c:out value="${word.title }" />'></a>
												<%-- <a class='move-wordList' href='<c:out value="${vs.index }" />'></a> --%>
											</div>
										</div>
									</c:forEach>						
								</div>
								<div><a href="#" id="LoadMore"><i class="fas fa-angle-double-down"></i>Load More</a></div>
							 </c:otherwise>		
							</c:choose>		
							
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	
<script>

	$(document).ready(function(){	

		
		history.replaceState({},null,null)
		
		
		console.log(${myList});
	});

</script>

<script>
	/* load more */
	$(function(){
	    $(".myCards-cardItem").slice(0, 10).show();
	    $("#LoadMore").hide();
	    if($(".myCards-cardItem:hidden").length > 0){
	    	$("#LoadMore").show();	        
	    }
	    $("#LoadMore").click(function(e){
	        e.preventDefault();
	        $(".myCards-cardItem:hidden").slice(0, 10).slideDown();
	        if($(".myCards-cardItem:hidden").length == 0)
	        { 
	        	$("#LoadMore").hide();	        
	        }
	    });
	});
	</script>

</body>
</html>