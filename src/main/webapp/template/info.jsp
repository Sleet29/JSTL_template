<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <style>
        .container {
            margin-top: 3em;
        }

        table,
        h4 {
            text-align: center;
        }
        
        caption {
        text-align:center;
        font-weight:bold;
        caption-side:top;
        font-size: 1.5em;}
    </style>
</head>
<body>
    <%@ include file="top.jsp" %>
    <div class="container">
        <c:choose>
            <c:when test="${not empty temp}">
                <table class="table">
                    <caption>${temp.id}의 상세 정보</caption>
                    <thead>
                        <tr>
                            <th>항목</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>아이디</th>
                            <td>${temp.id}</td>
                        </tr>
                        <tr>
                            <th>주민번호</th>
                            <td>${temp.jumin}</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>${temp.email}</td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td>${temp.gender == 'm' ? '남자' : '여자'}</td>
                        </tr>
                        <tr>
                            <th>취미</th>
                            <td>${temp.hobby}</td>
                        </tr>
                        <tr>
                            <th>우편번호</th>
                            <td>${temp.post}</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>${temp.address}</td>
                        </tr>
                        <tr>
                            <th>자기소개</th>
                            <td>${temp.intro}</td>
                        </tr>
                        <tr>
                            <th>가입일</th>
                            <td>${temp.register_date}</td>
                        </tr>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h4>조회된 데이터가 없습니다.</h4>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        $(document).ready(function() {
            $(".deleteBtn").click(function() {
                var id = $(this).data("id");
                // 삭제 처리를 위한 코드 추가
                // 예를 들어, AJAX를 사용하여 서버로 삭제 요청을 보낼 수 있습니다.
            });
        });
    </script>
</body>
</html>
