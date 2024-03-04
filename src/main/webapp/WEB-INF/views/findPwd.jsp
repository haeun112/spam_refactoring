<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM</title>
    <link rel="stylesheet" href="/spam/css/findID.css">
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <style>
        .caption a{
            font-size : 18px !important;
        }
            </style>
</head>

<body>
    <%@ include file="header.jsp" %>

    <section class="find-id-form">
        <h1>비밀번호 찾기</h1>
        <form action="/spam/member/find/pwd" method="post">
            <div class="int-area">
                <input type="text" id="customer_id" name="customer_id" autofocus autocomplete="off" required>
                <label for="customer_name">아이디</label>

            </div>
            <br>
            <div class="int-area">
                <input type="email" id="customer_email" name="customer_email" required>
                <label for="customer_email">이메일</label>

            </div>
            <br>
            <div class="btn-area">
                <button type="submit">비밀번호 찾기</button>
                </div>
                <div class="caption">
                <a href="/spam/member/i_login">로그인 화면으로</a>
            </div>
        </form>
    </section>
    <%@ include file="footer.jsp" %>
</body>

</html>