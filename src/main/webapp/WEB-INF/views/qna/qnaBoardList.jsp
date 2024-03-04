<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/header.jsp" />

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 리스트</title>
    <link rel="stylesheet" href="/spam/css/qnaboard.css">
    <!-- head 부분 생략 -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
         .footer_class {
            margin-top: 50px;
            /* 원하는 여백 값으로 조정하세요 */
            padding: 10px;
            /* 패딩을 추가하려면 */
        }
    </style>
</head>

<body>
    <div class="container" style="margin-left: 23%;">
        <div class="row">
            <div class="col-md-offset-1 col-md-10">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col col-sm-3 col-xs-12">
                                <h1>Q & A</h1>
                                <!-- 검색 폼 추가 -->
                                <form action="${pageContext.request.contextPath}/qna/list" method="get" style="text-align: right; color : #fff;">
                                    <label for="keyword">검색어:</label>
                                    <input type="text" id="keyword" name="keyword">
                                    <input type="submit" value="검색">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body table-responsive">



                        <table class="table" id="roomTable">
                            <thead>
                                <tr>
                                    <!-- <th>게시글 번호</th> -->
                                    <th>작성자</th>
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <thead>
                                    <!-- 게시물 목록 출력 -->
                                    <c:forEach var="board" items="${qnaBoardDtoList}">
                                        <tr>
                                            <!-- <td>${board.board_id}</td> -->
                                            <td>${board.user_id}</td>
                                            <td><a
                                                    href="${pageContext.request.contextPath}/qna/detail?board_id=${board.board_id}">${board.board_title}</a>
                                            </td>
                                            <td>${board.board_content}</td>
                                            <td>${board.board_date}</td>
                                        </tr>
                                    </c:forEach>
                                </thead>
                            </tbody>
                        </table>

                        <!-- 페이징 부분 수정 -->
                        <div class="paging" style="text-align: right; margin-right: 45%; color:#fff;">
                            <c:if test="${totalPages > 1}">
                                <c:choose>
                                    <c:when test="${currentPage > 1}">
                                        <a
                                            href="${pageContext.request.contextPath}/qna/list?page=1&pageSize=${pageSize}&keyword=${keyword}">처음</a>
                                        <a
                                            href="${pageContext.request.contextPath}/qna/list?page=${currentPage - 1}&pageSize=${pageSize}&keyword=${keyword}">이전</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span>처음</span>
                                        <span>이전</span>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:choose>
                                        <c:when test="${i eq currentPage}">
                                            <span>${i}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a
                                                href="${pageContext.request.contextPath}/qna/list?page=${i}&pageSize=${pageSize}&keyword=${keyword}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${currentPage < totalPages}">
                                        <a
                                            href="${pageContext.request.contextPath}/qna/list?page=${currentPage + 1}&pageSize=${pageSize}&keyword=${keyword}">다음</a>
                                        <a
                                            href="${pageContext.request.contextPath}/qna/list?page=${totalPages}&pageSize=${pageSize}&keyword=${keyword}">마지막</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span>다음</span>
                                        <span>마지막</span>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </div>
                         <!-- 글 작성 버튼 추가 -->
                         <div class="rrr" style="text-align: right; margin-right: 30px; margin-bottom: 15px;">
                            <a href="${pageContext.request.contextPath}/qna/write">글 작성하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer_id" class="footer_class">                  
    <jsp:include page="/WEB-INF/views/footer.jsp" />
</footer>
</body>

</html>