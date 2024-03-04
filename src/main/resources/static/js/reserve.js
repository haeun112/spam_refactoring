$(document).ready(function () {
    // 시작 및 종료 시간 입력을 위한 timepicker 초기화
    $('.timepicker').timepicker({
        timeFormat: 'HH:mm',
        interval: 60, // 시간 간격 (분 단위)
        dynamic: false, // 수동 입력 비허용
        dropdown: false // 드롭다운 비활성화
    });

    // 시간 목록 생성
    const startTimeInput = $('#start-time');
    const endTimeInput = $('#end-time');
    const timeList = $('.time-list');

    for (let i = 0; i < 24; i++) {
        const li = $('<li>').text(i + ':00');
        timeList.append(li);
    }

    // 시간 선택 이벤트 처리
    timeList.on('click', 'li', function () {
            const selectedTime = $(this).text();
            // 클릭한 시간을 시작 시간과 종료 시간 입력란에 설정
            if (startTimeInput.val() === '') {
                startTimeInput.val(selectedTime);
            } else if (endTimeInput.val() === '') {
                // 종료 시간이 시작 시간보다 1시간 이상 늦어야 함
                const startHour = parseInt(startTimeInput.val().split(':')[0]);
                const endHour = parseInt(selectedTime.split(':')[0]);
                if (endHour >= startHour + 1) {
                    endTimeInput.val(selectedTime);
                } else {
                    alert('종료 시간은 시작 시간보다 1시간 이상 늦어야 합니다.');
                }
            } else {
                startTimeInput.val(selectedTime);
                endTimeInput.val('');
            }
        });

    const seats = document.querySelectorAll(".s_seat"); // 모든 좌석 요소 선택
    let selectedSeat = null; // 선택된 좌석 저장 변수

    // 좌석 번호를 포함한 배열 생성
    const seatNumbersList = [];
    for (let i = 1; i <= 48; i++) {
        seatNumbersList.push(i);
    }

    const seatNumbers = ${seatNumbersList};
    console.log(seatNumbers);

    seats.forEach((s_seat) => {
        const seatNumber = parseInt(s_seat.textContent); // 좌석 번호 추출 및 정수로 변환

        if (seatNumbers.includes(seatNumber)) {
            s_seat.classList.add("availableSeat"); // 배열에 해당 좌석 번호가 있으면 선택 가능
        } else {
            s_seat.classList.add("occupiedSeat"); // 배열에 해당 좌석 번호가 없으면 선택 불가능
        }

        s_seat.addEventListener("click", function () {
            if (s_seat.classList.contains("availableSeat")) {
                if (selectedSeat !== null) {
                    selectedSeat.classList.remove("selectedSeat");
                }

                s_seat.classList.add("selectedSeat");
                selectedSeat = s_seat;
                console.log(selectedSeat);
            }
        });
    });

    document.querySelector(".myChooseButton").addEventListener("click", function () {
        if (selectedSeat !== null) {
            // 이전에 표시된 달력을 숨깁니다.
            $("#datepicker").datepicker("destroy");

            const today = new Date().toISOString().slice(0, 10);

            // #datepicker div에 날짜 선택 달력을 표시합니다.
            $("#datepicker").datepicker({
                locale: 'ko',
                nextText: "다음",
                prevText: "이전",
                monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                dayNames: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dayNamesShort: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dayNamesMin: ["일", "월", "화", "수", "목", "금", "토", "일"],
                dateFormat: "yy-mm-dd",
                minDate: today,
                onSelect: function (dateText) {
                    console.log("선택한 날짜: " + dateText);

                    // 날짜 선택 시 .time-list 요소 표시
                    $(".time-list").css("display", "block"); // 시간 슬롯 표시

                    // 시간 슬롯 초기화
                    const startTime = $("#start-time").val();
                    const endTime = $("#end-time").val();
                    const timeList = document.querySelector('.time-list');
                    // timeList.innerHTML = '';

                    // for (let i = parseInt(startTime); i <= parseInt(endTime); i++) {
                    //     const li = document.createElement('li');
                    //     li.textContent = i + '시';
                    //     li.className = 'timeslot'; // 스타일링을 위한 클래스 추가 가능
                    //     timeList.appendChild(li);
                    // }
                },
            });

            // 달력 위치 설정 (조절 가능)
            $("#datepicker").datepicker("show");
        }
    });
});