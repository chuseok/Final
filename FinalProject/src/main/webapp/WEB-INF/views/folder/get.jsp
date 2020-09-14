<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/main.css">

<link rel="stylesheet" href="../resources/css/get.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="/resources/js/wordBook.js"></script>
<script src="/resources/js/folder.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<div class="HomeLayout">
		<div class="HomeLayout-container">
			<%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>

			<section class="HomeLayout-main">
				<div class="mainWrapper">
					<div class="mainContents">
						<div class="DashboardPage-header">
							<div class="DashboardHeader">
								<div class="FolderPageHeader-info">
									<span>0 sets</span>
									<span class="FolderPageHeader-byline">created by</span>
									<span><sec:authentication property="principal.member.userName"/></span>
								</div>
								<div class="DashboardHeaderTitle">
<!-- 									<i class="far fa-folder DashboardFolderIcon"></i>
 -->									<i class="far fa-folder DashboardFolderIcon"></i>
									<span class="DashboardHeaderTitle-title"><c:out value="${folder.folderTitle }"/></span>
								</div>
								<div class="DashboardHeaderActions">
									<span class="MenuIconWithTooltip is-Popover is-Tooltip UIOverlayTrigger-target">
										<span class="UIIconButton">
											
												<button class="UIButton" data-oper='add'>
												<span class="UIButton-wrapper">
												<i class="far fa-plus"></i>
												</span>
												</button>
											
											
										</span>
										
									</span>
									<span class="MenuIconWithTooltip is-Popover is-Tooltip UIOverlayTrigger-target">
										<span class="UIIconButton">
											
												<button class="UIButton" data-oper='upload'>
												<span class="UIButton-wrapper">
													<i class="far fa-upload"></i>
													</span>
												</button>
											
										</span>
									
									</span>
									<span class="MenuIconWithTooltip is-bottomright is-Popover is-Tooltip UIOverlayTrigger-target">
										<span class="UIIconButton">
											
												<button class="UIButton" data-oper='ellipsis'>
												<span class="UIButton-wrapper">
													<i class="far fa-ellipsis-h"></i>
													</span>
												</button>
											</span>
										</span>
									</span>
								</div>
							</div>
						</div>
						
						<div class="DashboardPage-main">
							<!-- <div class="DashboardFeedControls is-showing">
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
							</div> -->
							
							<div class="UIDiv FolderPageSetsView-sets">
								<div class="UISetCard">
								<div class="UIDiv UIBaseCard UIBaseCard--noLinkBox" data-bookId='11'>
									<div class="UIDiv UIBaseCard-inner">
										<div class="UIBaseCard-header">
											<div class="UIBaseCardHeader-info">
												<a class="UILink UILink--revert" href=""><h4 class="UIHeading UIHeading--four">test1</h4></a>
												<div class="UIBaseCardHeader-meta">160 terms</div>
											</div>
										</div>
										<div class="UIDiv UIBaseCard-footer">
											<div class="UserLink">
												<div class="UserLink-inner">
													<div class="UserLink-avatar">
														<a class="UILink" href="">
															<span class="UserAvatar" role="img"></span>
														</a>
													</div>
													<div class="UserLink-content">
														<a class="UILink" href="">
															<span class="UserLink-username">chuseok</span>
														</a>
													</div>
												</div>
											</div>
											<div class="UIBaseCard-contextMenu">
												<button class="UIButton UIButton--borderless">
													<i class="far fa-ellipsis-v"></i>
												</button>
											</div>
										</div>
										
									</div>
								</div>
								</div>
								
								<div class="UIDiv UIBaseCard UIBaseCard--noLinkBox">
									<div class="UIDiv UIBaseCard-inner">
										<div class="UIBaseCard-header">
											<div class="UIBaseCardHeader-info">
												<a class="UILink UILink--revert" href=""><h4 class="UIHeading UIHeading--four">test2</h4></a>
												<div class="UIBaseCardHeader-meta">160 terms</div>
											</div>
										</div>
										<div class="UIDiv UIBaseCard-footer">
											<div class="UserLink">
												<div class="UserLink-inner">
													<div class="UserLink-avatar">
														<a class="UILink" href="">
															<span class="UserAvatar" role="img"></span>
														</a>
													</div>
													<div class="UserLink-content">
														<a class="UILink" href="">
															<span class="UserLink-username">chuseok</span>
														</a>
													</div>
												</div>
											</div>
											<div class="UIBaseCard-contextMenu">
												<button class="UIButton UIButton--borderless">
													<i class="far fa-ellipsis-v"></i>
												</button>
											</div>
										</div>
										
									</div>
								</div>
								
								<div class="UIDiv UIBaseCard UIBaseCard--noLinkBox">
									<div class="UIDiv UIBaseCard-inner">
										<div class="UIBaseCard-header">
											<div class="UIBaseCardHeader-info">
												<a class="UILink UILink--revert" href=""><h4 class="UIHeading UIHeading--four">test3</h4></a>
												<div class="UIBaseCardHeader-meta">160 terms</div>
											</div>
										</div>
										<div class="UIDiv UIBaseCard-footer">
											<div class="UserLink">
												<div class="UserLink-inner">
													<div class="UserLink-avatar">
														<a class="UILink" href="">
															<span class="UserAvatar" role="img"></span>
														</a>
													</div>
													<div class="UserLink-content">
														<a class="UILink" href="">
															<span class="UserLink-username">chuseok</span>
														</a>
													</div>
												</div>
											</div>
											<div class="UIBaseCard-contextMenu">
												<button class="UIButton UIButton--borderless">
													<i class="far fa-ellipsis-v"></i>
												</button>
											</div>
										</div>
										
									</div>
								</div>
								
							</div>
						</div>
					</div>
			</section>
		</div>
	</div>
	
	
	<!-- add Modal -->
	
	
	<div class="modal fade" id="addModal" tableindex="-1" role="dialog"
		aria-labelledby="addModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times</button>
					<h4 class="modal-title" id="addModalLabel">Add a set</h4>
				</div>
				<div class="modal-body">
					<div class="form-group create-set">
						<a aria-label="+ Create a new set" class="UILinkButton" href="/word/wordList" role="button">
							<span>+ Create a new set</span>
						</a>
					</div>
					<div class="form-group">
						<select aria-label="AddSetsToClass" class="UIDropdown-select" id="AddSetsToClass">
							<option value="yourSets" selected>Your sets</option>
							<option value="classSets">Class sets</option>
							<option value="studiedSets">Studied sets</option>
							
						</select>
					</div>
					<div class="form-group">
						<div class="ToggleList">
						
						</div>
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
	<!-- /.add Modal -->
	
	
	<!-- share Modal -->
	<div class="modal fade" id="shareModal" tableindex="-1" role="dialog"
		aria-labelledby="shareModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times</button>
					<h4 class="modal-title" id="shareModalLabel">Share this folder</h4>
				</div>
				<div class="modal-body">
					<div class="ShareModalOptions">
						<div class="UIDiv ShareModalOptions-row">
							<div class="ShareModalOptions-button">
								<button class="UIButton" type="button" data-oper='send'>
									<span class="UIButton-wrapper">
										<span>Send email</span>
									</span>
								</button>
							</div>
							<div class="ShareModalOptions-input">
								<label class="UIInput">
									<div class="UIInput-content">
										<input class="UIInput-input" type="email"/>
										<span class="UIInput-border"></span>
									</div>
									<span class="UIInput-label">
										<span>SHARE LINK VIA EMAIL</span>
									</span>
								</label>
							</div>
						</div>
						
						<div class="UIDiv UIModalBodySeparator">
							<hr class="UIHorizontalRule">
						</div>
						
						<div class="UIDiv ShareModalOptions-row">
							<div class="ShareModalOptions-button">
								<button class="UIButton" type="button" data-oper='copy'>
									<span class="UIButton-wrapper">
											<span>Copy link</span>
										</span>
								</button>
							</div>
							<div class="ShareModalOptions-textarea">
								<label class="UITextarea" aria-readonly="true">
									<div class="UITextarea-content">
										<textarea rows="1" readonly variant="default" class="UITextarea-textarea">http://localhost:8080/folder/get?folderId=<c:out value="${folder.folderId }"/></textarea>
										<span class="UITextarea-border"></span>
									</div>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.share Modal -->
	
	
	<div class="temp" oncontextmenu="return showContextMenu();">
		<div id="contextMenu" class="context-menu">
			<ul>
				<li class="menuItem">remove</li>
				<li class="separator"></li>
			</ul>
		</div>
		
	</div>
	
	
	<script>
		var contextMenu = document.getElementById('contextMenu');
	
		function showContextMenu(event) {
			contextMenu.style.display = "block";
			contextMenu.style.left = event.clientX + 'px';
			contextMenu.style.top = event.clientY + 'px';
			return false;
		}
	</script>

	<script>
	
	$(document).ready(function() {
		var folderIdValue = '<c:out value="${folder.folderId}"/>';
		
		var bookUL = $(".FolderPageSetsView-sets");
		
		showList(1);
		showYourSets();
		function showList(page) {//폴더페이지에서 가지고 있는 단어장을 보여줌
			wordBookService.getList({folderId:folderIdValue, page:page||1}, function(list) {
				
				var str="";
				if(list == null || list.length == 0) {
					bookUL.html("");
					
					return;
				}
				for(var i=0, len = list.length || 0; i < len; i++) {
					str += '<div class="UISetCard">';
					str += '<div class="UIDiv UIBaseCard UIBaseCard--noLinkBox" data-bookId="'+list[i].bookId+'">';
					str += '<div class="UIDiv UIBaseCard-inner">';
					str += '<div class="UIBaseCard-header">';
					str += '<div class="UIBaseCardHeader-info">';
					str += '<input type="hidden" name="aaa" value="'+list[i].bookId+'">';
					str += '<a class="UILink UILink--revert" href=""><h4 class="UIHeading UIHeading--four">'+list[i].wordTitle+'</h4></a>';
					str += '<div class="UIBaseCardHeader-meta">160 terms</div>';
					str += '</div>';
					str += '</div>';
					str += '<div class="UIDiv UIBaseCard-footer">';
					str += '<div class="UserLink">';
					str += '<div class="UserLink-inner">';
					str += '<div class="UserLink-avatar">';
					str += '<a class="UILink" href="">';
					str += '<span class="UserAvatar" role="img"></span></a>';
					str += '</div>';
					str += '<div class="UserLink-content">';
					str += '<a class="UILink" href="">';
					str += '<span class="UserLink-username">chuseok</span></a></div></div></div>';
					str += '<div class="UIBaseCard-contextMenu">';
					str += '<button class="UIButton UIButton--borderless">';
					str += '<i class="far fa-ellipsis-v"></i></button></div></div></div></div>';
					str += '</div>';
				}
				
				bookUL.html(str);
			});
		}
		
		function showYourSets() {
			var wordIdValue = 'hansol';
			var state = $('#AddSetsToClass option:selected').val();
			var setUL = $(".ToggleList");
			wordBookService.getYourSet(wordIdValue, function(list){
				var str="";
				
				if(list == null || list.length == 0) {
					setUL.html("");
					
					return;
				}
				
				for(var i=0, len = list.length || 0; i < len; i++) {
					/* if(list[i].folderId==folderIdValue) {
						console.log(list[i].folderId+'와 ' + folderIdValue + '는 같음.');
					} */
					str += '<div class="ToggleListItem">';
					str += '<div class="ToggleInclusionCard-heading">';
					str += '<h4>'+list[i].wordTitle+'</h4>';
					str += '<input type="hidden" value="'+list[i].bookId+'"></input>';
					str += '</div>';
					str += '<div class="ToggleInclusionCard-toggle">';
					if(list[i].folderId==folderIdValue) {
						str += '<input type="checkbox" class="UISwitch-input" id="toggle'+i+'" checked="true">';
						console.log('true.. list: ' + list[i].folderId + ', value : ' + folderIdValue);

					} else {
						str += '<input type="checkbox" class="UISwitch-input" id="toggle'+i+'">';
						console.log('false.. list: ' + list[i].folderId + ', value : ' + folderIdValue);

					}
					str += '<label for="toggle'+i+'">';
					str += '<i id="plus" class="far fa-plus"></i>';
					str += '<i id="minus" class="far fa-minus"></i>';
					str += '</label>';
					str += '</div>';
					str += '</div>';
					
					
				 	/* if(list[i].folderId==folderIdValue) {
						$('#toggle'+i).attr('checked',true);
						console.log('true!!');
					}*/
				}
				setUL.html(str);
			});
			
		}
		
		$('#AddSetsToClass').change(function() {//add a set에서 your sets select 값
			var wordIdValue = 'hansol';
			var state = $('#AddSetsToClass option:selected').val();
			var setUL = $(".ToggleList");
			
			wordBookService.getYourSet(wordIdValue, function(list){
				var str="";
				
				if(list == null || list.length == 0) {
					setUL.html("");
					
					return;
				}
				
				if(state =='yourSets') {
					for(var i=0, len = list.length || 0; i < len; i++) {
						str += '<div class="ToggleListItem">';
						str += '<div class="ToggleInclusionCard-heading">';
						str += '<h4>'+list[i].wordTitle+'</h4>';
						str += '<input type="hidden" value="'+list[i].bookId+'"></input>';
						str += '</div>';
						str += '<div class="ToggleInclusionCard-toggle">';
						if(list[i].folderId==folderIdValue) {
							str += '<input type="checkbox" class="UISwitch-input" id="toggle'+i+'" checked="checked">';
							console.log('true.. list: ' + list[i].folderId + ', value : ' + folderIdValue);

						} else {
							str += '<input type="checkbox" class="UISwitch-input" id="toggle'+i+'" checked="unchecked">';
							console.log('false.. list: ' + list[i].folderId + ', value : ' + folderIdValue);

						}
						str += '<label for="toggle'+i+'">';
						str += '<i id="plus" class="far fa-plus"></i>';
						str += '<i id="minus" class="far fa-minus"></i>';
						str += '</label>';
						str += '</div>';
						str += '</div>';
					}
					
				} else if(state == 'classSets') {
					
				} else {
					
				}
				setUL.html(str);
			});
		});
		
		/* modal check change event */
		var bookIdValue = '';
		var checkbox = document.getElementsByClassName('.UISwitch-input');
		$(document).on('change', '.UISwitch-input', function(){
			var bookIdValue = $(this).parents('.ToggleListItem').find('input').first().val();
			
			
			if($(this).is(':checked')) {
				/* alert(bookIdValue); */
				console.log("체크");
	 	 		var wordBook = {
						bookId : bookIdValue,
						folderId : folderIdValue
				};
				wordBookService.updateFromFolder(wordBook, function(result) {
					alert(result);
					showList(1);
				});
				
			} else {

				console.log("체크해제");
				alert(bookIdValue);
				var wordBook = {
						bookId : bookIdValue,
						folderId : +0
				};
				wordBookService.updateFromFolder(wordBook, function(result) {
					/* alert(result); */
					showList(1);
				});
				
			}
			
		});
		
		
		
		/* contextMenu 처리 =====================================*/
		
		
		var contextMenu = document.getElementById('contextMenu');
		/* window.onclick = hideContextMenu; */
		/*window.onkeydown = listenKeys; */
		
		$(document).on('click', '.UIButton--borderless', function(){
			showContextMenu();
			
			bookIdValue="";
			bookIdValue = $(this).parents('.UIBaseCard-inner').children('.UIBaseCard-header').children('.UIBaseCardHeader-info').find('input').val();
			document.addEventListener("click", function(e){
				if(!$(e.target).hasClass('menuItem')) {
					hideContextMenu();
				} else {
					/* alert('클릭했다.'); */
					hideContextMenu();
					var wordBook = {
							bookId : bookIdValue,
							folderId : +0
					};
					wordBookService.updateFromFolder(wordBook, function(result) {
						alert(result);
						showList(1);
						showYourSets();
					});
				}
				this.removeEventListener("click",arguments.callee);
			});
		});
		function showContextMenu() {
			contextMenu.style.display = "block";
			contextMenu.style.left = event.clientX + 'px';
			contextMenu.style.top = event.clientY + 'px';
			
		}
		function hideContextMenu() {
			contextMenu.style.display = 'none';
			
		}
		function listenKeys(event) {
			var keyCode = event.which || event.keyCode;
			if(keyCode ==27) {
				hideContextMenu();
			}
		}
	});
	</script>
	
	<script>
		$(document).ready(function() {
			var contextMenu = document.getElementById('contextMenu');
			
			$(document).on('click', '.UIButton--borderless', function(){
				showContextMenu();
				
				document.addEventListener("click", function(e){
					if(!$(e.target).hasClass('menuItem')) {
						hideContextMenu();
						
					} else {
						/* showList(1); */
						/* alert('ccc'); */
						hideContextMenu();
					}
					this.removeEventListener("click",arguments.callee);
				});
			});
			
			function showContextMenu() {
				contextMenu.style.display = "block";
				contextMenu.style.left = event.clientX + 'px';
				contextMenu.style.top = event.clientY + 'px';
				
			}
			function hideContextMenu() {
				
				contextMenu.style.display = 'none';
			}
			function listenKeys(event) {
				var keyCode = event.which || event.keyCode;
				if(keyCode ==27) {
					hideContextMenu();
				}
			}
		});
	</script>
	<script>
		$(document).ready(function() {
			$("button").on("click", function(e) {
				e.preventDefault();
				
				var operation = $(this).data("oper");
				console.log(operation);
				
				if(operation === 'add') {
					var modal = $('#addModal');
					$("#addModal").modal("show");
					/* alert("add"); */
				} else if (operation ==='upload') {
					var modal = $('#shareModal');
					$("#shareModal").modal("show");
					/* alert('upload'); */
				} else if(operation === 'send') {
					var receiver = $('.UIInput-input').val();
					/* alert(receiver); */
					var subjectValue = "hi";
					var mail = {
							to : receiver,
							subject : subjectValue
					};
					folderService.send(mail, function(result) {
						alert(result);
						/* alert('메일이 전송되었습니다.'); */
						
					});
				} else if(operation === 'copy') {
					var link = $('.UITextarea-textarea').select();
					console.log(link.value);
					
					document.execCommand('copy');

				}
			});
		});
	</script>

</body>
</html>