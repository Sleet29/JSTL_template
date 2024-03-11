<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
        .bg-dark {
            background-color: #28a745!important;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: rgb(255,255,255);
        }
</style>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="#">액션태그</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse flex-row-reverse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <c:if test="${!empty sessionScope.id }">
            <li class="nav-item"><a class="nav-link" > ${ id}님이 로그인 되었습니다.</a></li>
            <li class="nav-item"><a class="nav-link" href="update.net">정보수정 </a></li>
            <c:if test="${sessionScope.id=='admin'}">
            		<li class="nav-item"><a class="nav-link" href="list.net">(회원정보)</a></li>
            </c:if>
            <li class="nav-item"><a class="nav-link" href="logout.net">로그아웃</a></li>
          </c:if>
          
          <c:if test="${empty sessionScope.id}">
            <li class="nav-item"><a class="nav-link" href="login.net"> 로그인</a></li>
            <li class="nav-item"><a class="nav-link" href="join.net">회원가입 </a></li>
          </c:if>
        </ul>
    </div>
</nav>
</body>
</html>
