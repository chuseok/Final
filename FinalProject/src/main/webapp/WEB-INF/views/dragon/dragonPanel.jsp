<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="_csrf" content="${_csrf.token}">
  <meta name="_csrf_header" content="${_csrf.headerName}">
  <title>암기용-dragon</title>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/resources/css/dragon/dragonPanel.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  
</head>
<style type="text/css">
.bx-wrapper{
	text-align: center;
	border: 0px solid #fff;
    background: rgb(255 255 255 / 0%);
    box-shadow: 0 0 #ccc;
    height: 140px;
    margin-left: 50px;
    width: 80%;
}
.bx-wrapper li{
	margin: 0 auto;
}
.bx-wrapper img{
	margin: 0 auto;
}
.bx-pager{
	top: -20px;
    text-align: left !important;
    height: 10px;
}
.bxslider, .bxslider-background, .bxslider-dragon{
	margin-top: 30px;
}
.bxslider li, .bxslider-background li, .bxslider-dragon li{
 	vertical-align: middle;
    display: inline-block;
    height: 150px;
}
.bx-inner-style{
	background-color: #fbfbfb;
	width: 100px;
	border-radius: 15px;
}
.bx-inner-style:hover{
	cursor: pointer;
}
#slider-prev, #slider-prev-background, #slider-prev-dragon{
	width: 25px;
    position: absolute;
    top: 0;
    background: #00000040;
    height: 100%;
    text-align: center;
}
#slider-next, #slider-next-background, #slider-next-dragon{
	width: 25px;
    position: absolute;
    right: 0;
    background: #00000040;
    height: 100%;
    top: 0;
    text-align: center;
}
#slider-prev:hover, #slider-prev-background:hover, #slider-prev-dragon:hover{
	background: #00000080;
}
#slider-next:hover, #slider-next-background:hover, #slider-next-dragon:hover{
	background: #00000080;
}
#slider-prev i, #slider-prev-background i, #slider-prev-dragon i{
	line-height: 160px;
	font-size: 20px;
}
#slider-prev i:hover, #slider-prev-background i:hover, #slider-prev-dragon i:hover{
	color: white;
}
#slider-next i, #slider-next-background i, #slider-next-dragon i{
	line-height: 160px;
	font-size: 20px;
}
#slider-next i:hover, #slider-next-background i:hover, #slider-next-dragon i:hover{
	color: white;
}
</style>
<body>
  
