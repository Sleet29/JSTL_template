<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
<meta name="viewport" content ="width=device-width, initial-scale=1">
<link rel = "stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link href="${pageContext.request.contextPath}/css/join.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/validate.js"
	></script>
</head>
<body>
<jsp:include page="top.jsp"/>
<c:if test="${!empty temp }">
		<form name="myform" method="post" action="updateProcess.net" class="modal-content"
			  id="myform">
			  <div class="container">
			  	<fieldset>
			  		<legend>정보 수정</legend>
			  		<label for="id">ID</label>
			  		<div>
			  			<input type="text"
			  				   placeholder="Enter id" name="id" id="id" readOnly
			  				   value="${temp.id}" style="background: #ccc; width: 100%">
			  		</div>
			  		
			  		<label for="pass">Password</label>
			  		<input type="password" placeholder="Enter Password" name="pass" id="pass"
			  					value='${temp.password}'>	
			  					
			  		<label for="jumin1">주민번호</label>
			  		<input type="text" placeholder="주민번호 앞자리" maxLength="6"
			  			   name="jumin1" id="jumin1" value="${temp.jumin.substring(0,6)}">	
			  		<b> - </b>
            		<input type="text" placeholder="주민번호 뒷자리" maxLength="7" 
            			   name="jumin2" id="jumin2" value="${temp.jumin.substring(7)}">

		            <label for="email">E-Mail</label>
		            <input type="text" name="email" id="email" value='${temp.email.split("@")[0]}'> @
		            <input type="text" name="domain" id="domain" value='${temp.email.split("@")[1]}'>
		            
		            <select name="sel" id="sel">
		                <option value="">직접입력</option>
		                <option value="naver.com">naver.com</option>
		                <option value="daum.net">daum.net</option>
		                <option value="nate.com">nate.com</option>
		                <option value="gmail.com">gmail.com</option>
		            </select>
		
		            <label>성별</label>
		            <div class="container2">
		                <input type="radio" name="gender" value="m" id="gender1" onClick="return false"> 남자
		                <input type="radio" name="gender" value="f" id="gender2" onClick="return false"> 여자
		            </div>
		            <label>취미</label>
		            <div class="container2">
		                <input type="checkbox" name="hobby" id="hobby1" value="공부">공부
		                <input type="checkbox" name="hobby" id="hobby2" value="게임">게임
		                <input type="checkbox" name="hobby" id="hobby3" value="운동">운동
		                <input type="checkbox" name="hobby" id="hobby4" value="등산">등산
		                <input type="checkbox" name="hobby" id="hobby5" value="낚시">낚시
		            </div>
		
		<%--
					<label>성별</label>
					<div class="container2">
					    <input type="radio" name="gender" value="m" id="gender1" <c:if test="${temp.gender == 'm'}">checked</c:if>> 남자
					    <input type="radio" name="gender" value="f" id="gender2" <c:if test="${temp.gender == 'f'}">checked</c:if>> 여자
					</div>
					
					<label>취미</label>
					<div class="container2">
					    <input type="checkbox" name="hobby" id="hobby1" value="공부" <c:if test="${temp.hobby.contains('공부')}">checked</c:if>>공부
					    <input type="checkbox" name="hobby" id="hobby2" value="게임" <c:if test="${temp.hobby.contains('게임')}">checked</c:if>>게임
					    <input type="checkbox" name="hobby" id="hobby3" value="운동" <c:if test="${temp.hobby.contains('운동')}">checked</c:if>>운동
					    <input type="checkbox" name="hobby" id="hobby4" value="등산" <c:if test="${temp.hobby.contains('등산')}">checked</c:if>>등산
					    <input type="checkbox" name="hobby" id="hobby5" value="낚시" <c:if test="${temp.hobby.contains('낚시')}">checked</c:if>>낚시
					</div>
		--%>
		
		            <label for="post1">우편번호</label>
		            <input type="text" maxLength="5" name="post1" id="post1" value='${temp.post}'
		            		readOnly>
		            <input type="button" value="우편검색" id="postcode">
		
		            <label for="address">주소</label>
		            <input type="text" name="address" id="address"
		            		value="<c:out value='${temp.address}' />">
		
		            <label for="intro">자기소개</label>
		            <textarea rows="10" name="intro" id="intro" maxLength="100">${temp.intro}</textarea>
		
		            <div class="clearfix">
		                <button type="submit" class="signupbtn">Update</button>
		                <button type="reset" class="cancelbtn">Cancel</button>
		            </div>			
			  	</fieldset>
			  	<a href="templatetest.net">templatetest.jsp 이동하기</a><br><a
			  			href="javascript:history.back();">이전페이지로 이동하기</a>
			  	</div>
			  </form>
			 <script>
			 const gender = '${temp.gender}';
			 $("input[value=" + gender + "]").prop("checked",true); // 성별 체크
			 
			 
			 const hobbys = '${temp.hobby}'.split(',');
			 for (let i = 0; i < hobbys.length; i++)
				 $("input[value=" + hobbys[i] + "]").prop("checked",true);
			 </script>
			</c:if>
			<c:if test="${empty temp }">
				<h3 style="text-align:center;position:relative;top:3em;">해당 정보가 존재하지 않습니다.</h3>
			</c:if>
</body>
</html>