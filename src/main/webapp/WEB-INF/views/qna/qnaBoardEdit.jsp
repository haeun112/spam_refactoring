<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>

<body>
    <h1>게시글 수정</h1>

    <form action="${pageContext.request.contextPath}/qna/update" method="POST">
        <input type="hidden" name="board_id" value="${board.board_id}">
        <label for="board_title">제목:</label>
        <input type="text" id="board_title" name="board_title" value="${board.board_title}">
        <br>
        <label for="board_content">내용:</label>
        <textarea id="board_content" name="board_content">${board.board_content}</textarea>
        <br>
        <input type="submit" value="수정">
    </form>

    <a href="${pageContext.request.contextPath}/qna/detail?board_id=${board.board_id}">게시글로 돌아가기</a>
</body>

</html>