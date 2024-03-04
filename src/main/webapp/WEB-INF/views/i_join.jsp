<%@ include file="header.jsp" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->

    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"> -->
    <!-- </script> -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/i_join.js"></script>
    <link rel="stylesheet" href="/spam/css/join.css">
</head>

<body>
    <section class="join-form">
        <h1>I_JOIN</h1>
        <form action="/spam/member/i_join" method="post">
            <div class="int-area">
                <div class="id-check">
                    <input type="hidden" name="company_id" id="company_id">
                    <input type="text" id="customer_id" name="customer_id" autocomplete="off" required>
                    <label for="customer_id">아이디</label>
                    <input type="button" id="id_check" value="중복확인"></input>
                </div>

            </div>

            <div class="int-area">
                <span id="id_check_msg" style="color: red;"></span>
            </div>

            <div class="int-area">
                <input type="password" id="customer_pwd" name="customer_pwd" autocomplete="off" required>
                <label for="customer_pwd">비밀번호</label>
            </div>

            <div class="int-area">
                <input type="password" id="customer_pwd_re" name="customer_pwd_re" autocomplete="off" required>
                <label for="customer_pwd">비밀번호 확인</label>

                <div class="int-area">
                    <span id="password_mismatch_msg" style="color: red;"></span>

                </div>
            </div>

            <div class="int-area">
                <input type="text" id="customer_name" name="customer_name" autocomplete="off" required>
                <label for="customer_name">이름</label>
            </div>

            <div class="int-area">
                <input type="email" id="customer_email" name="customer_email" autocomplete="off" required>
                <label for="customer_email">이메일</label>
            </div>

            <div class="int-area">
                <input type="text" id="customer_birth" name="customer_birth" autocomplete="off" required maxlength="8">
                <label for="customer_birth">생년월일</label>
                <div class="int-area"></div>
                <span id="birth_error_msg" style="color: red;"></span>
            </div>

            </div>
            <div class="int-area">
                <input type="tel" id="customer_phone" name="customer_phone" autocomplete="off" required maxlength="13"
                    pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" title="전화번호 형식에 맞게 입력해주세요 (010-1234-5678)">
                <label for="customer_phone">전화번호</label>
                <div class="int-area">
                    <span id="phone_error_msg" style="color: red;"></span>
                </div>
            </div>

            <div class="btn-area">
                <button id="btn" type="submit">가입하기</button>
            </div>
        </form>
    </section>

    <footer>
        <%@ include file="footer.jsp" %>
    </footer>

</body>

</html>