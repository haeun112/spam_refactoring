<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/spam/css/mypage.css">
</head>
<style>
    .list-form {
  position: absolute;
  top: 29%; /* 원하는 아래쪽 여백 조정 */
  right: 20%; /* 원하는 오른쪽 여백 조정 */
  font-size: 18px; /* 폰트 크기를 원하는 크기로 설정 */
  width: 50%;
} 

input[name^="customer"] {
  display: block;
width: 100%;
font-size: inherit; /* 폰트 크기를 상속받도록 수정 */
line-height: inherit; /* 라인 높이를 상속받도록 수정 */
font-family: inherit; /* 폰트 패밀리를 상속받도록 수정 */
margin-bottom: inherit; /* 마진을 상속받도록 수정 */
border: none;
margin-bottom: 10px; /* 마진을 추가하여 공백 생성 */
border: none;
border-bottom: 5px solid #AA7070;
background: #AA7070; /* $form-bg 변수를 직접 값을 대입해 주세요 */
padding-left: 5px;
outline: none;
color: white;
}

</style>
<body>

    <section class="i_menu">
        <div class="btn_i_menu">
            <a href="${pageContext.request.contextPath}/i_mypage" class="active"><button
                    class="button button--antiman button--round-l button--text-medium"><i
                        class="button__icon icon icon-plus"></i>마이페이지</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list/like_list" id="button--open"><button
                    class="button button--antiman button--round-l button--text-medium"><i
                        class="button__icon icon icon-plus"></i>찜 목록</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list"><button
                    class="button button--antiman button--round-l button--text-medium"><i
                        class="button__icon icon icon-plus"></i>예약 및 리뷰</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/myqna"><button
                    class="button button--antiman button--round-l button--text-medium"><i
                        class="button__icon icon icon-plus"></i>나의 문의 내역</button></a>
            <!-- 원하는 메뉴 항목들을 추가할 수 있습니다. -->
        </div>
    </section>

    <section class="list-form">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">찜 No.</th>
                    <!-- <th scope="col">고객 ID</th> -->
                    <th scope="col">업체명</th>
                    <th scope="col">업체 코드</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${wishList}" var="wishList">
                    <tr>
                        <td>${wishList.wishlist_id}</td>
                        <!-- <td>${wishList.customer_id}</td> -->
                        <td>${wishList.room_name}</td>
                        <td>${wishList.room_id}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이징 -->
        <div class="pagination">
            <c:if test="${totalPages > 1}">
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a
                            href="${pageContext.request.contextPath}/i_mypage/list/like_list?page=${currentPage - 1}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">이전</span>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                    <c:url var="pageUrl" value="/i_mypage/list/like_list">
                        <c:param name="page" value="${pageNumber}" />
                    </c:url>

                    <c:choose>
                        <c:when test="${pageNumber == currentPage}">
                            <span class="current-page">${pageNumber}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageUrl}">${pageNumber}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${currentPage < totalPages}">
                        <a
                            href="${pageContext.request.contextPath}/i_mypage/list/like_list?page=${currentPage + 1}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">다음</span>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </div>
    </section>

</body>

</html>