<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Insert title here</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link href="<c:url value="/resources/css/createWord.css" />" rel="stylesheet">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/js/wordBook.js"></script>
</head>
<body>
<h1>Drag and Drop List </h1>
<p id="json"></p>
<form id="wordForm" method="post">
<p>단어장 제목 : <input type="text" name="word-title"></p>
<ul class="TermRows">
  <li id="1">
    <div> <span class = "up"></span><span class = "down"></span> </div>
    <input type="text" name="word" style="width:200px;"/>
    <input type="text" name="meaning" style="width:200px;"/>
  </li>
  <li id="2">
    <div> <span class = "up"></span><span class = "down"></span> </div>
    <input type="text" name="word" style="width:200px;"/>
    <input type="text" name="meaning" style="width:200px;"/>
  </li>
  <li id="3">
    <div> <span class = "up"></span><span class = "down"></span> </div>
    <input type="text" name="word" style="width:200px;"/>
    <input type="text" name="meaning" style="width:200px;"/>
  </li>
  <li id="4">
    <div> <span class = "up"></span><span class = "down"></span> </div>
    <input type="text" name="word" style="width:200px;"/>
    <input type="text" name="meaning" style="width:200px;"/>
  </li>
  <li id="5">
    <div> 
    	<span class = "up"></span><span class = "down"></span> 
    </div>
    <input type="hidden" name="numbering" value="5"/>
    <input type="text" name="word" style="width:200px;"/>
    <input type="text" name="meaning" style="width:200px;"/>
   
  </li>
</ul>
<input type="hidden" name="${_csrf.headerName}" value="${_csrf.token}"/>

<button data-oper="add">add</button>
<button data-oper="save">save</button>
</form>


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
		
		var wordTitle = $('input[name=word-title]').val();
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
		
		str += '<input type="text" name="word" style="width:200px;"/>';
		str += '<input type="text" name="meaning" style="width:200px;"/>';
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
</body>
</html>