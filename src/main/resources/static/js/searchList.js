$(document).ready(function() {

    

// 검색 버튼을 눌렀을 때
$("#btn_search").click(function() {
    const region = $("#region").val();
    const keyword = $("#total_ipt_keyword").val();
    console.log("Search button clicked. Region:", region, "Keyword:", keyword); // 화긘
    console.log($("#btn_search").length);  // 1이 출력되어야 함

    performSearch(region, keyword);
});

// 지역이나 검색어가 변경되었을 때
$("#region, #total_ipt_keyword").change(function() {
    const region = $("#region").val();
    const keyword = $("#total_ipt_keyword").val();
    console.log("Region or keyword changed. Region:", region, "Keyword:", keyword); // 화긘
    performSearch(region, keyword);
});



// 페이징 처리
$(".pagination a").click(function (e) {
    // e.preventDefault();
    var page = $(this).text();
    var region = $("#region").val();
    var searchKeyword = $("#total_ipt_keyword").val();

    performPagingSearch(region, searchKeyword, page);
});

function performSearch(region, keyword) {
    console.log("Performing search with region:", region, "and keyword:", keyword);

    $.ajax({
        url: '/spam/searchRooms',
        type: 'GET',
        data: {
            region: region,
            searchKeyword: keyword
        },
        dataType: 'json',
        success: function (data) {
            console.log("Received data:", data);

            // 독서실 목록을 업데이트
            updateStudyRoomList(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("Error:", textStatus, errorThrown);
        }
    });
}

function performPagingSearch(region, searchKeyword, page) {
    console.log("Performing paging search with region:", region, "keyword:", searchKeyword, "page:", page);

    $.ajax({
        type: "GET",
        url: "/searchRooms",
        data: {
            region: region,
            searchKeyword: searchKeyword,
            page: page
        },
        success: function (data) {
            console.log("Received data:", data);

            // 독서실 목록을 업데이트
            updateStudyRoomList(data);
        },
        error: function () {
            console.error("Error occurred during pagination request.");
        }
    });
}

function updateStudyRoomList(data) {
    $("#studyRoomList ul").empty();

    data.forEach(function (studyRoom) {
        const studyRoomElement = `
            <li>
                <strong>독서실 이름:</strong> <a href="/spam/${studyRoom.room_name}">${studyRoom.room_name}</a> <br>
                <strong>지역:</strong> ${studyRoom.region} <br>
                <strong>시간당 가격:</strong> ${studyRoom.time_price} <br>
                <strong>하루 가격:</strong> ${studyRoom.day_price} <br>
                <strong>설명:</strong> ${studyRoom.room_description}
            </li>
        `;

        $("#studyRoomList ul").append(studyRoomElement);
    });
}
























// function performSearch(region, keyword) {
//     console.log("Performing search with region:", region, "and keyword:", keyword);  // 검색 정보 로깅
  
//     $.ajax({
//         url: '/spam/searchRooms', // 서버의 검색 API
//         type: 'GET',
//         data: {
//             region: region,
//             searchKeyword: keyword
//         },
//         dataType: 'json',
//         success: function(data) {
//             console.log("Received data:", data);  // 받은 데이터 로깅
//             // console.log("Ajax success. Data received:", data); // 화긘

//             // 독서실 목록을 비웁니다
//             $("#studyRoomList ul").empty();

//             // data 변수에는 서버에서 반환된 JSON 데이터가 들어있음
//             // 여기에 독서실 목록을 업데이트하는 코드를 작성
//             data.forEach(function(studyRoom) {
//                 const studyRoomElement = `
//                     <li>
//                         <strong>독서실 이름:</strong> <a href="/spam/${studyRoom.room_name}">${studyRoom.room_name}</a> <br>
//                         <strong>지역:</strong> ${studyRoom.region} <br>
//                         <strong>시간당 가격:</strong> ${studyRoom.time_price} <br>
//                         <strong>하루 가격:</strong> ${studyRoom.day_price} <br>
//                         <strong>설명:</strong> ${studyRoom.room_description}
//                     </li>
//                 `;
            
//                 $("#studyRoomList ul").append(studyRoomElement);
//             });
            
//         },
//         error: function(jqXHR, textStatus, errorThrown) {
//             console.log("Error:", textStatus, errorThrown);  // 에러 정보 로깅
//         // error: function(xhr, status, error) {
//         //     console.log("Ajax error:", status, error); // 콘솔 화긘


//         }
//     });
// }
});