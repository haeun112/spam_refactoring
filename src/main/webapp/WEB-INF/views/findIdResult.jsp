<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        /* Reset some default browser styles */
        body,
        h2,
        p,
        ul,
        li,
        a {
            margin: 0;
            padding: 0;
        }

        /* Apply some basic styling to the body */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }

        /* Style the header */
        h2 {
            background-color: #007acc;
            color: #fff;
            padding: 20px 0;
        }

        /* Style the result messages */
        p {
            margin-top: 20px;
            font-size: 18px;
        }

        /* Style the list of found IDs */
        ul {
            list-style-type: none;
            margin-top: 20px;
            padding: 0;
        }

        /* Style list items */
        li {
            font-size: 16px;
            margin-bottom: 10px;
        }

        /* Style links */
        a {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #007acc;
            font-size: 18px;
        }

        /* Hover effect for links */
        a:hover {
            text-decoration: underline;
            color: #005d9f;
        }
    </style>
</head>

<body>
    <h2>아이디 찾기 결과</h2>
    <c:if test="${notFound}">
        <p>일치하는 아이디가 없습니다.</p>
    </c:if>
    <c:if test="${!notFound}">
        <p>일치하는 아이디 목록:</p>
        <ul>
            <c:forEach items="${foundId}" var="id">
                <li>${id}</li>
            </c:forEach>
        </ul>
    </c:if>
    <a href="/spam/member/i_login">로그인 하러 가기</a>
    <a href="/spam/member/find/pwd">비밀번호 찾기</a>
</body>

</html>