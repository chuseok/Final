<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="HomeLayout-sidebar">
		<div class="sidebar-navSection">
			<div class="sidenav-menuItem-home">
				<span class="UlmenuItem"> <a href="/main"> <span
						class="UlmenuItem-inner"> <i class="fas fa-home"></i>홈
					</span></a></span>
			</div>
			<div class="sidenav-menuItem">
				<span class="UlmenuItem"> <a href=""> <span
						class="UlmenuItem-inner"> <i class="fas fa-thumbs-up"></i>친구
							추천
					</span></a></span>
			</div>
			<div class="sidenav-menuItem">
				<span class="UlmenuItem"> <a href="../main/update"> <span
						class="UlmenuItem-inner"> <i class="fas fa-cog"></i>설정
					</span></a></span>
			</div>
		</div>

		<div class="sidebar-navSection">
			<div class="sidenav-menuItem">
				<span class="UlmenuItem"> <a href="/learn/list?id=<sec:authentication property="principal.member.userId"/>"> <span
						class="UlmenuItem-inner"> <i class="fas fa-th-large"></i>내 세트
					</span></a></span>
			</div>
			<div class="sidenav-menuItem">
				<span class="UlmenuItem"> <a href="/folders/list"> <span
						class="UlmenuItem-inner"> <i class="far fa-folder"></i>폴더
					</span></a></span>
			</div>
			<div class="sidenav-menuItem">
				<!-- addEventListener() -->
				<button class="UILink" id="createFolderButton">
					<span class="UlmenuItem-extend"> <!-- 					 	<span class="UlmenuItem-extend" onclick="showFolderModal();"> -->
						<span class="UlmenuItem-inner"> <i class="fas fa-plus"></i>폴더 만들기
					</span>
					</span>
				</button>

			</div>
		</div>
		
		<div class="sidebar-navSection">
      <div class="sidenav-menuItem">
        <span class="UlmenuItem">
          <a href="/dragon/dragonPanel">
            <span class="UlmenuItem-inner">
            <i class="fas fa-dragon"></i>용키우기</span></a></span>
      </div>
      <div class="sidenav-menuItem">
        <span class="UlmenuItem">
          <a href="/shop/shop">
            <span class="UlmenuItem-inner">
              <i class="fas fa-store"></i>상점</span></a></span>
      </div>
      <div class="sidenav-menuItem">
        <span class="UlmenuItem">
          <a href="/dragon/ranking">
            <span class="UlmenuItem-inner">
             <i class="fas fa-medal"></i>랭킹</span></a></span>
      </div>
    </div>

		<div class="sidebar-footer">
			<div class="social-icons">
				<i class="fab fa-twitter"></i> <i class="fab fa-instagram"></i> <i
					class="fab fa-facebook-f"></i>
			</div>
		</div>
	</section>
	<%@ include file="../folders/folderModal.jsp" %>
		<script>
		$(document).ready(function() {
			console.log('test folder..');
			var folderIdValue = '<c:out value="${folder.folderId}"/>';
			
			var modal = $('#folderModal');
			/* $(".modal").modal("show"); */
			var modalInputFolderTitle = modal.find("input[name='folderTitle']");
			var modalInputDescription = modal.find("input[name='description']");
			var modalInputLink = modal.find("input[name='link']");
	
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			//새 댓글 추가버튼
			$(".UILink").on("click", function(e) {
				console.log('create folder..');
				
				<sec:authorize access="isAuthenticated()">
				
					modal.find("input").val("");
					modal.find("button[id !='modalCloseBtn']").hide();
					modalRegisterBtn.show();
				modal.modal("show");
			</sec:authorize>
			});
			
			modalRegisterBtn.on("click", function(e) {
				console.log("modalRegisterBtn...");
				<sec:authorize access="isAuthenticated()">
				
				var userIdValue = '<sec:authentication property="principal.member.userId"/>';
				
				console.log('userIdValue: '+userIdValue);
				var folder = {
					folderTitle : modalInputFolderTitle.val(),
					description : modalInputDescription.val(),
					userId : userIdValue
				};
				folderService.add(folder, function(result) {
					/* alert(result); */
								
					modal.find("input").val();
					modal.modal("hide");
					location.href="/folders/list";
				});
				
				</sec:authorize>
			});
			
			console.log('${recentList}');
			
		});
	</script>
	<script src="/resources/js/folder.js"></script>
	
</body>
</html>