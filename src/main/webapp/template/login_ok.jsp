<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인 처리</title>
</head>
<body>
<%
    // web.xml에 설정한 값을 가져옴
    String id = application.getInitParameter("id");
    String password = application.getInitParameter("password");

    // 입력한 아이디와 비밀번호 가져옴
    String inputid = request.getParameter("id");
    String inputpassword = request.getParameter("passwd");

    // 아이디와 비밀번호가 올바른지 확인합니다.
    if (id.equals(inputid) && password.equals(inputpassword)) {
        session.setAttribute("id", id);
%>
<script>
    alert('<%=id%>님 환영합니다.');
    location.href="templatetest.jsp";
</script>

<%
		String check_value = request.getParameter("remember");
		Cookie cookie = new Cookie("id", request.getParameter("id")); 
		
		// check_value != null 문장이 없다면 체크박스를 체크하지 않은 경우 check_value.equals("store") 문장에서 오류
		// if (check_value.equals("store")) // NullPointerException  
		// "아이디 기억하기"를 체크한 경우
		if (check_value != null && check_value.equals("store")) {
			//cookie.setMaxAge(60*60*24); // 쿠키의 유효시간을 24시간으로 설정합니다. 
			cookie.setMaxAge (2 * 60);    // 유효시간은 2분으로 설정합니다. 
			response.addCookie (cookie);
		} else {
			cookie.setMaxAge(0);
			response.addCookie(cookie); 
		}
		
	} else if (id.equals(inputid)) {

%>
<script>
    alert("비밀번호를 확인하세요.");
    history.back();
</script>
<%
    } else {
%>
<script>
    alert("아이디를 확인하세요.");
    history.back();
</script>
<%
    }
%>
</body>
</html>
