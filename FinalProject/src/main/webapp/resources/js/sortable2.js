$(function() {
	$("ul").sortable({
		stop : function(event, ui) {
			var wordList = [];
			var arr = new Array();

		}
	});
	$("ul").disableSelection();
});

$(document).on('click', 'button', function(e){
	e.preventDefault();
	var operation = $(this).data("oper");

	/*console.log(operation);*/

	if (operation === 'save') {
/*		formObj.attr("action", "/word/write");
*/		
		
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
		
		
		$("ul").children("li").each(function() {
			/* idList.push($(this).attr('id')); */
			
		});
		
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
	/*formObj.submit();*/

	/*var wordList = [];
	var arr = new Array();
	
	var word = document.getElementsByName("word");
	var meaning = document.getElementsByName("meaning");
	
	for(i=0; i<word.length; i++) {

		var obj = new Object();
		obj.word = word[i].value;
		obj.meaning = meaning[i].value;
		console.log("word 값 : " + obj.word);
		console.log("meaning 값 : " + obj.meaning);
		arr.push(obj);
	}
	
	
	$("ul").children("li").each(function() {
		 idList.push($(this).attr('id')); 
		
	});
	
	var item = JSON.stringify(arr);
	var wordTitle = $('input[name=word-title]').val();
	$.ajax({
		url : '/word/read',
		type : 'post',
		dataType : 'json',
		traditional : true,
		data : {"item" : item,
			"wordTitle" : wordTitle},
		success : function(response) {
			alert('리스트에 추가함.')
		}
	});*/
});