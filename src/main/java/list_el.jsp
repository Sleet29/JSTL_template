<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ArrayList이용합니다.</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
.container {
	/* width: 500px; */
	margin-top: 3em
}

table, h4 {
	text-align: center
}
</style>
</head>
<body>
  <div class="container">
	<p>검색어를 입력하세요</p>  
     <input class="form-control" id="myInput" type="search" placeholder="Search..">
       <c:if test="${!empty list }">
		<table class="table table-striped">
		  <thead>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>직급</th>
				<th>매니저</th>
				<th>입사일자</th>
				<th>급여</th>
				<th>커미션</th>
				<th>부서번호</th>
			</tr>
		  </thead>
		  <tbody id="myTable">
				<c:forEach var="emp" items="${list }">
				<tr>
					<td>${emp.empno}</td>
					<td>${emp.ename}</td>
					<td>${emp.job}</td>
					<td>${emp.mgr}</td>
					<td>${emp.hiredate}</td>
					<td>${emp.sal}</td>
					<td>${emp.comm}</td>
					<td>${emp.deptno}</td>
				</tr>
				</c:forEach>
			</tbody>
		  </table>
		  </c:if>
		  
		  <c:if test="${empty list }">
		  	<h4>조회된 데이터가 없습니다.</h4>
		  </c:if>
  </div>
 <script>
	  $("#myInput").on("keyup", function() {
	    const value = $(this).val().toLowerCase();
	    $("#myTable tr").each(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
 </script>
</body>
</html>
