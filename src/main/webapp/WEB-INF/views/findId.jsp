<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/spam/css/findID.css">

    <style>
.caption a{
    font-size : 18px !important;
}
    </style>
</head>

<body>
    <section class="find-id-form">
        <h1>아이디 찾기</h1>
        <form action="/spam/member/find/id" method="post">
            <div class="int-area">
                <input type="text" id="customer_name" name="customer_name" autofocus autocomplete="off" required>
                <label for="customer_name">이름</label>

            </div>
            <br>
            <div class="int-area">
                <input type="email" id="customer_email" name="customer_email" required>
                <label for="customer_email">이메일</label>

            </div>
            <br>
            <div class="btn-area">
            <button type="submit">아이디 찾기</button>
        </div>
            <div class="caption">
            <a href="/spam/member/i_login">로그인 화면으로</a>
        </div>
            
        </form>
    </section>
    <%@ include file="footer.jsp" %>
</body>

</html>