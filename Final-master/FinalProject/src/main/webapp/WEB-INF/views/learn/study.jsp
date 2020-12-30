<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="/resources/css/main.css">
 <link rel="stylesheet" href="/resources/css/learn/subjective.css"> 
 <link rel="stylesheet" href="/resources/css/learn/study.css">
  
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script src="/resources/js/learn.js"></script>

<style>

/*result페이지*/
.feedback-box {
	padding: 30px 0;
	border-bottom: 1px solid #f6f6f6;
	display: flex;
	flex-direction: row;
	font-weight: 600;
}

.feedback-box .feedback-description {
	flex: 1;
}

.feedback-box .feedback-count {
	padding: 0 40px;
}

.feedback-box .feedback-percentage {
	padding-left: 20px;
}

#rightResult {
	color: #1fab89;
}

.continueBtnBox {
	display: flex;
	padding-top: 40px;
	justify-content: center;
	
}

.continueBtnBox button {
	width: 70%;
	padding: 10px 0;
	border: none;
	border-radius: 0.25rem;
	background-color: #11d3bc;
	color: #fff;
	font-weight: 500;
	font-size: 14px;
}

/*오답 피드백*/
.wrongAns-feedback-box {
	padding: 30px 0;
	border-bottom: 1px solid #f6f6f6;
	display: flex;
	flex-direction: column;
}

.feedback-header {
	font-size: 18px;
}

.feedback-header i {
	color: #005792;
	font-size: 22px;
	padding-right: 8px;
}

.feedback-label {
	font-size: 13px;
	color: #4d606e;
}

.feedback-content {
	font-size: 19px;
	padding: 8px 0;		
}

#content-input {
	color: #ff6464;
}

#content-correct {
	color: #23b26d;	
}

/*최종 결과*/
.resetBtn {
	display: flex;
	padding-top: 40px;
	justify-content: center;
	
}

.resetBtn button {
	width: 70%;
	padding: 10px 0;
	border: none;
	border-radius: 0.25rem;
	background-color: #11d3bc;
	color: #fff;
	font-weight: 500;
	font-size: 14px;
}

.resultBox {
	padding: 10px 0;
	border-bottom: 1px solid #f6f6f6;
	display: flex;
	flex-direction: row;
	font-weight: 600;
	justify-content: space-between;
}

</style>	
<title>암기용 - 학습하기</title>
</head>
<body>

	<%@ include file="../includes/header.jsp"%>


	<div class="HomeLayout back-gray">
		<div class="HomeLayout-container-box">

			<div class="learn-sideBar">
			
				<div class="sideBar-backBtnBox">
					<i class="fas fa-angle-left"></i>세트로 돌아가기
				</div>

				<div class="sideBar-progressBox">
					<div class="progress-label">
						<label><i class="fas fa-book-open"></i>학습하기</label>
					</div>

					<div class="progress-contentWrapper">

						<div class="progress-contentBox">
							<div class="progressBar-label">
								<div class="label-countNum" id="progress-left"></div>
								<div class="label-description">남은카드</div>
								<div class="label-arrow"><i class="fas fa-arrow-down"></i></div><br/>								
							</div>
						</div>

						<div class="progress-contentBox">
							<div class="progressBar-label">
								<div class="label-countNum" id="progress-known"></div>
								<div class="label-description">익숙함<i class="fas fa-check"></i></div><br/>								
								<div class="label-arrow"><i class="fas fa-arrow-down"></i></div>															
							</div>
						</div>
						<div class="progress-contentBox">
							<div class="progressBar-label">
								<div class="label-countNum" id="progress-wellKnown"></div>				
								<div class="label-description">완전히 외움<i class="fas fa-check-double"></i></div>
							</div>
						</div>

					</div>				
				</div>
				<!-- /.progress -->				
				
				<div class="sideBar-resetBox">
					<button type="button" id="dataResetBtn">
						<i class="fas fa-sliders-h"></i>초기화하기
					</button>
				</div>				
				
			<!-- /.sidebar -->
			</div>
			<!-- 문제출력 -->
			<div class="learn-mainContent">
				
					<!-- 객관식 -->
					<div class="multipleQuestion" id="multipleQuestion">
						<div class="quizDiv">
						 <div class="question-prompt">
							<div class="question-text"></div>
							</div>
				      <div class="buttons" id="multipleAnswers">
			         <button class="btn" id="option1"></button>
			         <button class="btn" id="option2"></button>
			         <button class="btn" id="option3"></button>
			         <button class="btn" id="option4"></button>
				      </div> 
						</div>
					</div>
					
					<!-- 주관식 -->				
					<div class="subjectiveQuestion" id="subjectiveQuestion">
					<div class="quizDiv">					
						<div class="question-prompt">
							<div class="question-text"></div>
							<div class="question-dontKnow">
								<button type="button" id="dontKnowBtn">
									<span>모르겠어요</span>
								</button>
							</div>
						</div>
						<div class="question-answer">
							<form class="answerField">
								<div class="answerField-input">
									<textarea rows="1" class="subjective-answerArea" autofocus></textarea>
								</div>
								<div class="answerField-action">								
									<button type="submit" class="subjective-submitBtn">
										<span>정답</span>
									</button>
								</div>
							</form>
						</div>
					</div>
				<!-- /.quiz-div -->
			</div>
			<!-- /.learn-mainContent -->

		</div>		
	</div>
