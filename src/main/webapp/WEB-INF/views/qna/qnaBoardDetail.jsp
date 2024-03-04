<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/header.jsp" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세보기</title>
    <link rel="stylesheet" href="/spam/css/qnaboard.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<style>
    .footer_class {
        margin-top: 50px;
        /* 원하는 여백 값으로 조정하세요 */
        padding: 10px;
        /* 패딩을 추가하려면 */
    }

    .container {
        max-width: 50%;
        /* 원하는 최대 너비 설정 */
        margin-top: 50px;
        /* 가운데 정렬을 위한 왼쪽/오른쪽 마진 자동 설정 */
        margin-bottom: 50px;
    }

    .th {
        font-weight: bold;
        text-align: center;
        /* 텍스트를 우측 정렬 */
        width: 100%;
        /* 오른쪽 여백 추가 */
    }

    th,
    tr {
        border-color: inherit;
        border-style: solid;
        border-width: 2px;

    }

    .titi table {
        border-collapse: collapse;
        width: 57%;
        /* 원하는 너비로 조정 */
    }

    .pu table {
        width: 57%;
        text-align: center;
    }

    .titi th,
    .titi td {
        border: 2px solid black;
        /* 테두리 스타일 지정 */
        padding: 8px;
        /* 적절한 패딩 값으로 조정 */
        text-align: left;
    }

    .wiwi table {
        border-collapse: collapse;
        width: 57%;
        /* 원하는 너비로 조정 */
    }

    .wiwi th,
    .wiwi td {
        border: 2px solid black;
        /* 테두리 스타일 지정 */
        padding: 50px;
        /* 적절한 패딩 값으로 조정 */
        text-align: center;
    }

    .mimi {
        text-align: right;
        width: 57%;
    }

    .riri td {
        text-align: center;

    }

    .riri {
        margin-bottom: 30px;
        width: 57%;
    }

    textarea {
        height: 50px;
        /* 원하는 높이로 설정하세요. */
        resize: vertical;
        width: 57%;
    }

    .didi {
        text-align: right;
        width: 57%;
    }

    .mama {
        text-align: center;
        width: 57%;
        margin-top: 50px;
    }

    a {
        text-decoration: none;
        color: #6D8B74;
    }

    a:hover {
        color: #1A3C40;
    }
</style>

