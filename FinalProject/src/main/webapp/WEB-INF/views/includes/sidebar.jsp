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
						class="UlmenuItem-inner"> <i class="fas fa-search"></i>다이어그램
							찾아보기
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
				<span class="UlmenuItem"> <a href="/folder/list"> <span
						class="UlmenuItem-inner"> <i class="far fa-folder"></i>폴더
					</span></a></span>
			</div>
			<div class="sidenav-menuItem">
				<!-- addEventListener() -->
				<button class="UILink">
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
	<script src="/resources/js/folder.js"></script>
	
</body>
</html>