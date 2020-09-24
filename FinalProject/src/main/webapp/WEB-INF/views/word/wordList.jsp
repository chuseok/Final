<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<link rel="stylesheet" href="/resources/css/main.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<link href="<c:url value="/resources/css/createWord.css" />"
	rel="stylesheet">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/js/wordBook.js"></script>
<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="HomeLayout">
		<div class="HomeLayout-container">
			<%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>
			<section class="HomeLayout-main">
				<div class="mainWrapper">
					<div class="mainContents">
						<form id="wordForm" class="wordForm" method="post"
							autocomplete="off">
							<div class="CreateSetHeader">
								<div class="CreateSetHeader-stickyPlaceholder">
									<div class="CreateSetHeader-sticky">
										<div class="UIContainer">
											<div class="CreateSetHeader-heading">
												<div class="CreateSetHeader-headingText">
													<span>학습 세트 만들기</span>
												</div>
												<div class="CreateSetHeader-infoButtonWrap">
													<button class="UIButton">
														<span class="UIButton-wrapper"> <span>만들기</span>
														</span>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>

CreateSetPage-container
								<div class="UIContainer">
									<div class="CreateSetHeader-textarea CreateSetHeader-title">
										<label class="UITextarea">
											<div class="UITextarea-content">
												<div
													class="AutoExpandTextarea UITextarea-textarea UITextarea-autoExpandTextarea">

													<div class="AutoExpandTextarea-wrapper">
														<textarea maxlength="100" placeholder="제목을 입력하세요."
															tabindex="5" variant="default"
															class="AutoExpandTextarea-textarea"
															onchange="adjustHeight();" onkeypress="adjustHeight();"
															onkeydown="adjustHeight();" onkeyup="adjustHeight();"
															onscroll="return false;"></textarea>
													</div>
												</div>
												<span class="UITextarea-border"></span>
											</div> <span class="UITextarea-label"> <span>제목</span>
										</span>
										</label>
									</div>
								</div>



								<ul class="TermRows">
									<li id="1">
										<div>
											<span class="up"></span><span class="down"></span>
										</div> <input type="text" name="word" class="word"
										style="width: 200px;" /> <input type="text" name="meaning"
										class="meaning" style="width: 200px; margin-left: 10px;" />
										<div class="ItemType">
											<p>단어</p>
											<p class="RichTextEditor-labelText">뜻</p>
										</div>
									</li>
									<li id="2">
										<div>
											<span class="up"></span><span class="down"></span>
										</div> <input type="text" name="word" class="word"
										style="width: 200px;" /> <input type="text" name="meaning"
										class="meaning" style="width: 200px; margin-left: 10px;" />
										<div class="ItemType">
											<p>단어</p>
											<p class="meaning">뜻</p>
										</div>
									</li>
									<li id="3">
										<div>
											<span class="up"></span><span class="down"></span>
										</div> <input type="text" name="word" class="word"
										style="width: 200px;" /> <input type="text" name="meaning"
										class="meaning" style="width: 200px; margin-left: 10px;" />
										<div class="ItemType">
											<p>단어</p>
											<p class="meaning">뜻</p>
										</div>
									</li>
									<li id="4">
										<div>
											<span class="up"></span><span class="down"></span>
										</div> <input type="text" name="word" class="word"
										style="width: 200px;" /> <input type="text" name="meaning"
										class="meaning" style="width: 200px; margin-left: 10px;" />
										<div class="ItemType">
											<p>단어</p>
											<p class="meaning">뜻</p>
										</div>

									</li>
									<li id="5">
										<div>
											<span class="up"></span><span class="down"></span>
										</div> <input type="hidden" name="numbering" value="5" /> <input
										type="text" name="word" class="word" style="width: 200px;" />
										<input type="text" name="meaning" class="meaning"
										style="width: 200px; margin-left: 10px;" />
										<div class="ItemType">
											<p>단어</p>
											<p class="meaning">뜻</p>
										</div>

									</li>
								</ul>
								<input type="hidden" name="${_csrf.headerName}"
									value="${_csrf.token}" />

								<button class="UIButton" data-oper="add">add</button>
								<button class="UIButton" data-oper="save">save</button>
						</form>


					</div>
				</div>
			</section>
		</div>
	</div>
	<p id="json"></p>


	<script src="<c:url value="/resources/js/sortable.js" />"></script>
	<script>
$(document).on('click', 'button', function(e){
	e.preventDefault();
	var operation = $(this).data("oper");

	/*console.log(operation);*/

	if (operation === 'save') {
/*		formObj.attr("action", "/word/write");
*/		
		
		alert(operation);
		var wordList = [];
		var arr = new Array();
		
		var wordTitle = document.getElementsByClassName("AutoExpandTextarea-textarea")[0].value;
		var word = document.getElementsByName("word");
		var meaning = document.getElementsByName("meaning");
		
		if(!wordTitle) {
			alert('제목을 입력하세요.');
			console.log(wordTitle);
			return;
		} 
		for(i=0; i<word.length; i++) {
			if(!word[i].value) {
				alert('내용을 입력하세요.');
				return;
			}
		}
		
		
		for(i=0; i<word.length; i++) {
			var obj = new Object();
			obj.word = word[i].value;
			obj.meaning = meaning[i].value;
			console.log("word 값 : " + obj.word);
			console.log("meaning 값 : " + obj.meaning);
			arr.push(obj);
			
		}
	
		var csrfTokenValue = $("meta[name='_csrf']").attr("content");
		var csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
		
		console.log(csrfHeaderName);
		
		var item = JSON.stringify(arr);
		
		$.ajax({
			url : '/word/read',
			type : 'post',
			dataType : 'json',
			traditional : true,
			data : {"item" : item,
				"wordTitle" : wordTitle},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(response) {
				alert('리스트에 추가함.')
			}
		});

		<sec:authorize access="isAuthenticated()">
		
		var userIdValue = '<sec:authentication property="principal.member.userId"/>';
		</sec:authorize>
		
		console.log("userIdValue 확인" + userIdValue);
		
		
		var wordBook = {
				userId : userIdValue,
				folderId : +0,
				wordTitle : wordTitle
		};
		
		wordBookService.add(wordBook, function(result) {
			alert(result);
			
		});
		
	} else if (operation === 'add') {

	        
		var str="";
		var setUL = $(".TermRows");
		var count = $(this).closest('form').children('.TermRows').children('li').last().find('input:first').val();
		count++;
				
		str += '<li id="'+count+'">';
		str += '<div><span class = "up"></span><span class = "down"></span></div>';
		str += '<input type="hidden" value="'+ count +'">';
		str += '<input type="text" name="word" class="word" style="width:200px;"/>';
		str += '<input type="text" name="meaning" class="meaning" style="width:200px; margin-left: 10px;"/>';
		str += '<div class="ItemType"><p>단어</p><p class="meaning">뜻</p></div>';
		str += '</li>';

		setUL.append(str);
	}
});
</script>
	<!-- <script>
	$(document).ready(function() {
		var titleValue = $('input[name=word-title]').val();
		<sec:authorize access="isAuthenticated()">
		var userIdValue = '<sec:authentication property="principal.member.userId"/>';
		</sec:authorize>
		
		
		var wordBook = {
				userId : userIdValue,
				folderId : +0,
				wordTitle : titleValue
		};
		
		wordBookService.add(wordBook, function(result) {
			alert(result);
			
		});
	});
</script> -->
	<script>
	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight);
	};
	adjustHeight();
</script>
</body>
</html>