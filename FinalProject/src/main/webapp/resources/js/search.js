$(document).ready(function() {
	$('.header-searchTransitionGroup-Wrapper').hide();
	$('.search-btn').on('click', function() {
		/*$('#search-txt').addClass('selected');

		var icon = document.getElementById("fa-search");
		icon.classList.remove("fa-search");
		icon.classList.add("fa-times");*/
		
		$('.header-searchSection2').children('input').toggleClass('search-txt selected');	
		$('.header-searchTransitionGroup-Wrapper').find('i').toggleClass('fa-search fa-times');
		

		divToggle();
	});
	
});

function divToggle() {

	$('.header-transitionGroup-Wrapper').fadeToggle('1000');
	$('.header-searchTransitionGroup-Wrapper').fadeToggle('1000');

}