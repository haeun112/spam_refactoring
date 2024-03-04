<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
    </script> -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="/spam/css/style.css">
</head>

<body>

    <section class="login-form">
        <h1>LOGIN</h1>
        <form action="/spam/member/c_login" method="post">
            <div class="caption-top">
                <a href="/spam/member/i_login">개인 로그인</a>
                <a href="/spam/member/c_login">기업 로그인</a>
            </div>
            <div class="int-area">
                <input type="text" name="company_id" id="id" autofocus autocomplete="off" required>
                <label for="id">아이디</label>
            </div>

            <div class="int-area">
                <input type="text" name="company_businessnum" id="businessnum" autofocus autocomplete="off" required>
                <label for="id">사업자번호</label>
            </div>

            <div class="int-area">
                <input type="password" name="company_pwd" id="pw" autocomplete="off" required>
                <label for="pw">비밀번호</label>
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">로그인</button>
            </div>
        </form>
        <div class="caption">
            <a href="/spam/member/find/id">아이디 찾기</a>
            <a href="/spam/member/find/pwd">비밀번호 찾기</a>
            <a href="/spam/member/joinfrm">회원가입</a>
        </div>
    </section>

    <script>
        let id = $('#id');
        let pw = $('#pw');
        let btn = $('#btn');

        $(btn).on('click', function () {
            if ($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);
            } else if ($(pw).val() == "") {
                $(pw).next('label').addClass('warning');
                setTimeout(function () {
                    $('label').removeClass('warning');
                }, 1500);


            }

        })
    </script>

<%@ include file="footer.jsp" %>
</body>

</html>