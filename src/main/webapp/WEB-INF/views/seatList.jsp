<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>좌석 목록 페이지</title>
    <!-- CSS 스타일링 -->
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            color: #007bff;
        }

        .seat-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .seat {
            width: 100px;
            height: 100px;
            margin: 10px;
            border: 1px solid #ccc;
            text-align: center;
            line-height: 100px;
            cursor: pointer;
        }

        .reserved {
            background-color: #ff8080;
        }
    </style>
</head>

<body>
    <h1>좌석 목록 페이지</h1>
    <div class="seat-list">
        <c:forEach items="${seatList}" var="seat">
            <div class="seat${seat.isReserved ? ' reserved' : ''}">
                <a href="/reservation/create?seatId=${seat.id}">${seat.seatNumber}</a>
            </div>
        </c:forEach>
    </div>
</body>

</html>