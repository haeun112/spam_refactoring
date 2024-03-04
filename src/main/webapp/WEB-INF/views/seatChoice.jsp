
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choice Table</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
	<script src="/js/jquery-3.7.0.min.js"></script>
	
   
</head>
<style>
body{
    font-family: 'Lato', sans-serif;
    background-color: #f0e9e4;
    color: #fff;
    box-sizing: border-box;
}

#s_container{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 800px;

}

.seat_contaner{
    margin: 20px 0px;
}

.s_showcase{
    background-color: #777;
    background: rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    display: flex;
    justify-content: center;
    margin: 16px 0;
    padding: 5px 50px;
}

.seat_contaner select{
    margin: 10px;
    padding: 5px 15px 5px 15px;
    border-radius: 7px;
    appearance: none;
    border: 0;
}

.seat_contaner select option{

   text-align: left;
}

.s_li{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 10px;
}

.s_small{
    color: black;
    margin-left: 2px;
}

.s_showcase .s_seat:hover{
    cursor: default;
    scale: 1;
}

.s_showcase .selectedSeat:hover{
    cursor: default;
    scale: 1;
}

.s_seat{
    background-color: #444451;
    width: 50px;
    height: 50px;
    margin: 3px;
    color: #FFFFFF;
    border-radius: 10px;
    cursor: pointer;
}

.availableSeat{
    background-color: #444451;
    width: 50px;
    height: 50px;
    margin: 3px;
    border-radius: 10px;
    cursor: default;
}

.selectedSeatIcon{
    background-color: #6feaf6;
    width: 50px;
    height: 50px;
    margin: 3px;
    border-radius: 10px;
    cursor: default;
}

.s_seat:hover{
    scale: 1.2;
}

.selectedSeat:hover{
    scale: 1.2;
}

.s_seat:nth-of-type(2){
    margin-right: 18px;
}

.s_seat:nth-of-type(7){
    margin-left: 18px;
}

.occupiedSeat:nth-of-type(2){
    margin-right: 18px;
}
.occupiedSeat:nth-of-type(7){
    margin-left: 18px;
}

.selectedSeat{
    background-color: #6feaf6;
    width: 50px;
    height: 50px;
    margin: 3px;
    color: #333333;
    border-radius: 10px;
    cursor: pointer;
}

.occupiedSeat{
    background-color: black;
    width: 50px;
    height: 50px;
    color: #DCE682;
    margin: 3px;
    border-radius: 10px;
}

.s_row{
    display: flex;
}

.text{
    margin-top: 30px;
    padding: 20px;
}

#count{
    color: #6feaf6;
}

#costs{
    color: #6feaf6;
}

.sbutton-container {
    display: flex; /* 수평으로 배치하기 위해 Flexbox 사용 */
    justify-content: space-between; /* 각 버튼을 좌우로 정렬 */
    margin-top: 20px; /* 원하는 간격 설정 */
}

