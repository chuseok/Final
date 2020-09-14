<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
    <nav class="header-navbar">
      <div class="header-logo">
        <a href="/main/home1">암기용</a>        
      </div>
      <div class="header-transitionGroup-Wrapper">

        <div class="header-searchSection">
          <button><i class="fas fa-search"></i> 찾아보기</button>
        </div>

        <div class="header-createSection">
          <a href="">
            <i class="fas fa-folder-plus"></i>만들기
          </a>
        </div>

        <div class="header-userSection">
          <div class="userInfo">
            <span class="user-avatar"></span>
            
            <span class="user-name">
              <sec:authorize access="isAnonymous()">
               <a href="/customLogin">로그인</a>
              </sec:authorize></span>
              <span class="user-name">
              <sec:authorize access="isAnonymous()">
               <a href="../main/join">회원가입</a>
              </sec:authorize></span>
              
               <span class="user-name">
              <sec:authorize access="isAuthenticated()">
              <sec:authentication property="principal.member.userName"/>님
              </sec:authorize></span>
            <span class="user-name">
              <sec:authorize access="isAuthenticated()">
                             <a href="/customLogout">로그아웃</a>
              </sec:authorize></span>
          </div>
        </div>
      </div>
    </nav>
  </header>

</body>
</html>