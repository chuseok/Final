<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>list</title>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<link rel="stylesheet" href="../resources/css/list.css">
<link rel="stylesheet" href="/resources/css/main.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
	
<script src="/resources/js/folder.js"></script>
</head>
<body>

	<div class="HomeLayout">
		<div class="HomeLayout-container">
			<%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>
			<section class="HomeLayout-main">
				<div class="mainWrapper">
					<div class="mainContents">
						<div class="DashboardPage-header">
							<div class="DashboardHeader">
								<div class="ProfileHeader-avatarContainer">
									<span aria-label="Profile Picture" class="UserAvatar" role="img"></span>
								</div>
								<div class="ProfileHeader-mainContent">
									<div class="ProfileHeader-headline">
										<span class="ProfileHeader-username">
											<h2><sec:authentication property="principal.member.userId"/></h2>
										</span>
										<span class="ProfileHeader-userInfo">
											<span class="ProfileHeader-userFullName"><sec:authentication property="principal.member.userName"/></span>
										</span>
										
									</div>
								</div>
					
							</div>
						</div>
						<div class="DashboardPage-main">
						
						
							<div class="DashboardFeedControls is-showing">
								<div class="DashboardFeedControls-sort">
									<h6 class="UIHeading UIHeading--six"><span>Sort</span></h6>
									<div class="DashboardFeedControls-dropdown">
										<div class="UIDropdown">
											<select class="UIDropdown-select">
												<option value="recent">Latest</option>
												<option value="alphabetical">Alphabetical</option>
											</select>
										</div>
										
									</div>
								</div>
								<div class="DashboardFeedControls-filter">
									<input placeholder="Filter" class="UIInput-input">
									<span class="UIInput-border"></span>
								</div>
							</div>
							
							
							<div class="ProfileFoldersPage">
								<sec:authentication property="principal.member.userId" var="currentUserName"/>
								<c:forEach items="${list }" var="folder">
								<c:if test="${folder.userId eq currentUserName}">
								<div class="DashboardListItem">
								
									<a href="/folder/get?folderId=<c:out value='${folder.folderId }'/>&userId=${currentUserName }">
									<div class="UILinkBox">
										<div class="FolderPreview-cardByLineWrapper"></div>
										<header class="FolderPreview-cardHeader">
											<i class="far fa-folder"></i>
											<!-- <svg class="FolderPreview-icon" role="img"></svg> -->
											<span class="FolderPreview-cardHeaderTitle"><c:out value="${folder.folderTitle }"/></span>
										</header>
									</div>
									</a>
								</div>
								</c:if>
								
								</c:forEach>
							</div>
						</div>
						<!-- <div class="mainContents-recommand">
							<div class="recommand-cards">
								<div class="recommand-cardItem">카드1</div>
								<div class="recommand-cardItem">카드2</div>
							</div>
						</div> -->
						
						
					</div>
					<div class='pull-right'>
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a>
								</li>
								</c:if>
								
								<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':'' } "><a href="${num}">${num}</a>
								</li>
								</c:forEach>
								
								<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">Next</a>
								</li>
								</c:if>
							</ul>
                        </div> <!-- pull-right end -->
				</div>
				
                        
                        <form id='actionForm' action='/folder/list' method='get'>
                        	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
                        	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
                        	<input type='hidden' name='userId' value='${pageMaker.cri.userId }'>
                        </form>
			</section>
		</div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tableindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times</button>
					<h4 class="modal-title" id="myModalLabel">FOLDER</h4>
				</div>
				<div class="modal-body">
					
					<div class="form-group">
						<label>Folder Title</label> <input class="form-control" name='folderTitle'
							value='New Folder!!!!'>
					</div>
					<div class="form-group">
						<label>Description</label> <input class="form-control" name='description'
							value='description'>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id='modalRegisterBtn' class="btn btn-default">Resister</button>
					<button type="button" id='modalCloseBtn' class="btn btn-default"
						data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<script>
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
	</script>

	<script>
		$(document).ready(function() {
			
			var folderIdValue = '<c:out value="${folder.folderId}"/>';
			
			var modal = $('.fade');
			/* $(".modal").modal("show"); */
			var modalInputFolderTitle = modal.find("input[name='folderTitle']");
			var modalInputDescription = modal.find("input[name='description']");
			var modalInputLink = modal.find("input[name='link']");

			var modalRegisterBtn = $("#modalRegisterBtn");
			
			//새 댓글 추가버튼
			$(".UILink").on("click", function(e) {
				console.log('폴더 만들기..');
				
				<sec:authorize access="isAuthenticated()">
				
					modal.find("input").val("");
					modal.find("button[id !='modalCloseBtn']").hide();
					modalRegisterBtn.show();
				$(".fade").modal("show");
			</sec:authorize>
			});
			
			modalRegisterBtn.on("click", function(e) {
				console.log("modalRegisterBtn...");
				var userIdValue = '<sec:authentication property="principal.member.userId"/>';
				
				console.log('userIdValue: '+userIdValue);
				var folder = {
					folderTitle : modalInputFolderTitle.val(),
					description : modalInputDescription.val(),
					userId : userIdValue
				};
				folderService.add(folder, function(result) {
					alert(result);
								
					modal.find("input").val();
					modal.modal("hide");
					location.reload();
				});
			});
		});
	</script>
</body>
</html>