.myChooseButton {
	box-shadow: 0px 10px 14px -7px #000000;
	background:linear-gradient(to bottom, #000000 5%, #000000 100%);
	background-color:#000000;
	border-radius:10px;
	border:1px solid #000000;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:14px 40px;
	text-decoration:none;
	text-shadow:0px 1px 0px #000000;
    margin-right: 30px; /* 버튼 사이에 오른쪽 여백 추가 */
    margin-left: 30px;
}
.myChooseButton:hover {
	background:linear-gradient(to bottom, #000000 5%, #000000 100%);
	background-color:#000000;
}
.myChooseButton:active {
	position:relative;
	top:1px;
}

</style>
<body>
    <%@ include file="header.jsp" %>
    <section id="s_container">
        <form id="seatForm" action="/spam/c_mypage/seatInsert" method="POST">
            <input type="hidden" name="seat_number" id="selectedSeatsInput">
            <input type="hidden" name="room_id" value="<%= request.getParameter("room_id") %>">
        </form>
        <div class="seat_contaner">
            <label for="movie">
                자리를 선택해 주세요
            </label>
        </div>
        <ul class="s_showcase">
            <li class="s_li">
                <div class="selectedSeatIcon"></div>
                <small class="s_small">선택한 자리</small>
            </li>
        </ul>

        <div class="Stable">
            <div class="Ctable"></div>
            <div class="s_row">
                <span class="s_seat">1</span>
                <span class="s_seat">2</span>
                <span class="s_seat">3</span>
                <span class="s_seat">4</span>
                <span class="s_seat">5</span>
                <span class="s_seat">6</span>
                <span class="s_seat">7</span>
                <span class="s_seat">8</span>
            </div>

            <div class="s_row">
                <span class="s_seat">9</span>
                <span class="s_seat">10</span>
                <span class="s_seat">11</span>
                <span class="s_seat">12</span>
                <span class="s_seat">13</span>
                <span class="s_seat">14</span>
                <span class="s_seat">15</span>
                <span class="s_seat">16</span>
            </div>

            <div class="s_row">
                <span class="s_seat">17</span>
                <span class="s_seat">18</span>
                <span class="s_seat">19</span>
                <span class="s_seat">20</span>
                <span class="s_seat">21</span>
                <span class="s_seat">22</span>
                <span class="s_seat">23</span>
                <span class="s_seat">24</span>
            </div>

            <div class="s_row">
                <span class="s_seat">25</span>
                <span class="s_seat">26</span>
                <span class="s_seat">27</span>
                <span class="s_seat">28</span>
                <span class="s_seat">29</span>
                <span class="s_seat">30</span>
                <span class="s_seat">31</span>
                <span class="s_seat">32</span>
            </div>

            <div class="s_row">
                <span class="s_seat">33</span>
                <span class="s_seat">34</span>
                <span class="s_seat">35</span>
                <span class="s_seat">36</span>
                <span class="s_seat">37</span>
                <span class="s_seat">38</span>
                <span class="s_seat">39</span>
                <span class="s_seat">40</span>
            </div>

            <div class="s_row">
                <span class="s_seat">41</span>
                <span class="s_seat">42</span>
                <span class="s_seat">43</span>
                <span class="s_seat">44</span>
                <span class="s_seat">45</span>
                <span class="s_seat">46</span>
                <span class="s_seat">47</span>
                <span class="s_seat">48</span>
            </div>
        </div>
        <br>
        <div class="sbutton-container">
            <input type="submit" class="myChooseButton" value="선택완료" form="seatForm">
        </div>
    </section>
    <%@ include file="footer.jsp" %>
</body>
<script>
   document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const room_id = urlParams.get("room_id");
    const submitButton = document.querySelector(".myChooseButton");
    const seats = document.querySelectorAll(".s_seat"); // 모든 좌석 요소 선택
    const selectedSeats = []; // 선택된 좌석을 저장하는 배열
    const selectedSeatsInput = document.getElementById("selectedSeatsInput"); // hidden input 요소

    // 이전에 선택한 좌석 정보를 로컬 스토리지에서 가져와서 화면에 반영
    const selectedSeatsFromStorage = localStorage.getItem(`selectedSeats_${room_id}`);
    if (selectedSeatsFromStorage) {
        const selectedSeatsArray = selectedSeatsFromStorage.split(",");
        selectedSeatsArray.forEach(seatNumber => {
            const seat = document.querySelector(`.s_seat:nth-child(${seatNumber})`);
            if (seat && !seat.classList.contains("occupiedSeat")) {
                seat.classList.add("selectedSeat");
            }
        });
    }

    // 이전에 색이 바뀐 좌석 정보를 로컬 스토리지에서 가져와서 화면에 반영
    const coloredSeatsFromStorage = localStorage.getItem(`coloredSeats_${room_id}`);
    if (coloredSeatsFromStorage) {
        const coloredSeatsArray = coloredSeatsFromStorage.split(",");
        coloredSeatsArray.forEach(seatNumber => {
            const seat = document.querySelector(`.s_seat:nth-child(${seatNumber})`);
            if (seat && !seat.classList.contains("occupiedSeat")) {
                seat.style.backgroundColor = "#6feaf6"; // 원하는 색상으로 변경
            }
        });
    }
    
    seats.forEach((s_seat) => {
        s_seat.addEventListener("click", function () {
            if (!s_seat.classList.contains("occupiedSeat")) {
                if (s_seat.classList.contains("selectedSeat")) {
                    // 이미 선택된 좌석을 다시 클릭하면 선택 해제
                    s_seat.classList.remove("selectedSeat");
                    const index = selectedSeats.indexOf(s_seat.textContent);
                    if (index !== -1) {
                        selectedSeats.splice(index, 1);
                    }
                } else {
                    // 좌석이 비어 있고 선택되지 않았을 때 선택
                    s_seat.classList.add("selectedSeat");
                    selectedSeats.push(s_seat.textContent);
                }
                // 선택된 좌석 목록 업데이트
                const selectedSeats = Array.from(document.querySelectorAll(".selectedSeat")).map(seat => seat.textContent);
                const selectedSeatsDiv = document.getElementById("seat_number");
                selectedSeatsDiv.textContent = `선택한 자리: ${selectedSeats.join(", ")}`;
                
                // hidden input에 선택된 좌석 정보 설정
                selectedSeatsInput.value = selectedSeats.join(","); 

                // 선택한 좌석 정보를 로컬 스토리지에 저장
                localStorage.setItem(`selectedSeats_${room_id}`, selectedSeatsArray.map(seat => Array.from(seats).indexOf(seat) + 1).join(","));

                // 좌석 색상 정보를 로컬 스토리지에 저장
                localStorage.setItem(`coloredSeats_${room_id}`, selectedSeatsArray.map(seat => Array.from(seats).indexOf(seat) + 1).join(","));
            }
        });
    });
// 양식 제출 버튼을 클릭했을 때
submitButton.addEventListener("click", function () {
        // 선택된 좌석 정보를 form의 hidden input에 할당
        selectedSeatsInput.value = Array.from(seats)
            .filter(seat => seat.classList.contains("selectedSeat"))
            .map(seat => Array.from(seats).indexOf(seat) + 1)
            .join(",");

        
        // room_id도 양식에 추가
        const room_id_input = document.createElement("input");
        room_id_input.type = "hidden";
        room_id_input.name = "room_id";
        room_id_input.value = room_id;
        seatForm.appendChild(room_id_input);

        // form을 제출
        seatForm.submit();
    });
    

    
});





</script>
</html>