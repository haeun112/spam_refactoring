package com.spam9700.spam.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.SeatDto;
import com.spam9700.spam.service.MemberService;
import com.spam9700.spam.service.SeatReservationService;
import com.spam9700.spam.service.StudycafeService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/{room_name}")
public class ReservationController {

    @Autowired
    private StudycafeService studycafeService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private SeatReservationService seatReservationService;

    // 기존의 상세 페이지 컨트롤러와 겹치지 않도록 별도의 URL을 사용
    @GetMapping("/reservation")
    public String reservationPage(HttpSession session, @PathVariable("room_name") String room_name, Model model) {

        // studycafeService를 이용하여 room_name을 기반으로 좌석 정보를 가져오는 service 메서드 호출
        List<SeatDto> seats = studycafeService.getSeatsByRoomName(room_name);
        // 모델에 좌석 정보를 추가하여 jsp 페이지로 전달
        // for(SeatDto sd : seats){
        // System.out.println(sd);
        // }

        List<Integer> seatNumbersList = new ArrayList<>();
        String seatNumber = null;
        String[] seatNumbers = null;
        for (SeatDto seat : seats) {
            seatNumber = seat.getSeat_number();
            seatNumbers = seatNumber.split(",");

            for (String number : seatNumbers) {
                try {
                    int parsedNumber = Integer.parseInt(number.trim());
                    seatNumbersList.add(parsedNumber);
                    // System.out.println("Extracted number: " + parsedNumber); // 숫자가 올바르게 추출되었을 때
                    // 출력
                } catch (NumberFormatException e) {
                    System.err.println("Invalid number format: " + number); // 숫자로 변환할 수 없는 경우 오류 메시지 출력
                }
            }
        }

        model.addAttribute("seats", seats);
        model.addAttribute("room_name", room_name);
        // model.addAttribute("seatNumber", seatNumber);
        model.addAttribute("seatNumbersList", seatNumbersList);

        return "seat"; // 예약 페이지 템플릿 이름 또는 경로
    }

    // 방 ID를 세션에서 가져오는 메서드
    private int getRoomIdFromSession(HttpSession session) {
        // 세션에서 방 ID를 가져오는 로직을 구현해야 합니다.
        // 세션에서 "room_id" 속성을 가져오도록 변경합니다.
        Object roomIdObj = session.getAttribute("room_id");
        if (roomIdObj != null && roomIdObj instanceof Integer) {
            return (Integer) roomIdObj;
        }
        // 세션에서 "room_id" 속성을 찾을 수 없는 경우 예외 처리 또는 기본값 반환
        return 1; // 기본값으로 1을 반환합니다. 수정이 필요한 경우 예외 처리 등을 수행하세요.
    }

    // 고객 ID를 세션에서 가져오는 메서드
    private String getCustomerIdFromSession(HttpSession session) {
        // 세션에서 고객 ID를 가져오는 로직을 구현해야 합니다.
        // 세션에서 "customer_id" 속성을 가져오도록 변경합니다.
        Object customerIdObj = session.getAttribute("customer_id");
        if (customerIdObj != null && customerIdObj instanceof String) {
            return (String) customerIdObj;
        }
        // 세션에서 "customer_id" 속성을 찾을 수 없는 경우 예외 처리 또는 기본값 반환
        return "default_customer_id"; // 기본값으로 "default_customer_id"를 반환합니다. 수정이 필요한 경우 예외 처리 등을 수행하세요.
    }

    // 결제 완료 처리
    @PostMapping("/rsv")
    public String processPayment(@PathVariable String room_name,
            @RequestParam("room_id") int room_id,
            @RequestParam("seat_number") String seat_number,
            @RequestParam("start_time") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") LocalDateTime startTime,
            @RequestParam("end_time") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") LocalDateTime endTime,
            HttpSession session) { // HttpSession을 파라미터로 받아 세션을 사용합니다.

        String customer_id = getCustomerIdFromSession(session); // 세션에서 고객 ID를 가져옵니다.

        ReservationDto reservationDto = new ReservationDto();
        reservationDto.setCustomer_id(customer_id); // 세션에서 가져온 고객 ID를 설정합니다.
        reservationDto.setSeat_number(seat_number);
        reservationDto.setRoom_id(room_id);
        reservationDto.setStatus("1"); // 결제가 완료되었음을 나타내는 상태
        reservationDto.setStart_time(startTime);
        reservationDto.setEnd_time(endTime);

        // 데이터베이스에 저장
        seatReservationService.saveReservation(reservationDto);
        log.info("예약 성공");
        return "redirect:/i_mypage/list"; // 결제가 성공적으로 완료되면 메인 페이지로 리다이렉트
    }

    @GetMapping("/rsv")
    public String getReservationPage(HttpSession session, @PathVariable("room_name") String room_name,
            @RequestParam("start_time") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") LocalDateTime start_time,
            @RequestParam("end_time") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") LocalDateTime end_time,
            @RequestParam("seat_number") String seat_number, Model model) {
        String customer_id = getCustomerIdFromSession(session);

        ReservationDto reservationDto = new ReservationDto();
        reservationDto.setCustomer_id(customer_id);

        // start_timeStr와 end_timeStr에서 "T"를 공백으로 대체
        String start_timeStr = start_time.toString().replace("T", " ");
        String end_timeStr = end_time.toString().replace("T", " ");

        log.info("Received start_time: {}", start_timeStr);
        log.info("Received end_time: {}", end_timeStr);
        log.info("seat_number: {}", seat_number);

        System.out.println("------------------------------" + customer_id + "----------------------------------");

        model.addAttribute("room_name", room_name);
        model.addAttribute("seat_number", seat_number);
        model.addAttribute("start_time", start_timeStr);
        model.addAttribute("end_time", end_timeStr);
        model.addAttribute("customer_id", customer_id);

        return "payment";
    }

    @PostMapping("/cancel")
    public String cancelReservation(@RequestParam("reservation_id") int reservation_id) {
        
        studycafeService.cancelReservation(reservation_id);
        return "redirect:/i_mypage/list";
    }

}