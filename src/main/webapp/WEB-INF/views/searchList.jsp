<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ include file="bot.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독서실 검색</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <link rel="stylesheet" href="/spam/css/searchList.css">
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

    <div id="container_id" class="container_class">
        <div id="search_id" class="search_class">
            <div class="search_option">

                <form id="searchForm">
                    <div class="search_section">
                        <select id="region" name="region" class="search_input">
                            <option value="">지역</option>
                            <option>전체</option>
                            <option>서울</option>
                            <option>인천</option>
                            <option>경기</option>
                        </select>
                        <input type="text" name="searchKeyword" id="total_ipt_keyword"
                            class="search_input search_keyword" maxlength="30" placeholder="독서실 이름 입력"
                            autocomplete="off">
                        <button type="button" id="btn_search" class="btn_search">검색</button>
                    </div>
                </form>

            </div>
        </div>


        <div class="bg"></div>

        <section class="list-form" id="studyRoomList">
            <ul>
                <c:forEach var="detailPageDto" items="${detailPageDtos}">
                    <li>
                        <strong></strong> <img src="img/wyd.jpg" alt="독서실 이미지" width="150"> <br>
                        
                        <strong>독서실 이름:</strong> <a
                            href="/spam/${detailPageDto.room_name}">${detailPageDto.room_name}</a> <br>
                        <strong>지역:</strong> ${detailPageDto.region} <br>
                        <strong>시간당 가격:</strong> ${detailPageDto.time_price} <br>
                        <strong>하루 가격:</strong> ${detailPageDto.day_price} <br>
                        <strong>설명:</strong> ${detailPageDto.room_description}
                    </li>
                </c:forEach>
            </ul>
            <c:set var="totalDataCount" value="${detailPageDtos.size()}" /> <!-- 데이터 갯수 -->
            <c:set var="pageSize" value="5" /> <!-- 페이지 당 표시할 데이터 수 -->

            <c:set var="totalPages" value="${totalDataCount / pageSize}" />
            <c:choose>
                <c:when test="${totalDataCount % pageSize != 0}">
                    <c:set var="totalPages" value="${totalPages + 1}" />
                </c:when>
            </c:choose>
            

            <!-- Pagination -->
            <div class="pagination">
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <c:url var="prevPageUrl" value="/search">
                            <c:param name="page" value="${currentPage - 1}" />
                        </c:url>
                        <a href="${prevPageUrl}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">이전</span>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:url var="pageUrl" value="/search">
                        <c:param name="page" value="${i}" />
                    </c:url>
                    <c:choose>
                        <c:when test="${i eq currentPage}">
                            
                            <span class="current-page">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageUrl}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${currentPage < totalPages || totalPages == 1}">
                        <c:url var="nextPageUrl" value="/search">
                            <c:param name="page" value="${currentPage + 1}" />
                        </c:url>
                        <a href="${nextPageUrl}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">다음</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <!-- Pagination -->




        </section>



    </div>
    <footer id="footer_id" class="footer_class">
        <%@ include file="footer.jsp" %>
        
    </footer>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/searchList.js"></script>
</body>

</html>