<%@ include file="../includes/header.jsp" %>

  <div class="HomeLayout">
    <div class="HomeLayout-container">
    <%@ include file="../includes/sidebar.jsp" %>
    
  <section class="HomeLayout-main">
  	<div class="mainWrapper">
      <div class="mainContents">
    	<div id="panel">
    
			<div id="dragonBackground" style="background-image: url(${background.productImage})">
			<div id="overlay">
				<img alt="" src="../resources/images/icon/dead.svg">
				<h2>용이 죽었습니다!</h2>
				<div class="dead_btn">
					<button class="chooseDragon">다른 용 선택</button>
					<button id="reviveDragon">부활시키기</button>
				</div>
			</div>
			<c:if test="${noDragon}">
			<div id="alertNoDragon">
			<img alt="" src="../resources/images/icon/alertIcon.svg">
				<h2>용이 없습니다!</h2>
				<div class="noDragon_btn">
					<button class="goshop">구입하러 가기</button>
				</div>
			</div>
		</c:if>
		<div class="modal-wrapper">
		<div class="modal-dragon">
			<div class="content">
				<div class="card">
					<nav> 드래곤 선택
						<div class="chooseDragon">X</div>
					</nav>
					<form action="/dragon/delete">
					<div class="description">
						<c:forEach var="item" items="${dragonList}">
							<div class="costume-card-modal" data-id="${item.dragonId}">
								<div class="innerText">
									<img alt="" src="../resources/images/icon/dead.svg">
								</div>
								
								<div class="test" style="background-image: url(${item.img})"
									onclick="radioCheck(${item.dragonId})"></div>
							</div>
							<input type="radio" name="chooseDragon"
							value="${item.dragonId}" hidden="hidden">
						</c:forEach>
					
					</div>
					<div class="chooseEnd">
						<button type="submit">선택</button>
					</div>
					</form>	
				</div>
			</div>
		</div>
		</div>
			<section>

				<div class="pie_progress" role="progressbar" data-goal="50"
					data-barcolor="#3daf2c" data-barsize="30" aria-valuemin="0"
					aria-valuemax="100">
					<div class="pie_progress__content">LV ${values.totalLevel}</div>
				</div>
				<div class="row-content">
					<div>
						<img alt="이미지 없음" src="../resources/images/icon/chicken.svg" width="50px">
						<progress id="hungry_pro" value="${values.foodValue}" max="100"></progress>
					</div>
					<%-- <div>
					<img alt="이미지 없음" src="images/gamepad.svg" width="20px">
					<progress id="fun_pro" value="${fun}" max="100"></progress>
				</div> --%>
					<div class="coin">

						<img alt="이미지 없음" src="../resources/images/icon/coin.svg" width="30px">
						<p>${coin}</p>
					</div>

				</div>

			</section>

			<img src="${values.img}" id="dragon" width="200px" >
		</div>
		<div id="inventory">
				<div class="btn_array">
				<div id="slider-prev"><i class="fas fa-angle-left"></i></div>
				 <ul class="bxslider">
				 	<c:forEach var="item" items="${item}">
						<c:if test="${item.category eq 'item'}">
							<li class="button_item" data-des='${item.description}'
								value="${item.productId}" name="${item.productName}">
								<div class="bx-inner-style">
									<img alt="" src="${item.productImage}" width="50px"
									height="50px">
									<p>${item.productName}</p>
									<p class="cnt">수량 : ${item.cnt }</p>
								</div>
								
							</li>
						</c:if>
					</c:forEach>
				 </ul> 
				 <div id="slider-next"><i class="fas fa-angle-right"></i></div>
				 <!--  
					<c:forEach var="item" items="${item}">
						<c:if test="${item.category eq 'item'}">
							<button type="button" class="button_item" data-des='${item.description}'
								value="${item.productId}" name="${item.productName}">
								<img alt="" src="${item.productImage}" width="50px"
									height="50px">
								<p>${item.productName}</p>
								<p class="cnt">수량 : ${item.cnt }</p>
							</button>
						</c:if>

					</c:forEach> -->
				</div>
		</div>
		<div id="costume">
		<!-- 
		<div class="tab">
			<button class="tabLink" onclick="openTab(event,'inven-dg')" id="defaultOpen">
				<svg>
            		<use xlink:href="../resources/images/icon/dragon.svg#dragon">
          		</svg>
			</button>
			<button class="tabLink" onclick="openTab(event,'inven-background')">
				<svg>
            		<use xlink:href="../resources/images/icon/background.svg#background">
          		</svg>
			</button>
		</div>
 -->
			
			
			<!-- <div class="btn_array-costume" id="inven-dg"> -->
			<div id="slider-prev-dragon"><i class="fas fa-angle-left"></i></div>
			<ul class="bxslider-dragon">
				<c:forEach var="item" items="${dragonList}">
					<%-- <c:if test="${item.category eq 'egg'}"> --%>
						<li class="costume-card" data-id="${item.dragonId}">
							<div class="innerText">checked</div>
							<div class="test"
								style="background-image: url(${item.img})"></div>
						</li>
					<%-- </c:if> --%>
				</c:forEach>
			</ul>
			<div id="slider-next-dragon"><i class="fas fa-angle-right"></i></div>
			<!-- 
				<c:forEach var="item" items="${dragonList}">
					<%-- <c:if test="${item.category eq 'egg'}"> --%>
						<div class="costume-card" data-id="${item.dragonId}">
							<div class="innerText">checked</div>
							<div class="test"
								style="background-image: url(${item.img})"></div>
						</div>
					<%-- </c:if> --%>
				</c:forEach>
				-->
				<input type="hidden" class="selectedEgg" value="${selectedEgg}">
				
		</div>
		<div id="background">
			<div id="slider-prev-background"><i class="fas fa-angle-left"></i></div>
			<ul class="bxslider-background">
				<c:forEach var="item" items="${item}">
					<c:if test="${item.category eq 'background'}">
						<li class="costume-card" data-id="${item.productId}">
							<div class="innerText">checked</div>
							<div class="test"
								style="background-image: url(${item.productImage})"></div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
			<div id="slider-next-background"><i class="fas fa-angle-right"></i></div>
			<!--  
				<c:forEach var="item" items="${item}">
					<c:if test="${item.category eq 'background'}">
						<div class="costume-card" data-id="${item.productId}">
							<div class="innerText">checked</div>
							<div class="test"
								style="background-image: url(${item.productImage})"></div>
						</div>
					</c:if>
				</c:forEach>
				-->
			
		</div>
		
	</div>
	<nav class="tabbar">
      <div>
        <input id="button_inventory" type="radio" name="menu" checked>
        <label for="button_inventory">
          <svg>
            <use xlink:href="../resources/images/icon/inventory.svg#inventory">
          </svg>
          <span>Inventory</span>
        </label>
        <input id="button_dragon" type="radio" name="menu">
        <label for="button_dragon">
          <svg>
            <use xlink:href="../resources/images/icon/dragon.svg#dragon">
          </svg>
          <span>Dragon</span>
        </label>
        <input id="button_background" type="radio" name="menu">
        <label for="button_background">
          <svg>
            <use xlink:href="../resources/images/icon/background.svg#background">
          </svg>
          <span>Background</span>
        </label>
        <span></span>
      </div>
    </nav>
    </div>
    </div>
  </section>
