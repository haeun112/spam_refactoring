package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.spam9700.spam.service.SeatReservationService;

import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spam9700.spam.dto.ReservationDto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api")
public class ReservationRestController {

    @Autowired
    private SeatReservationService seatReservationService;

    // @PostMapping("/checkDuplicateReservation")
    // @ResponseBody
    // public Map<String, Object> checkDuplicateReservation(@RequestBody ReservationDto reservationDto) {
    //     Map<String, Object> response = new HashMap<>();

    //     boolean isDuplicate = seatReservationService.isDuplicateReservation(
    //             reservationDto.getRoom_id(),
    //             reservationDto.getSeat_number(),
    //             reservationDto.getStart_time(),
    //             reservationDto.getEnd_time()

    //     );

    //     log.info("reservationDto: {}", isDuplicate);
    //     response.put("isDuplicate", isDuplicate);
    //     return response;
    // }

    // @PostMapping("/getReservationDetails")
    // public List<String> getReservedTimes(
    // @RequestParam int roomId,
    // @RequestParam String date) {
    // // 예약된 시간 목록을 가져오는 서비스 메서드를 호출합니다.
    // List<String> reservedTimes = seatReservationService.getReservedTimes(roomId,
    // date);
    // log.info("reservedTimes: {}", reservedTimes);
    // // 클라이언트에게 예약된 시간 목록을 응답으로 반환합니다.
    // return reservedTimes;
    // }

    @PostMapping("/getReservationDetails")
    public void getReservationDetails(@RequestBody ReservationDto request, HttpServletResponse response, Model model)
            throws IOException {
        // 클라이언트로부터 받은 request 객체를 사용하여 예약된 시간 슬롯을 가져오는 비즈니스 로직을 호출합니다.
        // 예약된 시간 슬롯은 List<String> 또는 다른 형태로 가져오세요.
        List<ReservationDto> reservedTimes = seatReservationService.getReservedTimes(request);
        log.info("reservedTimes: " + reservedTimes);

        if (reservedTimes != null) {
            // JSON 응답 생성
            List<String> timeStrings = new ArrayList<>();
            for (ReservationDto time : reservedTimes) {
                // start_time과 end_time을 String으로 변환하여 리스트에 추가
                String startTimeString = time.getStart_time().toString();
                String endTimeString = time.getEnd_time().toString();
                timeStrings.add(startTimeString);
                timeStrings.add(endTimeString);
            }

            // 리스트를 JSON 형식으로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonResponse = objectMapper.writeValueAsString(timeStrings);

            // JSON 응답을 클라이언트에게 보냅니다.
            response.setContentType("application/json");
            response.getWriter().write(jsonResponse);

        } else {
            // 예약 정보가 없는 경우 404 응답을 보냅니다.
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }

}
