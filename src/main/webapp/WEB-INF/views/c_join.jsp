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
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
    </script> -->
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/c_join.js"></script>
    <link rel="stylesheet" href="/spam/css/join.css">
</head>
<!-- <style>
         body{
            background-color: #f0e9e4 !important; 
        }
</style> -->

<body>
    <section class="join-form">
        <h1>C_JOIN</h1>
        <form action="" method="post">
            <div class="int-area">
                <div class="id-check">
                    <input type="hidden" name="customer_name" id="customer_id">
                    <input type="text" id="company_id" name="company_id" autocomplete="off" required>
                    <label for="company_id">아이디</label>
                    <input type="button" id="id_check" value="중복확인"></input>
                </div>

            </div>

            <div class="int-area">
                <span id="id_check_msg" style="color: red;"></span>
            </div>

            <div class="int-area">
                <input type="password" id="company_pwd" name="company_pwd" autocomplete="off" required>
                <label for="company_pwd">비밀번호</label>
            </div>

            <div class="int-area">
                <input type="password" id="company_pwd_re" name="company_pwd_re" autocomplete="off" required>
                <label for="company_pwd">비밀번호 확인</label>
            </div>

            <div class="int-area">
                <span id="password_mismatch_msg" style="color: red;"></span>
            </div>

            <div class="int-area">
                <input type="text" id="company_name" name="company_name" autocomplete="off" required>
                <label for="company_name">이름</label>
            </div>

            <div class="int-area">
                <input type="email" id="company_email" name="company_email" autocomplete="off" required>
                <label for="company_email">이메일</label>
            </div>

            <div class="int-area">
                <input type="text" id="company_businessnum" name="company_businessnum" autocomplete="off" required
                    maxlength="12">
                <label for="company_businessnum">사업자번호</label>
            </div>

            <div class="int-area">
                <span id="business_error_msg" style="color: red;"></span>
            </div>

            <div class="int-area">
                <input type="tel" id="company_phone" name="company_phone" autocomplete="off" required maxlength="13"
                    pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" title="전화번호 형식에 맞게 입력해주세요 (010-1234-5678)">
                <label for="company_phone">전화번호</label>
            </div>

            <div class="int-area">
                <span id="phone_error_msg" style="color: red;"></span>
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