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
<p id="json"></p>
<form id="wordForm" method="post">
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
							<span class="UIButton-wrapper">
								<span>만들기</span>
							</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="UIContainer">
		<div class="CreateSetHeader-textarea CreateSetHeader-title">
				<label class="UITextarea">
					<div class="UITextarea-content">
							<div class="AutoExpandTextarea UITextarea-textarea UITextarea-autoExpandTextarea">
					
							<div class="AutoExpandTextarea-wrapper">
								<textarea maxlength="100" placeholder="제목을 입력하세요." tabindex="5" variant="default" class="AutoExpandTextarea-textarea" onchange="adjustHeight();" onkeypress="adjustHeight();" 
								onkeydown="adjustHeight();" onkeyup="adjustHeight();" onscroll="return false;"></textarea>
							</div>
							</div>
						<span class="UITextarea-border"></span>
					</div>
					<span class="UITextarea-label">
						<span>제목</span>
					</span>
				</label>
		</div>
	</div>
	
	
	
<!-- 		<div class="UIContainer">
		<div class="CreateSetHeader-textarea CreateSetHeader-title">
			<div class="SpecialCharacterTextarea">
				<label class="UITextarea">
					<div class="UITextarea-content">
						<div class="AutoExpandTextarea UITextarea-textarea UITextarea-autoExpandTextarea">
							<div class="AutoExpandTextarea-sizer"></div>
							<div class="AutoExpandTextarea-wrapper">
								<textarea maxlength="255" placeholder="제목을 입력하세요." tabindex="5" variant="default" class="AutoExpandTextarea-textarea"></textarea>
							</div>
						</div>
						<span class="UITextarea-border"></span>
					</div>
					<span class="UITextarea-label">
						<span>제목</span>
					</span>
				</label>
			</div>
		</div>
	</div> -->
</div>

<!-- 

<div class="CreateSetPage-container">
	<div class="UIContainer">
		<div class="CreateSetPage-list">
			<div class="StudiableItems">
				<div class="TermRows">
					<div>
						<div class="TermRows-termRowWrap">
							<div class="TermRow is-active">
								<div class="TermRow-bareSide TermRow-bareSide--word TermText">
								</div>
								<div class="TermContent has-richTextToolbar rt-clean-design is-active-definition">
									<div class="TermContent-inner" draggable="true">
										<div class="StudiableItemToolbar is-term-active">
											<span class="StudiableItemToolbar-counter">
											before
											</span>
											<div class="StudiableItemToolbar-editableToggles"></div>
											<div class="StudiableItemToolbar-dragToggle">
												<span class="ContextToggle">
													<span class="UIIconButton">
														<button class="UIButton UIButton--borderless" tabindex="-1" type="button" disabled>
															<span class="UIButton-wrapper">
																<div class="UIIcon UIIcon--drag">
																icon
																<div>icon</div>
																</div>
															</span>
														</button>
													</span>
												</span>
											</div>
											<div class="StudiableItemToolbar-actionableToggles">
												<span class="ContextToggle">
													<span class="UIIconButton is-Popover is-Tooltip UIOverlayTrigger-target">
														<button class="UIButton UIButton--borderless" tabindex="-1" type="button">
															<span class="UIButton-wrapper">
																<div class="UIIcon UIIcon--garbage">
																icon
																	<div></div>
																</div>
															</span>
														</button>
													</span>
												</span>
											</div>
										</div>
										
										<div class="TermContent-inner-padding">
											<div class="TermContent-sides">
												<div class="TermContent-sideWrap">
												
													<div class="TermContent-side TermContent-side--word">
														<div class="WordSide">
															<div class="RichTextEditor">
																<div class="PMEditor notranslate">
																	<div class="ProseMirror">
																	<p></br></p>
																	</div>
																</div>
																<div class="PMEditor-border"></div>
																<span></span>
																<span class="RichTextEditor-label">
																	<div class="RichTextEditor-labelText">단어</div>
																</span>
															</div>
														</div>
													</div>
													
													<div class="TermContent-side TermContent-side--definition">
														<div class="DefinitionSide">
															<div class="DefinitionSide-richTextEditor">
																<div class="RichTextEditor">
																	<div class="PMEditor notranslate">
																		<div class="ProseMirror">
																		<p></br></p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="TermContent-externalContextToggles"></div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="TermRowSeparator">
						</div>
					</div>
				</div>
			</div>
			<div class="CreateSetPage-footer"></div>
		</div>
	</div>
</div>
 -->
<!-- <input type="text" name="word-title" placeholder="제목을 입력하세요."> -->
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