</div>

<script>
$(document).ready(function(){
	
	var WordJsonArray;	
	var WordCardArray;
	
	var LastCardArray = new Array();
	var KnownCardArray = new Array();
	var WellKnownCardArray = new Array();

	var cardIndex;
	
	var cardListLen;
	var lastCardLen;
	var knownCardLen;
	var wellknownCardLen;

	var meanArray = new Array();
	var optionArray = new Array();
	var random;
	var answer;
	
	var subjCount;
	var multiCount;

	function initData() 
	{	
		WordJsonArray =  JSON.parse('${WordDTO}');
		WordCardArray = WordJsonArray[0]["item"];
		
		subjCount, multiCount = 0;
		cardIndex = 0;
		cardListLen = WordCardArray.length;
		
		//MeanArray 생성
		getMeaningArray();		
		
		//이전데이터로 카드 나누기		
		sortInitCardArray();
		
		lastCardLen = LastCardArray.length;
		knownCardLen = KnownCardArray.length;
		wellknownCardLen = WellKnownCardArray.length;
	};

	
	//meaning만 들어있는 array생성
	function getMeaningArray(){
		for(i in WordCardArray)
		{
			x= WordCardArray[i].meaning;
			meanArray.push(x);
		}
		meanArray = Array.from(new Set(meanArray));
	};
	
	//지난 데이터 읽어오기	
	function sortInitCardArray()
	{
		
		for(i in WordCardArray)
		{
			cardIndex = i;
			var word = WordCardArray[i].word;
			var meaning = WordCardArray[i].meaning;
			var rate = WordCardArray[i].learningRate;
			
			if(rate == 1){
				moveWord(word, meaning, KnownCardArray);
			}
			else if(rate >=2){
				moveWord(word, meaning, WellKnownCardArray);
			}
			else{
				moveWord(word, meaning, LastCardArray);
			}
		}
	}
		
	//progress bar
	function showProgress() 
	{
		//남은카드		
		lastCardLen = LastCardArray.length;
		
		knownCardLen = KnownCardArray.length;
		wellknownCardLen = WellKnownCardArray.length;
		
		$('#progress-left').empty();
		$('#progress-left').append(lastCardLen);
		
		$('#progress-known').empty();
		$('#progress-known').append(knownCardLen);			
		
		$('#progress-wellKnown').empty();
		$('#progress-wellKnown').append(wellknownCardLen);				

	};//showProgress end	
	
	
	var selectIndex = 0; 
	
	//문제출력 control
	function selectQuestion()
	{
		showProgress();		
		
		if(lastCardLen == 0 && knownCardLen == 0){
			//더 이상 낼 문제가 없을경우
			showFinalResult();
		}
		else{
			if(isMatched()){
				//객관식 출력
				showMultipleQustion();
			}
			else {
				//주관식 출력
				showSubjQuestion();			
			}
		}	
	};
	
	function isMatched()
	{
		
		if(lastCardLen == 0){	return false;	}
		if(multiCount == 5){ multiCount =0; return false; }
		if(subjCount>=1 && subjCount <5){	return false;	}
		
		if(subjCount = 6){subjCount =0;}

		return true;
	};
	
	
	//객관식 문제, 보기 출력
	function showMultipleQustion()
	{
		$('.subjectiveQuestion').hide();
		$('.multipleQuestion').show();
		$('.btn').css({
			backgroundColor :'#fff',
			color: 'black'
		});
		
		if(lastCardLen !== 0)
			{
				cardIndex = Math.floor(Math.random() * LastCardArray.length);
				random = LastCardArray[cardIndex];
				var question = random.word;
				
				optionArray = [];
				optionArray.push(random.meaning);
				
				$('.question-text').empty();
				$('.question-text').append(question);
				
				//보기출력
				getRandomOption();
				
				$('.btn').empty();
				$('#option1').append(optionArray[0]);
				$('#option2').append(optionArray[1]);
				$('#option3').append(optionArray[2]);
				$('#option4').append(optionArray[3]);			
				
				$("button.btn").each(function(){
					var btnText = $(this).text();
					if(btnText == ''){
						$(this).remove();
					}
				});				
				multiCount +=1;
			}
		else {
			selectQuestion();
		}
	};
	
	var btn = document.querySelectorAll('.btn');
		
	function shuffle(a) 
	{ 
		var j, x, i; 
		for (i = a.length; i; i -= 1) { 
			j = Math.floor(Math.random() * i); 
			x = a[i - 1]; 
			a[i - 1] = a[j]; a[j] = x; 
			} 
	};	
	
	//랜덤으로 나머지 보기 3개 옵션 생성
	function getRandomOption()
	{
		if(meanArray.length < 4 ){
			optionArray = meanArray;		
		}else {
			var i = 0;			
			while(i<3){
				var option = meanArray[Math.floor(Math.random() * meanArray.length)];
				if(! sameOption(option)){
					optionArray.push(option);
					i++;
				}
			}	
		}
		shuffle(optionArray);
	};

	//3개 optionArray 중복 체크
	function sameOption(option)
	{
		for(var i = 0; i < optionArray.length; i++){
			if(option == optionArray[i])
				return true;
		}
		return false;
	}	
	
	//주관식 문제 출력
	function showSubjQuestion()		
	{
		$('.multipleQuestion').hide();

		$('.subjectiveQuestion').show();
		$('.subjective-answerArea').val('');
		$('.subjective-answerArea').focus();

		subjCount += 1;
		
		if(knownCardLen !== 0)
		{
			cardIndex = Math.floor(Math.random() * KnownCardArray.length);
			
			random = KnownCardArray[cardIndex];
			var question = random.word;

			$('.question-text').empty();
			$('.question-text').append(question);
		}			
		else
		{
			selectQuestion();
		}
	};

	//객관식 정답 확인
	$(document).on("click",".btn",function(e){
		e.preventDefault();
		answer = $(this).text();
		
		if (random.meaning == answer) {//정답일 때
	    	//Array에 추가 및 삭제
				moveWord(random.word, random.meaning, KnownCardArray);
				LastCardArray.splice(cardIndex,1);
				
				//학습률 올리기
				upRate(random.word);
				
				$(this).css({
					backgroundColor: '#17b978',
					color: '#fff'
				});
				
				setTimeout(function(){
					selectQuestion();
				},900);
							
      } else {//오답일 때
				feedbackWrongAns(answer);
      }
      optionArray = [];
  });
	
		
	//주관식 정답확인
	function checkCorrect()
	{
		var userAswer = $('.subjective-answerArea').val();		
		if(userAswer == random.meaning)
		{			
			//완전히 외움 Array에 추가하고 익숙함에서 삭제
			moveWord(random.word, random.meaning, WellKnownCardArray);
			KnownCardArray.splice(cardIndex,1);
			
			//학습률 올리기
			upRate(random.word);
			
			//문제출제 control
			selectQuestion();
		}
		else
		{
			//오답페이지 출력
			feedbackWrongAns(userAswer);
		}
	};
	

	//학습률 올리기
 	function upRate(answer){
			var obj = new Object();
			var wordId = WordJsonArray[0]["id"];
			var wordTitle = WordJsonArray[0]["title"];
			var upWord = answer;			
				
			obj.id = wordId;
			obj.title = wordTitle;
			obj.word = upWord;
			
			var jsonData = JSON.stringify(obj);
			
			$.ajax({
				type:"POST",
				dataType: "json",
				url: "/study/uprate",
				contentType:'application/json; charset=utf-8',
				data:jsonData
			});
		};
		
 
	//주관식 정답버튼
	var checkCorrectBtn = $('.subjective-submitBtn');
	checkCorrectBtn.on("click", function(e)
		{			
			e.preventDefault();
			checkCorrect();			
		});
	
	//계속하기 버튼
	$(document).on("click","#continueBtn",function(e){
		e.preventDefault();
		resetQuestionDiv();
		selectQuestion();
		
	});	
	
	//처음부터 다시하기 버튼
	$(document).on("click","#resetBtn",function(e){
		e.preventDefault();
		
		var obj = new Object();
		var wordId = WordJsonArray[0]["id"];
		var wordTitle = WordJsonArray[0]["title"];
			
		obj.id = wordId;
		obj.title = wordTitle;
		
		var jsonData = JSON.stringify(obj);
		
		$.ajax({
			type:"POST",
			dataType: "json",
			url: "/study/resetrate",
			contentType:'application/json; charset=utf-8',
			data:jsonData

			});	
	
		setTimeout(function(){
			window.location.reload();
		},300);
	});
	
	//모르겠어요 버튼
	$(document).on("click","#dontKnowBtn",function(e){
		e.preventDefault(); 
		var userAswer = $('.subjective-answerArea').val();
		feedbackWrongAns(userAswer);
	});
	
	//초기화 버튼
	$('#dataResetBtn').click(function(e){
		e.preventDefault(); 
		
		var confirm = window.confirm("정말 초기화 하시겠습니까?");
		
		if(confirm){
			var obj = new Object();
			var wordId = WordJsonArray[0]["id"];
			var wordTitle = WordJsonArray[0]["title"];
				
			obj.id = wordId;
			obj.title = wordTitle;
			
			var jsonData = JSON.stringify(obj);
			
			$.ajax({
				type:"POST",
				dataType: "json",
				url: "/study/resetrate",
				contentType:'application/json; charset=utf-8',
				data:jsonData
				});	
		
			setTimeout(function(){
				window.location.reload();
			},300);
		
			}				
	});
	
	//정답확인- enter
	$('.subjective-answerArea').keypress(function(e){
		if(e.keyCode == 13 && !e.shiftKey){
			e.preventDefault();
			checkCorrect();
		}
	});
	
	function moveWord(word, meaning, Array){
		Array.push({
			word : word,
			meaning : meaning			
		});
	}

	
	//문제페이지 다시 보이기
	function resetQuestionDiv(){
		$('.result-feedback').remove();
		$('.quizDiv').show();
	};
	

	//오답화면 출력
	function feedbackWrongAns(userAnswer)
	{
		var txt = '<div class="result-feedback">';
		if(userAnswer === undefined ){
			return '';
		}
		
		txt += '<div class="wrongAnsFeedback"><div class="feedback-header"><i class="far fa-tired"></i>';
		txt += '학습이 필요해요!</div>';
		txt += '<div class="feedback-boxs"><div class="wrongAns-feedback-box">';
		txt += '<div class="feedback-label">문제</div>';
		txt += '<div class="feedback-content">'+ random.word +'</div></div>';
		txt += '<div class="wrongAns-feedback-box">';
		txt += '<div class="feedback-label">입력하신 답</div>';
		txt += '<div class="feedback-content">'+ userAnswer +'</div></div>';
		txt += '<div class="wrongAns-feedback-box">';
		txt += '<div class="feedback-label">정답</div>';
		txt += '<div class="feedback-content" id="content-correct">'+ random.meaning +'</div></div>';
		txt += '</div>';
		txt += '<div class="continueBtnBox"><button id="continueBtn" type="button">계속하시려면 클릭하세요';
		txt += '</button></div>';
		
		$('.quizDiv').hide();
		$('.multipleQuestion').append(txt);
		$('.subjectiveQuestion').append(txt);	
	}; 
	
	
	//최종 결과 화면
	function showFinalResult(){
		showProgress()

		var txt = '<div class="finalResult">';

		for(i=0; i<wellknownCardLen;i++)
		{
			txt += '<div class="resultBox" id="rightResult">';
			txt += '<div class="feedback-word">'+WellKnownCardArray[i].word+'</div>';
			txt += '<div class="feedback-meaning">'+WellKnownCardArray[i].meaning+'</div></div>';
		}
		txt += '<div class="resetBtn"><button id="resetBtn" type="button">처음부터 다시하기</button>';
		txt += '</div></div>';
		
		$('.quizDiv').hide();
		$('.subjectiveQuestion').append(txt);
	}
	
	//초기실행
	initData();
	showProgress();
	selectQuestion();
	
});//end doc.ready 
</script>
</body>

</html>