</div>
</div>
<input type="hidden" value="${values.userId }" name="targetId"> 
<input type="hidden" value="${values.foodValue }" name="hungryValue"> 
<input type="hidden" value="${values.levelValue}" name="levelValue"> 
<input type="hidden" value="${values.totalLevel}" name="totalLevelValue">
<input type="hidden" name="dragonId" value="${values.dragonId }">

</body>

<script type="text/javascript" src="../resources/js/dragon/jquery-asPieProgress.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">

function radioCheck(id) {//modal에서 드래곤 선택 시 radio 자동 체크
	$("input[value="+id+"]").prop("checked", true);
	$("div").find(".costume-card-modal").css({"border": "none"});
	$("div").find("[data-id="+id+"]").css({"border": "3px solid red"});
}


	// Get the element with id="defaultOpen" and click on it
	//document.getElementById("defaultOpen").click();

function equip(id) {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");//security 설정
	$.ajax({
		url : '/dragon/equip',
		method : 'post',
		data:{"dragonId" : id, "lastId":$('.selectedEgg').val()},
		beforeSend:function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(data, textStatus, jqXHR) {
			console.log(data);
			//$('.selectedEgg').val(data.productId);
			//$('.selectedEgg').load(location.href+ " .selectedEgg");
			//$('#dragon').attr("src",data.productImage);
			location.reload();
			/* $('.pie_progress__content').val(data.totalLevel);
			$('.pie_progress__content').load(location.href+ " .pie_progress__content");
			$('#hungry_pro').val(data.foodValue);
			alert(data.foodValue);
			$('#hungry_pro').load(location.href+ " #hungry_pro"); */
			
		},
		error : function(jqXHR, exception) {
			console.log('Error occured!!');
		}
	});
}

function equipBackground(id) {//배경 변경 처리
	var data = {backgroundId : id,
			dragonId : $("input[name=dragonId]").val()};
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");//security 설정
	$.ajax({
		url : '/dragon/equip/background',
		method : 'post',
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8;",
		beforeSend:function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function(data, textStatus, jqXHR) {
			console.log(data);
			$('#dragonBackground').css({"background-image":"url("+data.productImage+")"});
			
		},
		error : function(jqXHR, exception) {
			console.log('Error occured!!');
		}
	});
}

