<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 및 리뷰 내역</title>
    <link rel="stylesheet" href="/spam/css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/cancelButton.js"></script>
    

</head>
<style>
     .list-form {
  position: absolute;
  top: 29%; /* 원하는 아래쪽 여백 조정 */
  right: 20%; /* 원하는 오른쪽 여백 조정 */
  font-size: 18px; /* 폰트 크기를 원하는 크기로 설정 */
  width: 50%;
} 
.table-bordered>:not(caption)>*{
    height: 50px;
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

button[type="submit"] {
    border: 1px solid #6F4C5B; /* 테두리 없애기 */
    background-color: transparent; /* 배경색 투명하게 만들기 */
    color: #AA7070; /* 원하는 글자색 지정 */
    cursor: pointer;
    padding: 2px 3px; /* 내부 여백을 위아래 5px, 좌우 10px로 설정 (원하는 값으로 조정 가능) */
    font-size: 18px; /* 기본 글자 크기 설정 */
    transition: font-size 0.2s; /* 글자 크기 전환 효과 추가 */
    transform-origin: center; /* 변환 중심을 가운데로 설정 */
}

button[type="submit"]:hover {
    font-size: 16px; /* 호버 상태에서 작아질 글자 크기 설정 */
    z-index: 1; /* 다른 요소 위에 나타나도록 설정 */
}


 
</style>
<body>

    <section class="i_menu">
        <div class="btn_i_menu">
            <a href="${pageContext.request.contextPath}/i_mypage" class="active"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>마이페이지</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list/like_list" id="button--open"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>찜 목록</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/list"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>예약 및 리뷰</button></a>
            <a href="${pageContext.request.contextPath}/i_mypage/myqna"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>나의 문의 내역</button></a>
            <!-- 원하는 메뉴 항목들을 추가할 수 있습니다. -->
        </div>
    </section>
    <section class="list-form">
        <a href="/spam/i_mypage/list">예약 내역</a>
        <a href="/spam/i_mypage/list/review_list">내가 작성한 리뷰</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <!-- <th scope="col">예약 ID</th> -->
                    <th scope="col">업체명</th>
                    <th scope="col">시작 시간</th>
                    <th scope="col">종료 시간</th>
                    <th scope="col">좌석 번호</th>
                    <!-- <th scope="col">예약 여부</th> -->
                    <th scope="col">예약 상태</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reservationList}" var="reservation">
                    <tr>
                        <!-- <td>${reservation.reservation_id}</td> -->
                        <td>${reservation.room_name}</td>
                        <td>${reservation.start_time}</td>
                        <td>${reservation.end_time}</td>
                        <td>${reservation.seat_number}</td>
                        <!-- <td>${reservation.status}</td> -->
                        <td>
                            <script>
                                var status = "${reservation.status}";
                                var start_time = "${reservation.start_time}";
                                var end_time = "${reservation.end_time}";
                                var currentTime = new Date().getTime();
            
                                if (status === '0') {
                                    document.write("취소 완료");
                                } else if (currentTime < new Date(start_time).getTime()) {
                                    document.write("예약 완료");
                                } else if (currentTime > new Date(end_time).getTime()){
                                    document.write("이용 완료");
                                } else {
                                    document.write("취소 불가");
                                }
                            </script>
                        </td>
                        <td>
                            <form action="/spam/{room_name}/cancel" method="post" onsubmit="return confirmCancel('${reservation.status}', '${reservation.start_time}');">
                                <input type="hidden" name="reservation_id" value="${reservation.reservation_id}">
                                <button type="submit">예약 취소</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                
            </tbody>
        </table>

        <!-- 페이징 -->
        <div class="pagination">
            <c:if test="${totalPages > 1}">
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/i_mypage/list?page=${currentPage - 1}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">이전</span>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                    <c:url var="pageUrl" value="/i_mypage/list">
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
                        <a href="${pageContext.request.contextPath}/i_mypage/list?page=${currentPage + 1}">다음</a>
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