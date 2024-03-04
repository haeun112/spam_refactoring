<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 전체 body 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        /* 헤더 스타일 */
        h2 {
            background-color: #007acc;
            color: #fff;
            padding: 20px 0;
            margin-top: 0;
        }

        /* 메시지 컨테이너 스타일 */
        p {
            font-size: 18px;
            margin: 20px;
        }

        /* 링크 스타일
        a {
            text-decoration: none;
            background-color: #007acc;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            margin: 20px;
            display: inline-block;
        } */

        /* 링크에 호버 효과 스타일 */
        a:hover {
            background-color: #233038;
        }
    </style>
</head>

<body>
    <h2>Find Password Result</h2>
    <c:if test="${notFound}">
        <p>Password not found for the provided ID and email.</p>
    </c:if>
    <c:if test="${notFound != true}">
        <p>비밀번호: ${foundPwd}</p>
    </c:if>
    <a href="/spam/member/i_login">로그인 하러 가기</a>
</body>

</html>