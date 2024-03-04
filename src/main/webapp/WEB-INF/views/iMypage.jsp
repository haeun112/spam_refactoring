<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="bot.jsp" %>

<html>

<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/mypage.js"></script>
    
    <!-- <script src="/spam/js/i_join.js"></script> -->
</head>
<style>

  
.footer_class {
  margin-top: 400px !important;
  /* 원하는 여백 값으로 조정하세요 */
  padding: 10px;
  /* 패딩을 추가하려면 */
}
  

.list-form {
  position: absolute;
  top: 18%; /* 원하는 아래쪽 여백 조정 */
  right: 38%; /* 원하는 오른쪽 여백 조정 */
  font-size: 24px; /* 폰트 크기를 원하는 크기로 설정 */
    
} 

input[name^="customer"] {
  display: block;
width: 100%;
min-width: 100%;
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

input[name^="customer"]:focus {
border-bottom: 5px solid #fff; /* $form-shadow 변수를 직접 값을 대입해 주세요 */
}
input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus {
border-bottom: 5px solid #442727;
-webkit-text-fill-color: #fff;
-webkit-box-shadow: 0 0 0px 1000px #AA7070 inset;
transition: background-color 5000s ease-in-out 0s;
}

.button--nina {
  float: left;
  display: block;
  margin: 1em;
  padding: 1em 2em;
  border: none;
  background: none;
  color: inherit;
  vertical-align: middle;
  position: relative;
  z-index: 1;
  -webkit-backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
  border-radius: 20px;
}
.button--nina:focus {
  outline: none;
}
.button--nina > span {
  vertical-align: middle;
}

.button--nina {
  padding:0 1em !important;
  background: #CA8A8B !important;
  color: #fff !important;
  overflow: hidden;
  -webkit-transition: background-color 0.3s;
  transition: background-color 0.3s;
  margin-right: 35px !important;
  margin-left:  35px !important;
}


.button--nina.button--inverted {
  background: #fff;
  color: #7986cb;
}
.button--nina > span {
  display: inline-block;
  padding: 1em 0;
  opacity: 0;
  color: #fff;
  -webkit-transform: translate3d(0, -10px, 0);
  transform: translate3d(0, -10px, 0);
  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
  transition: transform 0.3s, opacity 0.3s;
  -webkit-transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
  transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
}
.button--nina::before {
  content: attr(data-text);
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  padding: 1em 0;
  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
  transition: transform 0.3s, opacity 0.3s;
  -webkit-transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
  transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
}
.button--nina:hover {
  background-color: #926E6F !important;
}
.button--nina:hover::before {
  opacity: 0;
  -webkit-transform: translate3d(0, 100%, 0);
  transform: translate3d(0, 100%, 0);
}
.button--nina:hover > span {
  opacity: 1;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.button--nina:hover > span:nth-child(1) {
  -webkit-transition-delay: 0.045s;
  transition-delay: 0.045s;
}
.button--nina:hover > span:nth-child(2) {
  -webkit-transition-delay: 0.09s;
  transition-delay: 0.09s;
}
.button--nina:hover > span:nth-child(3) {
  -webkit-transition-delay: 0.135s;
  transition-delay: 0.135s;
}
.button--nina:hover > span:nth-child(4) {
  -webkit-transition-delay: 0.18s;
  transition-delay: 0.18s;
}
.button--nina:hover > span:nth-child(5) {
  -webkit-transition-delay: 0.225s;
  transition-delay: 0.225s;
}
.button--nina:hover > span:nth-child(6) {
  -webkit-transition-delay: 0.27s;
  transition-delay: 0.27s;
}
.button--nina:hover > span:nth-child(7) {
  -webkit-transition-delay: 0.315s;
  transition-delay: 0.315s;
}
.button--nina:hover > span:nth-child(8) {
  -webkit-transition-delay: 0.36s;
  transition-delay: 0.36s;
}
.button--nina:hover > span:nth-child(9) {
  -webkit-transition-delay: 0.405s;
  transition-delay: 0.405s;
}
.button--nina:hover > span:nth-child(10) {
  -webkit-transition-delay: 0.45s;
  transition-delay: 0.45s;
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

    <div class="list-form">
        
            <form id="memberInfo" method="post">
                <div>
                    <label for="name">이름</label>
                    <input type="text" id="customer_name" name="customer_name"
                        value="${customerMemberDto.customer_name}" readonly>
                </div>
                <div>
                    <label for="username">아이디</label>
                    <input type="text" id="customer_id" name="customer_id" value="${customerMemberDto.customer_id}"
                        readonly>
                </div>
                <div>
                    <label for="password">비밀번호</label>
                    <input type="password" id="customer_pwd" name="customer_pwd">
                </div>
                <div>
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" id="customer_pwd_re" name="customer_pwd">
                </div>
                <div>
                    <label for="phoneNumber">전화번호</label>
                    <input type="tel" id="customer_phone" name="customer_phone"
                        value="${customerMemberDto.customer_phone}" required maxlength="13"
                        pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}">
                </div>
                <div>
                    <label for="email">이메일</label>
                    <input type="email" id="customer_email" name="customer_email"
                        value="${customerMemberDto.customer_email}">
                </div>
                <div class="box bg-1">
                <button type="submit" onclick="return resignAlert();" name="resignButton" class="button button--nina button--text-thick button--text-upper button--size-s" data-text="회원탈퇴"><span>회</span><span>원</span><span> </span><span>탈</span><span>퇴</span></button>
                <button type="submit" onclick="return updateAlert();" name="updateButton" class="button button--nina button--text-thick button--text-upper button--size-s" data-text="수정완료"><span>수</span><span>정</span><span> </span><span>완</span><span>료</span></button>
            </div>
        
        </form>

    </div>
    <footer id="footer_id" class="footer_class">
        <%@ include file="footer.jsp" %>
        
    </footer>
</body>
<link rel="stylesheet" href="/spam/css/mypage.css">
</html>