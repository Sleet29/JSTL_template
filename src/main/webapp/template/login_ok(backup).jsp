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