jQuery(function($) {

	var bxslider = $('.bxslider').bxSlider({
		//controls: true,
		  minSlides: 1,
		  maxSlides: 4,
		  slideWidth: 130,
		  slideMargin: 10,
		  touchEnabled: false,
		  shrinkItems: true,
		  nextSelector: '#slider-next',  //다음으로 넘길 객체
          prevSelector: '#slider-prev',
		  nextText: '',
	      prevText: '',
	      infiniteLoop: false
		});
	var bxslider_background = $('.bxslider-background').bxSlider({
		//controls: true,
		  minSlides: 1,
		  maxSlides: 4,
		  slideWidth: 100,
		  slideMargin: 10,
		  touchEnabled: false,
		  shrinkItems: true,
		  nextSelector: '#slider-next-background',  //다음으로 넘길 객체
          prevSelector: '#slider-prev-background',
		  nextText: '',
	      prevText: '',
	      infiniteLoop: false
		});
	var bxslider_dragon = $('.bxslider-dragon').bxSlider({
		//controls: true,
		  minSlides: 1,
		  maxSlides: 4,
		  slideWidth: 100,
		  slideMargin: 10,
		  touchEnabled: false,
		  shrinkItems: true,
		  nextSelector: '#slider-next-dragon',  //다음으로 넘길 객체
          prevSelector: '#slider-prev-dragon',
		  nextText: '',
	      prevText: '',
	      infiniteLoop: false
		});
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");//security 설정
	
	if('<c:out value="${alert}"/>'){//로그아웃상태일시 차단
		document.location.href="/main";
		alert('로그인이 필요합니다!');
		return false;
	}
	if('${fn:length(dragonList)}'==1){
		$('.chooseEnd button').attr('disabled','true');
	}
	
	var i = $("input[name=levelValue]").val();
	
	$('.pie_progress').asPieProgress({
		namespace : 'pie_progress'

	});
	$('.pie_progress').asPieProgress('go', parseInt(i));

	//포만감 수치 0이 될 경우
	if($("input[name=hungryValue]").val()==0&&!<c:out value="${noDragon}"/>){
		$('#overlay').css('display','block');
		$('#button_inventory').prop('disabled', true);//하단 3개 버튼 비활성화 처리
		$('#button_costume').prop('disabled', true);
		$('#button_shop').prop('disabled', true);
	}
	
	//egg 선택 첫화면
	
	var selectedEgg = $('.selectedEgg').val();
	$("li[data-id='"+selectedEgg+"']").children('.innerText').css('visibility','visible');
	$("div[data-id='"+selectedEgg+"']").children('.innerText').css('visibility','visible');
	$("li[data-id='<c:out value="${background.productId}"/>']").children('.innerText').css('visibility','visible');
	
	
	
	$('#slider-prev').click(function(){ //이전 이미지 클릭 시
		bxslider.goToPrevSlide();
	    return false;
	    });
	$('#slider-next').click(function(){  //다음이미지 클릭 시
		bxslider.goToNextSlide();
	    return false;
	  });
	$('#slider-prev-background').click(function(){ //이전 이미지 클릭 시
		bxslider_background.goToPrevSlide();
	    return false;
	    });
	$('#slider-next-background').click(function(){  //다음이미지 클릭 시
		bxslider_background.goToNextSlide();
	    return false;
	  });
	$('#slider-prev-dragon').click(function(){ //이전 이미지 클릭 시
		bxslider_dragon.goToPrevSlide();
	    return false;
	    });
	$('#slider-next-dragon').click(function(){  //다음이미지 클릭 시
		bxslider_dragon.goToNextSlide();
	    return false;
	  });
	$(document).on('click', '.button_item', function() {
		var targetDiv = $("li[data-id='"+selectedEgg+"'] .test");
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");//security 설정
		var value = $(this).attr('value');
		$.ajax({
			url : '/product/use/'+value,
			method : 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(data, textStatus, jqXHR) {
				//var strArray = data.description.split(" ");
				//$("input[name=description]").html(data.description);
				//var val = $("input[name=description]").val();
				//$('#inventory').load(location.href+ " .btn_array,#banner_navi");//page 값 갱신
				$('li[value='+value+'] .cnt').text("수량 : "+data.cnt);
				if(data.cnt==0){
					//$('li[value='+value+']').css('display','none');
					$('li[value='+value+']').remove();
					bxslider.reloadSlider();
				}
				//init();
			},
			error : function(jqXHR, exception) {
				console.log('Error occured!!');
			}
		});
		
		var description = $(this).data("des");
		var strArray = description.split(" ");
		switch (strArray[0]) {
		case "포만감":
			var expression = $("input[name=hungryValue]").val()+strArray[1];
			$("input[name=hungryValue]").val(eval(expression));
			break;
		case "경험치":
			var expression = $("input[name=levelValue]").val()+strArray[1];
			$("input[name=levelValue]").val(eval(expression));
		default:
			break;
		}
		var levelValue = $("input[name=levelValue]").val();
		var level = $("input[name=totalLevelValue]").val();
		var hungry = $("input[name=hungryValue]").val();
		if($("input[name=levelValue]").val()>=100){
			$("input[name=levelValue]").val(0);
			$("input[name=totalLevelValue]").val(parseInt(level) + 1);
			$('.pie_progress').asPieProgress('reset');
		}
		
		$.ajax({
			url : '/dragon/dragonPanel',
			method : 'post',
			data: {userId:$("input[name=targetId]").val(),
				totalLevel : $("input[name=totalLevelValue]").val(),
				foodValue : $("input[name=hungryValue]").val(),
				levelValue : $("input[name=levelValue]").val(),
				coin : $('.coin p').text(),
				dragonId : $("input[name=dragonId]").val(),
				equip : true},
			dataType: "json",
			
			success : function(data, textStatus, jqXHR) {
				document.getElementById("hungry_pro").value = data.foodValue;//포만감 갱신
				$('.pie_progress').asPieProgress('go', data.levelValue);//레벨값 갱신
				$("input[name=totalLevelValue]").val(data.totalLevel);//총레벨값 갱신
				//$('.pie_progress__content').load(location.href+ " .pie_progress__content");//페이지 로드
				$('.pie_progress__content').html("LV "+data.totalLevel);
				$('#dragon').attr("src",data.img);//드래곤 이미지 갱신
				targetDiv.css({"background-image":"url("+data.img+")"}); //탭 안의 이미지 갱신
				bxslider.reloadSlider();
			},
			error : function(jqXHR, exception) {
				console.log('Error occured!!');
			}
		});
			
			$('#dragon').animate({'top':'-=20px'},'fast');
			$('#dragon').animate({'top':'+=20px'},'fast');
			
			
			
	});
/*
	$(document).on('click', '#button_shop', function() { //shop 탭 버튼
		location.href='../shop/shop';
	});

*/	
	
	$('#button_inventory').on('click', function() {//inventory 탭 버튼
		var chk = $('#costume').attr('style') === "display: block;"
		var chk_shop = $('#background').attr('style') === "display: block;"
		if (chk) {
			$('#costume').slideToggle();
		}
		if(chk_shop){
			$('#background').slideToggle();
		}
		$('#inventory').slideToggle();
		bxslider.reloadSlider();
	});
	$('#button_dragon').on('click', function() {//custome 탭 버튼
		var chk = $('#inventory').attr('style') === "display: block;"
		var chk_shop = $('#background').attr('style') === "display: block;"
		if (chk) {
			$('#inventory').slideToggle();
		}
		if(chk_shop){
			$('#background').slideToggle();
		}
		$('#costume').slideToggle();
		bxslider_dragon.reloadSlider();
	});
	$('#button_background').on('click', function() {//inventory 탭 버튼
		var chk = $('#costume').attr('style') === "display: block;"
		var chk_inven = $('#inventory').attr('style') === "display: block;"
		if (chk) {
			$('#costume').slideToggle();
		}
		if(chk_inven){
			$('#inventory').slideToggle();
		}
		$('#background').slideToggle();
		bxslider_background.reloadSlider();
	});
	$('#costume .costume-card').on('click', function() {//costume 선택 이벤트
		
		$('#costume .costume-card').children('.innerText').css('visibility','hidden');
		$(this).children('.innerText').css('visibility','visible');
		$(this).children('.test').css('border-radius','0px');
		equip($(this).data('id'));
	});
	$('#background .costume-card').on('click', function() {//costume 선택 이벤트
		
		$('#background .costume-card').children('.innerText').css('visibility','hidden');
		$(this).children('.innerText').css('visibility','visible');
		equipBackground($(this).data('id'));
	});
	$('#reviveDragon').on('click', function() {
		if(confirm("20000원으로 용을 부활시키겠습니까?")){
			if("<c:out value='${coin}'/>">20000){
				location.href = "/dragon/revive";
			}else{
				alert("금액이 부족합니다.")
			}
		}else{
			
			return;
		}
	});
	$('.chooseDragon').on('click', function() {
		$('.modal-wrapper').toggleClass('open');
		$('.page-wrapper').toggleClass('blur-it');

	});
	$('.goshop').on('click', function() {
		location.href='../shop/shop';
	});
	
});

</script>
</html>