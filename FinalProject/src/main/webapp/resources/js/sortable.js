$(function() {
	$("ul").sortable({
		stop : function(event, ui) {
			var wordList = [];
			var arr = new Array();

		}
	});
	$("ul").disableSelection();
});
/*
$(document).on('click', 'button', function(e){
	e.preventDefault();
	var operation = $(this).data("oper");
	
	if (operation === 'add') {
		
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
});*/