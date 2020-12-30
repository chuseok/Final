<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
   integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
   crossorigin="anonymous">
   
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/get.css">
<script src="/resources/js/wordBook.js"></script>
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
                        <div class="FolderPageHeader-info">
                           <span><c:out value="${pageMaker.total}"/> sets</span>
                           
                           
                           <sec:authorize access="isAuthenticated()">
                              <span class="FolderPageHeader-byline">created by</span>
                              <span><sec:authentication property="principal.member.userName"/></span>
                           </sec:authorize>
                        </div>
                        <div class="DashboardHeaderTitle">
                           <i class="far fa-folder DashboardFolderIcon"></i>
                           <span class="DashboardHeaderTitle-title"><c:out value="${folder.folderTitle }"/></span>
                        </div>
                        <div class="DashboardHeaderActions">
                           <span class="MenuIconWithTooltip is-Popover is-Tooltip UIOverlayTrigger-target">
                              <span class="UIIconButton">
                                 
                                    <button class="UIButton" data-oper='add'>
                                    <span class="UIButton-wrapper">
                                    <i class="fas fa-plus"></i>
                                    </span>
                                    </button>
                              </span>
                           </span>
                           <span class="MenuIconWithTooltip is-Popover is-Tooltip UIOverlayTrigger-target">
                              <span class="UIIconButton">
                                    <button class="UIButton" data-oper='upload'>
                                    <span class="UIButton-wrapper">
                                       <i class="fas fa-upload"></i>
                                       </span>
                                    </button>
                              </span>
                           </span>
                           <span class="MenuIconWithTooltip is-bottomright is-Popover is-Tooltip UIOverlayTrigger-target">
                              <span class="UIIconButton">
                                 
                                    <button class="UIButton" data-oper='ellipsis'>
                                    <span class="UIButton-wrapper">
                                       <i class="fas fa-ellipsis-h"></i>
                                       </span>
                                    </button>
                                 </span>
                              </span>
                        </div>
                     </div>
                  </div>
                  
                  <div class="DashboardPage-main">
                     <div class="UIDiv FolderPageSetsView-sets">
                     </div>
                  </div>
               </div>
               </div>
         </section>
      </div>
   </div>
   
   <!-- add Modal -->
   
   
   <div class="modal fade" id="addModal" role="dialog"
      aria-labelledby="addModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
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
            
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.add Modal -->
   
   <!-- share Modal -->
   <div class="modal fade" id="shareModal" role="dialog"
      aria-labelledby="shareModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
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
                           <div class="UIInput-content">
                              <input class="UIInput-input" type="email"/>
                              <span class="UIInput-border"></span>
                           </div>
                           <span class="UIInput-label">
                              <span>SHARE LINK VIA EMAIL</span>
                           </span>
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
                           <div class="UITextarea-content">
                              <textarea rows="1" readonly class="UITextarea-textarea">http://localhost:8080/folders/get?folderId=<c:out value="${folder.folderId }"/></textarea>
                              <span class="UITextarea-border"></span>
                           </div>
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

    <div class="modal fade" id="RemoveModal" role="dialog" aria-labelledby="RemoveModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
            	<div class="modal-header">
               		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               		<h4 class="modal-title" id="RemoveModalLabel">Delete Folder</h4>
            	</div>
	            <div class="modal-body">
	            	<span>Are you sure Delete this folder?</span>
	            </div>
	            <div class="modal-footer">
	               <button type="button" id='modalDeleteBtn' class="btn btn-default" data-oper='remove'>Delete</button>
	               <button type="button" id='modalCloseBtn' class="btn btn-default"
	                  data-dismiss="modal">Close</button>
	            </div>
            </div>
  		</div>
    	<!-- /.modal-dialog -->
 	</div>
   	<!-- /.Remove Modal -->
   	
   	
   	
   
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
      var userIdValue = '';
      var userNameValue = '';
      <sec:authorize access="isAuthenticated()">
	      userIdValue = '<sec:authentication property="principal.member.userId"/>';
	      userNameValue = '<sec:authentication property="principal.member.userName"/>';
      </sec:authorize>
      
      if(!userIdValue) {
         userIdValue = '<c:out value="${pageMaker.cri.userId}"/>';
      } 
      
      var bookUL = $(".FolderPageSetsView-sets");
      console.log("showList");
      showList(1);
      var total = '<c:out value="${pageMaker.cri.pageNum}"/>';

      console.log('total : ' + total);
      
      showYourSets();
      function showList(page) {//폴더페이지에서 단어장 불러오기
         wordBookService.getList({folderId:folderIdValue, page:page||1, userId: userIdValue}, function(list) {
            console.log('getList!');
            var str="";
            if(list == null || list.length == 0) {
               bookUL.html("");
               console.log('getList is null');
               return;
            } else {
            	console.log('getList is not null, list length : ' + list.length);
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
               str += '<span class="UserLink-username">'+userNameValue+'</span></a></div></div></div>';
               str += '<div class="UIBaseCard-contextMenu">';
               str += '<button class="UIButton UIButton--borderless">';
               str += '<i class="fas fa-ellipsis-v"></i></button></div></div></div></div>';
               str += '</div>';
            }
            
            bookUL.html(str);
         });
      }
      
      //add modal에서 select 태그의 option value=yourSets 값 불러오기 
      function showYourSets() {
         
         var state = $('#AddSetsToClass option:selected').val();
         var setUL = $(".ToggleList");
         wordBookService.getYourSet(userIdValue, function(list){
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
                      str += '<input type="checkbox" class="UISwitch-input" id="toggle'+i+'">';
                      console.log('false.. list: ' + list[i].folderId + ', value : ' + folderIdValue);

                   }
                   str += '<label for="toggle'+i+'">';
                   str += '<i id="plus" class="fas fa-plus"></i>';
                   str += '<i id="minus" class="fas fa-minus"></i>';
                   str += '</label>';
                   str += '</div>';
                   str += '</div>';
                }
                
             } else if(state == 'classSets') {
                
             } else {
                
             }
             setUL.html(str);
         });
         
      }
      
      //add modal에서 select태그의 선택된 값이 바뀔 경우
      $('#AddSetsToClass').change(function() {
         <sec:authorize access="isAuthenticated()">
         var userIdValue = '<sec:authentication property="principal.member.userId"/>';
         </sec:authorize>
         showYourSets();
      });
      
      
      //add modal에서 폴더에 포함된 단어장 추가/삭제하기
      var bookIdValue = '';
      var checkbox = document.getElementsByClassName('.UISwitch-input');
      $(document).on('change', '.UISwitch-input', function(){
         var bookIdValue = $(this).parents('.ToggleListItem').find('input').first().val();
         
         if($(this).is(':checked')) {
              var wordBook = {
                  bookId : bookIdValue,
                  folderId : folderIdValue
            };
            wordBookService.updateFromFolder(wordBook, function(result) {
               showList(1);
            });
            
         } else {
            var wordBook = {
                  bookId : bookIdValue,
                  folderId : +0
            };
            wordBookService.updateFromFolder(wordBook, function(result) {
               showList(1);
            });
         }
      });
      
      
      //UIButton--borderless 처리, 폴더에 포함된 단어장 삭제하기
      var contextMenu = document.getElementById('contextMenu');
      
      $(document).on('click', '.UIButton--borderless', function(){
         showContextMenu();
         
         bookIdValue="";
         bookIdValue = $(this).parents('.UIBaseCard-inner').children('.UIBaseCard-header').children('.UIBaseCardHeader-info').find('input').val();
         document.addEventListener("click", function(e){
            if(!$(e.target).hasClass('menuItem')) {
               hideContextMenu();
            } else {
               hideContextMenu();
               var wordBook = {
                     bookId : bookIdValue,
                     folderId : +0
               };
               wordBookService.updateFromFolder(wordBook, function(result) {
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
   <sec:authorize access="isAuthenticated()">
   var userIdValue = '<sec:authentication property="principal.member.userId"/>';
   </sec:authorize>
   $(document).ready(function() {
	   $("button").on("click", function(e) {
		   e.preventDefault();
		   
		   var operation = $(this).data("oper");
            
           if(operation === 'add') {
        	   var modal = $('#addModal');
               $("#addModal").modal("show");
           } else if (operation ==='upload') {
        	   var modal = $('#shareModal');
               $("#shareModal").modal("show");
           } else if(operation === 'send') {
               var receiver = $('.UIInput-input').val();
               var subjectValue = "hi";
               
               var mail = {
                     to : receiver,
                     subject : subjectValue,
                     text : 'http://localhost:8080/folders/get?folderId=<c:out value="${folder.folderId }"/>&userId='+userIdValue
               };
               folderService.send(mail, function(result) {
                  alert(result);
                  
               });
            } else if(operation === 'copy') {
               var link = $('.UITextarea-textarea').select();
               
               document.execCommand('copy');
            }else if(operation ==='ellipsis'){
            	var modal = $('#RemoveModal');
	            $("#RemoveModal").modal("show");
            }else if(operation ==='remove'){
            	var folderId = '<c:out value="${folder.folderId}"/>';
            	folderService.remove(folderId, function(result){
	                alert('삭제되었습니다');
	                self.location="/folders/list";
            	});
         	};
      });
   });
   </script>

</body>
</html>