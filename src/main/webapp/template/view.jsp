<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>유효성 결과 화면</title>
<style>
	table{margin:0 auto; width:500px; border-collapse:collapse}
	tr{border-bottom:1px solid gray; height:3em}
</style>
</head>
<body>
	<table>
		<tr><th>아이디</th><td><%=request.getAttribute("id") %> </td></tr>
		<tr><th>비밀번호</th><td><%=request.getAttribute("pass") %> </td></tr>
		<tr><th>주민번호</th><td><%=request.getAttribute("jumin") %> </td></tr>
		<tr><th>이메일</th><td><%=request.getAttribute("email") %> </td></tr>
		<tr><th>성별</th><td><%=request.getAttribute("gender") %> </td></tr>
		<tr><th>취미</th><td><%=request.getAttribute("hobby") %> </td></tr>
		<tr><th>우편번호</th><td><%=request.getAttribute("post1") %> </td></tr>
		<tr><th>주소</th><td><%=request.getAttribute("address") %> </td></tr>
		<tr><th>자기소개</th><td><%=request.getAttribute("intro") %> </td></tr>
	</table>
</body>
</html>