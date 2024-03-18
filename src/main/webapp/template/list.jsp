<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>list.jsp</title>
    <meta name="viewport" content ="width=device-width, initial-scale=1">
    <link rel = "stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<style>
.container{
	margin-top: 3em
}

table, h4 {
	text-align: center
}


</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div class="container">
		<c:if test="${!empty list }">
			<table class="table">
				<tbody>
				</tbody>
				<thead>
					<tr>
						<th>번호</th>
		                <th>ID</th>
		                <th>성별</th>
		                <th>취미</th>
		                <th>자기소개</th>
		                <th>가입일</th>
		                <th>삭제</th>
            		</tr>
            		</thead>
            		<tbody>
            			<c:forEach items="${list}" var="temp" varStatus="status">
            				<tr>
            					<td>${status.count}</td>
            					<td><a href="info.net?id=${temp.id}">${temp.id}</a></td>
            					<td>${temp.genderView}</td>
            					<td>${temp.hobby}</td>
            					<td><c:out value="${temp.intro}"/></td>
            					<td>${temp.register_date}</td>
            					<td><button class="btn btn-danger btn-sm">삭제</button></td>
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
            $("button").click(function(){
 				const answer=confirm("정말 삭제하시겠습니까?");           	
            	if (answer) {
            		const id=$(this).parent().parent().find(":nth-child(2)").text();
            		output = "<form action='delete.net' method=post>";
            		output += "<input name=id value=" + id + ">";
            		output += "<input type=submit>"
            		output += "</form>";
            		
            		$("body").append(output);
            		$('form').hide().submit();
            	} else {
            		alert('취소를 선택하셨습니다.');
            	}
            })
            
            const result = '${message}';
            if(result != '') {
            	alert(result);
            	<%session.removeAttribute("message"); %>
            }
            </script>	
</body>
</html> 					