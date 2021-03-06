<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>암기용 - 단어장</title>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/css/learn/get.css">
  
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

</head>
<body>

<%@ include file="../includes/header.jsp" %>

	<div class="HomeLayout back-grey">
		<div class="HomeLayout-container">
			<section class="HomeLayout-main">
				<div class="mainWrapper">
				<h2 class="wordTitle-two"></h2>
					<div class="mainContents">
						
						<!-- 단어카드 -->
						<section class="Section-WordCard">
							<div class="flip-card">
								<div class="flip-card-inner">
									<div class="flip-card-front"></div>
									<div class="flip-card-back"></div>
								</div>
							</div>
							<div class="progressNBtns">
								<button type="button" class="prevCard">
									<i class="fas fa-arrow-left"></i>
								</button>
								<div class="cardProgress"></div>
								<button type="button" class="nextCard">
									<i class="fas fa-arrow-right"></i>
								</button>
							</div>
						</section>
						
						<!-- 이동하기 -->
						<section class="Section-SetPageModsGroup">
							<div class="UIRow">
								<div class="SetPageMods-groups">
									<div class="SetPageMods-groupLabel">
										<h2 class="UIHeading-two">학습</h2>
									</div>
									<div class="SetPageMods-buttonWrapper">
										<div class="SetPageMods-button">
											<span><i class="fas fa-shapes"></i>학습하기</span> 
											<div class="SetPageMods-button-Linkbox"><a class="SetPageMods-buttonWrapper-a"	href="/study"></a></div>
										</div>
										<div class="SetPageMods-button">
											<span><i class="fas fa-pencil-alt"></i>주관식</span> 
											<div class="SetPageMods-button-Linkbox"><a class="SetPageMods-buttonWrapper-a" href="/subjective"></a></div>
										</div>
										<div class="SetPageMods-button">
											<span><i class="fas fa-scroll"></i>테스트</span> 
											<div class="SetPageMods-button-Linkbox"><a class="SetPageMods-buttonWrapper-a" href="/test"></a></div>
										</div>
									</div>
								</div>
							</div>
							
						</section>
						<!-- /.UIRow -->

					<section class="Section-WordLists">
						<div class="listOfWords">
							<h2 class="UIHeading-two">이 세트의 단어<span class="numOfList"></span></h2>

									<c:if test="${WordDTO.size() ==0 }">
										<td colspan="2">아직 단어가 없습니다.</td>
									</c:if>

									<c:forEach items="${WordDTO}" var="list">
										<form id="operForm" action="/learn/study">
											<input type="hidden" name="id" value="<c:out value='${list.id }' />">
											<input type="hidden" name="title" value="<c:out value='${list.title }' />">
										</form>
										
										<c:forEach items="${list.item}" var="item">
											<div class="oneOfWords">
												<div class="item-word"><c:out value='${item.word }' /></div>
												<div class="item-meaning"><c:out	value='${item.meaning }' /></div>
											</div>
										</c:forEach>
									</c:forEach>
									
						</div>
					</section>
					<!-- ./listOfWords -->
						
					</div>
				</div>
			</section>
			
		</div>
	</div>



<script>

$(document).ready(function(){
	
		var WordJsonArray;
		var WordCardArray;
		
		var cardIndex;
		var cardListLength;
	
		function initData() {
			
			WordJsonArray =  JSON.parse('${WordDTO}');
			WordCardArray = WordJsonArray[0]["item"];
			
			cardIndex = 0;
			cardListLength = WordCardArray.length;
			
		};
		
		initData();
		
		var userId = WordJsonArray[0]["id"];
		var userTitle = WordJsonArray[0]["title"];
		
		$('.numOfList').append('('+cardListLength+')');
		//단어장 제목 출력
		$('.wordTitle-two').append(WordJsonArray[0]["title"]);
		
		
		var userIdValue = '<sec:authentication property="principal.member.userId"/>';
		
		function addRecent(){
			var obj = new Object();
				
			obj.bookId = userId;
			obj.bookTitle = userTitle;
			obj.userId = userIdValue;
			
			var jsonData = JSON.stringify(obj);
			
			$.ajax({
				type:"POST",
				dataType: "json",
				url: "/study/recent",
				contentType:'application/json; charset=utf-8',
				data:jsonData
			});
		};
		
		addRecent();
		
		
		//card progress 출력
		function showProgress() 
		{
				var cardProgressIndex = cardIndex+1;
			
				$('.cardProgress').empty();
				$('.cardProgress').append(
						cardProgressIndex + "/" + cardListLength);

				if (cardProgressIndex == 1) {
					
					$('.prevCard').attr('disabled', true);
					$('.prevCard').css('color','#e6e7e5' );
					$('.nextCard').attr('disabled', false);
					
				} else if (cardProgressIndex == cardListLength) {
					
					$('.nextCard').attr('disabled', true);
					$('.nextCard').css('color','#e6e7e5' );
					$('.prevCard').attr('disabled', false);					
					
				} else {					
					$('.prevCard').attr('disabled', false);
					$('.nextCard').attr('disabled', false);
					$('.prevCard').css('color', '#333333');
					$('.nextCard').css('color', '#333333');					
				};
		};
		
		
		function showCard()		
		{
			var cardWord = WordCardArray[cardIndex].word;
			var cardMeaning = WordCardArray[cardIndex].meaning;

			$('.flip-card-front').append(cardWord);
			$('.flip-card-back').append(cardMeaning);
			
			showProgress();		
		};
		
		
		//card click - flip animation
		var card = document.querySelector('.flip-card-inner');
		card.addEventListener('click', function() 
		{
			card.classList.toggle('is-flipped');
		});	
		
		showCard();
		
		var nextBtn = $('.nextCard');
		var prevBtn = $('.prevCard');
		
		nextBtn.on("click", function(e){
			
			$('.flip-card-front').empty();
			$('.flip-card-back').empty();
			cardIndex += 1;
			showCard(cardIndex);			
		});
		
		prevBtn.on("click", function(e){
			
			$('.flip-card-front').empty();
			$('.flip-card-back').empty();
			cardIndex -= 1;
			showCard(cardIndex);			
		});
		
		
		var operForm = $("#operForm");		
		$('a[href="/study"]').click(function(e){			
			e.preventDefault();
			operForm.submit();
		});
		
		$('a[href="/subjective"]').click(function(e){			
			e.preventDefault();
			operForm.attr("action","/learn/subjective");
			operForm.submit();
		});
		
		$('a[href="/test"]').click(function(e){			
			e.preventDefault();
			operForm.attr("action","/learn/test");
			operForm.submit();
		});

});
</script>

</body>
</html>