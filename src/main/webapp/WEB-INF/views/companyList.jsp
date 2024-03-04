<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM : 기업:고객 수</title>
    <style>

body{
            background-color: #f0e9e4 !important;  /* 밝은 베이지 */
        }
       .c_list{
    position: relative; /* 상대 위치 지정 */
    left: 20%;
    top: 20%;
    transform: translate(-20%, -20%); /* 화면 중앙 정렬을 위한 transform 사용 */
}

.c_list h1 {
position: fixed; /* 고정 위치 지정 */
left: 20%; /* 왼쪽에서 20% */
top: -100%; /* 위에서 20% */
transform: translate(-20%, 100%); /* 화면 중앙 정렬을 위한 transform 사용 */
}

.c_monthlist {
    position: absolute;
left: 50%;
top: calc(20% + 250px); /* c_mypage 하단에서 100px 아래로 이동 */
transform: translate(-50%, -20%);
height: 250px; /* 높이 설정, 원하는 높이로 조정하세요 */

}

.c_monthlist h4 {
white-space: nowrap; /* 텍스트를 한 줄로 고정 */
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
</head>
<body>
    <%@ include file="header.jsp" %>
    <section class="c_list">
        <h1>고객 수</h1>
        <div class="c_monthlist">
            <h4>월별 이용자 수</h4>
            <div>
            <button id="sendAjax">새로 고침</button>
        </div>
            <div style="width: 800px;">
                <canvas id="myChart" ></canvas>
                
              </div>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('myChart').getContext('2d');

    const myBarChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      datasets: [{
        label: '이용자 수',
        data: [15, 20, 14, 25, 30, 32, 28, 24, 27, 0, 0, 0],
        backgroundColor : [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            ],
        borderColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            ],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });

//새로고침 버튼 설정
const button = document.getElementById("sendAjax");

button.addEventListener("click", function(){
    // sendAjax('http://localhost:8000/spam/c_mypage/list');
    // 새로고침을 실행하기 위해 현재 페이지를 다시 로드
    window.location.reload();
});

function sendAjax(url){
    const oReq = new XMLHttpRequest();

    oReq.open('POST', url);
    oReq.setRequestHeader('Content-Type', "application/json") //json형태로 보낸다
    oReq.send();

    oReq.addEventListener('load', function(){
        const result = JSON.parse(oReq.responseText);
        const user_count = result.user_count;
        const comp_data = myBarChart.data.datasets[0].data;

        for(let i=0; i<comp_data.length; i++){
            comp_data[i] = user_count[i];
        }
        
        myBarChart.update();
    })
}

</script>
</html>