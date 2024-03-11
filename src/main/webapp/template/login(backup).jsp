<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
  <style>
    .container{margin:3em auto; border:1px solid lightgray;width:500px}
  </style>
</head>
<body>

 <div class="container">
	<form action="login_ok.jsp" method="post" class="border-light p-5" >
	 <p class="h4 mb-4 text-center">login</p>
	 <div class="form-group">
       <label for="id">id</label>
       <input type="text" class="form-control"  id="id" placeholder="Enter id"  name="id">
       	<%-- 아이디 쿠키가 존재시 해당 값을 아이디 필드에 설정 --%>
       	<% Cookie[] cookies = request.getCookies();
               if (cookies != null) {
                   for (Cookie cookie : cookies) {
                       if (cookie.getName().equals("rememberedId")) {
                           out.print("value=\"" + cookie.getValue() + "\"");
                       }
                   }
               }
        %>
    </div>
	<div class="form-group">
       <label for="pass">Password</label>
       <input type="password" class="form-control" id="pass" 
              placeholder="Enter password" name="passwd">
    </div>
	
	<div class="form-group custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input" 
               id="remember" name="remember" value="store">
        <label class="custom-control-label" for="remember">아이디 기억하기</label>
    </div>
       
	<button type="submit" class="btn btn-info my-4 btn-block">Submit</button>
	 
	</form>
	</div>
	
	<%
    String remember = request.getParameter("remember");
    if (remember != null && remember.equals("store")) {
        String rememberedId = request.getParameter("id");
        Cookie rememberedIdCookie = new Cookie("rememberedId", rememberedId);
        rememberedIdCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days
        response.addCookie(rememberedIdCookie);
    	}
	%>
</body>
</html>