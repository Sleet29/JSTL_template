<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>idcheck.jsp</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
</head>
<body>
<div id="message"></div>
<button>버튼을 클릭해주세요</button>
<script>
    const message= ["사용 중인 아이디입니다.", "사용가능한 아이디입니다."]
    const color = ["red", "green"];
    const index = ${result + 1};
    $("#message").text(message[index]).css("color", color[index]);
    
    // 버튼을 클릭한 경우
    $("button").click(function() {
    	//opener : 현재 창을 열어준 창
    	$(opener.document).find("#opener_message")
    					  .text(message[index]).css('color',color[index]);
    	$(opener.document).find("#result").val('${result}');
    	window.close();
    })
</script>
</body>
</html>