<body>
    <div class="container" style="margin-left: 35%;">

        <c:if test="${not empty board}">
            <div class="pu">
                <table>
                    <tr>
                        <th>게시글 번호: ${board.board_id}</th>

                        <th>작성자: ${board.user_id}</th>

                        <th>작성일: ${board.board_date}</th>

                    </tr>
                </table>
            </div>
            <div class="titi">
                <table>
                    <tr>
                        <th>제목: ${board.board_title}</th>

                    </tr>
                </table>

            </div>
            <div class="wiwi">
                <table>
                    <tr>
                        <th>${board.board_content}</th>
                    </tr>
                </table>
            </div>



            <div class="mimi">
                <table>
                    <!-- Edit and Delete Buttons -->
                    <c:if test="${loggedInUserId eq board.user_id}">
                        <a href="${pageContext.request.contextPath}/qna/edit?board_id=${board.board_id}">수정</a>
                        <a href="#" onclick="confirmDelete('${board.board_id}')">삭제</a>
                    </c:if>
                </table>
            </div>
        </c:if>

        <!-- 댓글 표시 영역 -->
        <h2>댓글</h2>
        <table class="riri">
            <thead style="text-align: center;">
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성일</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody id="comments">
                <!-- 댓글이 여기에 동적으로 추가됩니다. -->
            </tbody>
        </table>
        <button id="loadMoreButton">더보기</button>
        <p> </p>


        <!-- 댓글 입력 폼 -->
        <h3>댓글 작성</h3>
        <form id="commentForm">
            <input type="hidden" name="board_id" value="${board.board_id}">
            <!-- <label for="comment_content">댓글 내용:</label> -->
            <textarea id="comment_content" name="comment_content" rows="4" cols="50"></textarea>
            <br>
            <div class="didi">
                <input type="button" value="댓글 작성" onclick="addComment()">
            </div>
        </form>

        <!-- 댓글 수정 폼 -->

        <form id="editCommentForm" style="display: none;">
            <input type="hidden" id="editCommentId" name="comment_id">
            <label for="editCommentContent">댓글 내용:</label>
            <textarea id="editCommentContent" name="comment_content" rows="4" cols="50"></textarea>
            <br>
            <input type="button" value="댓글 수정" onclick="editComment()">
        </form>
        <div class="mama">
            <a href="${pageContext.request.contextPath}/qna/list">목록으로 돌아가기</a>
        </div>
    </div>
    <script>
        // 특정 페이지의 댓글을 로드하는 JavaScript 함수
        function loadComments(page) {
            let boardId = "${board.board_id}";

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/comments/getByBoardId/" + boardId + "?page=" + page,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 댓글 목록을 초기화
                    $("#comments").empty();

                    // 서버에서 가져온 댓글을 화면에 추가
                    for (let i = 0; i < data.length; i++) {
                        let commentHtml = "<tr>" +
                            "<td>" + data[i].user_id + "</td>" +
                            "<td>" + data[i].comment_content + "</td>" +
                            "<td>" + data[i].comment_date + "</td>" +
                            "<td><a href='#' onclick='openEditForm(" + data[i].comment_id + ", \"" + data[i]
                            .comment_content + "\")'>수정</a></td>" +
                            "<td><a href='#' onclick='deleteComment(" + data[i].comment_id +
                            ")'>삭제</a></td>" +
                            "</tr>";
                        $("#comments").append(commentHtml);
                    }
                },
                error: function () {
                    alert("댓글 불러오기 실패");
                }
            });
        }
        // JavaScript function to confirm deletion
        function confirmDelete(boardId) {
            if (confirm("게시글을 삭제하시겠습니까?")) {
                let form = document.createElement("form");
                form.method = "POST";
                form.action = "${pageContext.request.contextPath}/qna/delete?board_id=" + boardId;
                document.body.appendChild(form);
                form.submit();
            }
        }

        // JavaScript function to open edit form
        function openEditForm(commentId, commentContent) {
            $("#editCommentId").val(commentId);
            $("#editCommentContent").val(commentContent);
            $("#editCommentForm").show();
        }


        // AJAX로 댓글 수정
        function editComment() {
            let commentId = $("#editCommentId").val();
            let editedContent = $("#editCommentContent").val();

            $.ajax({
                type: "PUT",
                url: "${pageContext.request.contextPath}/comments/" + commentId,
                data: JSON.stringify({
                    comment_content: editedContent
                }),
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 댓글 수정 성공 시 화면 갱신
                    loadComments(1);
                    // 폼 초기화 및 닫기
                    $("#editCommentId").val("");
                    $("#editCommentContent").val("");
                    $("#editCommentForm").hide();
                },
                error: function () {
                    alert("댓글 수정 실패");
                }
            });
        }

        // AJAX로 댓글 삭제
        function deleteComment(commentId) {
            $.ajax({
                type: "DELETE",
                url: "${pageContext.request.contextPath}/comments/" + commentId,
                success: function () {
                    // 댓글 삭제 성공 시 화면 갱신
                    loadComments(1);
                },
                error: function () {
                    alert("댓글 삭제 실패");
                }
            });
        }
        //---------------------------------------------------------------------------------------------

        // // AJAX로 댓글 가져오기
        // function getComments() {
        //     let boardId = "${board.board_id}";

        //     $.ajax({
        //         type: "GET",
        //         url: "${pageContext.request.contextPath}/comments/getByBoardId/" + boardId,
        //         contentType: "application/json",
        //         dataType: "json",
        //         success: function (data) {
        //             // 댓글 목록을 초기화
        //             $("#comments").empty();

        //             // 서버에서 가져온 댓글을 화면에 추가
        //             for (let i = 0; i < data.length; i++) {
        //                 let commentHtml = "<tr>" +
        //                     "<td>" + data[i].user_id + "</td>" +
        //                     "<td>" + data[i].comment_content + "</td>" +
        //                     "<td>" + data[i].comment_date + "</td>" +
        //                     "<td><a href='#' onclick='openEditForm(" + data[i].comment_id + ", \"" + data[i]
        //                     .comment_content + "\")'>수정</a></td>" +
        //                     "<td><a href='#' onclick='deleteComment(" + data[i].comment_id +
        //                     ")'>삭제</a></td>" +
        //                     "</tr>";
        //                 $("#comments").append(commentHtml);
        //             }
        //         },
        //         error: function () {
        //             alert("댓글 불러오기 실패");
        //         }
        //     });
        // }
        // //---------------------------------------------------------------------------------------------
        // AJAX로 댓글 추가
        // function addComment() {
        //     let boardId = "${board.board_id}";
        //     let commentContent = $("#comment_content").val();

        //     $.ajax({
        //         type: "POST",
        //         url: "${pageContext.request.contextPath}/comments/add",
        //         data: JSON.stringify({
        //             board_id: boardId,
        //             comment_content: commentContent
        //         }),
        //         contentType: "application/json",
        //         dataType: "json",
        //         success: function (data) {
        //             // 댓글 추가 성공 시 화면에 댓글 추가
        //             getComments();
        //             // 입력 폼 초기화
        //             $("#comment_content").val("");
        //         },
        //         error: function () {
        //             location.href = "/spam/member/i_login";
        //             alert("댓글 추가 실패");
        //         }
        //     });
        // }
        // //---------------------------------------------------------------------------------------------
        //   // 페이지 로드 시 댓글 가져오기
        $(document).ready(function () {
            loadComments(1);
        });

        // $(document).ready(function () {
        //     getComments();
        // });

        // 초기 페이지 번호와 페이지당 댓글 수 설정
        let page = 1;
        const pageSize = 5;
        let boardId = "${board.board_id}";


        // "더보기" 버튼 클릭 시 추가 댓글 가져오기
        $("#loadMoreButton").click(function () {
            page++; // 다음 페이지로 이동
            getComments();
        });

        function getComments() {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/comments/getByBoardId/" + boardId + "?page=" + page +
                    "&pageSize=" + pageSize,
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    // 서버에서 가져온 댓글을 화면에 추가
                    for (let i = 0; i < data.length; i++) {
                        let commentHtml = "<tr>" +
                            "<td>" + data[i].user_id + "</td>" +
                            "<td>" + data[i].comment_content + "</td>" +
                            "<td>" + data[i].comment_date + "</td>" +
                            "<td><a href='#' onclick='openEditForm(" + data[i].comment_id + ", \"" + data[i]
                            .comment_content + "\")'>수정</a></td>" +
                            "<td><a href='#' onclick='deleteComment(" + data[i].comment_id +
                            ")'>삭제</a></td>" +
                            "</tr>";
                        $("#comments").append(commentHtml);
                    }

                    // 가져온 댓글의 개수가 pageSize 미만이면 "더보기" 버튼을 숨김
                    if (data.length < pageSize) {
                        $("#loadMoreButton").hide();
                    } else {
                        $("#loadMoreButton").show(); // 댓글이 더 있을 경우 버튼 표시
                    }
                },
                error: function () {
                    alert("댓글 불러오기 실패");
                }
            });
        }

        // AJAX로 댓글 추가
        function addComment() {
            let commentContent = $("#comment_content").val();

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/comments/add",
                data: JSON.stringify({
                    board_id: boardId,
                    comment_content: commentContent
                }),
                contentType: "application/json",
                dataType: "json",
                success: function () {
                    // 댓글 추가 성공 시 화면 갱신
                    // 입력 폼 초기화
                    $("#comment_content").val("");
                    // 기존 댓글 목록 갱신
                    loadComments(1);
                },
                error: function () {
                    location.href = "/spam/member/i_login";
                    alert("댓글 추가 실패");
                }
            });
        }
    </script>
    <footer id="footer_id" class="footer_class">
        <jsp:include page="/WEB-INF/views/footer.jsp" />
    </footer>
</body>

</html>