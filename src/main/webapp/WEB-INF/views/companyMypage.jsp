<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM : 기업 마이페이지</title>
    <style>

body{
            background-color: #f0e9e4 !important;  /* 밝은 베이지 */
        }
        
       .c_mypage{
    position: relative; /* 상대 위치 지정 */
    left: 20%;
    top: 20%;
    transform: translate(-20%, -20%); /* 화면 중앙 정렬을 위한 transform 사용 */
}

.c_mypage h1 {
position: fixed; /* 고정 위치 지정 */
left: 20%; /* 왼쪽에서 20% */
top: -100%; /* 위에서 20% */
transform: translate(-20%, 100%); /* 화면 중앙 정렬을 위한 transform 사용 */
}

.c_like {
    position: absolute;
left: 50%;
top: calc(20% + 250px); /* c_mypage 하단에서 100px 아래로 이동 */
transform: translate(-50%, -20%);
height: 250px; /* 높이 설정, 원하는 높이로 조정하세요 */
}

.c_like h4 {
white-space: nowrap; /* 텍스트를 한 줄로 고정 */
}

.c_like img {
display: block; /* 블록 요소로 설정하여 수평 가운데 정렬 */
margin: 0 auto; /* 가운데 정렬 */
}

.c_like #likeCount {
position: absolute; /* 절대 위치 지정 */
top: 32%; 
left: 48%; /* 이미지의 가로 중앙에 위치 */
transform: translate(-32%, -48%); /* 화면 중앙 정렬을 위한 transform 사용 */
font-size: 24px; /* 원하는 크기로 설정 */
}



.c_menu {
display: flex; /* Flexbox 사용 */
flex-direction: column; /* 세로로 정렬 */
align-items: center; /* 가운데 정렬 */
position: absolute;
left: 5%; /* 왼쪽에서 10% 여백 */
top: 30%; /* 위에서 20% 여백 */
}

.btn_cmenu {
display: flex;
flex-direction: column; /* 세로로 정렬 */
gap: 10px; /* 버튼 사이의 간격 조절 */
}

.btn_cmenu button {
/* 버튼 스타일 */
padding: 10px 20px;
background-color: none;
color: #815B5B;
border: none;
cursor: pointer;
width: 120px; /* 버튼 상자 너비 설정 */
height: 50px; /* 버튼 상자 높이 설정 */
border-radius: 30px;
}

.button {
  float: left;
  min-width: 150px;
  max-width: 250px;
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
}
.button:focus {
  outline: none;
}
.button > span {
  vertical-align: middle;
}
.button--antiman {
  background: none;
  border: none;
  height: 60px;
}
.button--antiman.button--inverted,
.button--antiman.button--inverted-alt {
  -webkit-transition: color 0.3s;
  transition: color 0.3s;
  -webkit-transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
  transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
}
.button--antiman > span {
  padding-left: 0.35em;
}
.button--antiman::before,
.button--antiman::after {
  content: '';
  z-index: -1;
  border-radius: inherit;
  pointer-events: none;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
  transition: transform 0.3s, opacity 0.3s;
  -webkit-transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
  transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
}
.button--antiman::before {
  border: 2px solid #815B5B;
  opacity: 0;
  -webkit-transform: scale3d(1.2, 1.2, 1);
  transform: scale3d(1.2, 1.2, 1);
}
.button--antiman.button--border-thin::before {
  border-width: 1px;
}
.button--antiman.button--border-medium::before {
  border-width: 2px;
}
.button--antiman.button--border-thick::before {
  border-width: 3px;
}
.button--antiman.button--inverted::before {
  border-color: #7986cb;
}
.button--antiman.button--inverted-alt::before {
  border-color: #3f51b5;
}
.button--antiman::after {
  background: #F1D3B3;
}
.button--antiman.button--inverted::after {
  background: #7986cb;
}
.button--antiman.button--inverted-alt::after {
  background: #3f51b5;
}
.button--antiman.button--inverted:hover {
  color: #7986cb;
}
.button--antiman.button--inverted-alt:hover {
  color: #3f51b5;
}
.button--antiman:hover::before {
  opacity: 1;
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
}
.button--antiman:hover::after {
  opacity: 0;
  -webkit-transform: scale3d(0.8, 0.8, 1);
  transform: scale3d(0.8, 0.8, 1);
}
    </style>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="bot.jsp" %>
    <section class="c_mypage">
        <h1>마이페이지</h1>
        <div class="c_like">
            <h4>나를 찜한 이용자 수</h4>
            <img src="image/like_3.png" alt="좋아요">
            <p id="likeCount">0</p>
        </div>
    </section>
    <section class="c_menu">
        <div class="btn_cmenu">
            <a href="/spam/c_mypage"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>마이페이지</button></a>
            <a href="/spam/c_mypage/list"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>고객 수</button></a>
            <a href="/spam/c_mypage/insert"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>등록 및 수정</button></a>
            <a href="/spam/c_mypage/resign"><button class="button button--antiman button--round-l button--text-medium"><i class="button__icon icon icon-plus"></i>퇴점 신청</button></a>
        </div>
        
    </section>
    <%@ include file="footer.jsp" %>
</body>
<script>
    $(document).ready(function() {
    $.ajax({
        url: '/spam/getTotalWishlistCount',
        method: 'GET',
        success: function(data) {
            $('#likeCount').text(data);
        },
        error: function() {
            // 에러 처리 로직을 추가할 수 있습니다.
        }
    });
});
</script>
</html>