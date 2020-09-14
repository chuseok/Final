$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({},null,null);
	function checkModal(result){
		
		if(result ==='' || history.state){
			return;
		}
		if(parseInt(result) >0 ){
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
		}
		$("#myModal").modal("show");
	}
	
	$("#regBtn").on("click", function(){
		self.location="/folder/register";
	});
	

	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
});