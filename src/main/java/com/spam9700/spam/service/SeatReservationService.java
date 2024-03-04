package com.spam9700.spam.service;

import com.spam9700.spam.dao.SeatReservationDao;
import com.spam9700.spam.dto.ReservationDto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam9700.spam.dao.SeatReservationDao;
import com.spam9700.spam.dto.ReservationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SeatReservationService {

    @Autowired
    private SeatReservationDao seatReservationDao;

    @Transactional
    public void saveReservation(ReservationDto reservationDto) {

        seatReservationDao.saveReservation(reservationDto);

    }

    public String getRoomNameByRoomId(String room_id) {
        return seatReservationDao.getRoomNameByRoomId(room_id);
    }

    // 예약 생성 서비스 메서드
    public void createReservation(ReservationDto reservationDto) {
        // 여기에서 예약 관련 비즈니스 로직을 수행하고
        // ReservationDao를 사용하여 데이터베이스에 예약 정보를 저장합니다.
        seatReservationDao.insertReservation(reservationDto);
    }

    public void saveReservations(ReservationDto reservationDto) {
        seatReservationDao.saveReservation(reservationDto);
    }

    public List<ReservationDto> getReservedTimes(ReservationDto request) {
        // 클라이언트로부터 받은 request 객체에서 필요한 정보를 추출합니다.
        int roomId = request.getRoom_id();
        String seatNumber = request.getSeat_number();
        LocalDateTime startTime = request.getStart_time();
        LocalDateTime endTime = request.getEnd_time();

        // 해당 시간대에 예약된 시간 목록을 데이터베이스에서 가져오는 쿼리를 호출합니다.
        List<ReservationDto> reservedTimes = seatReservationDao.findReservedTimes(roomId, seatNumber, startTime,
                endTime);

        // 가져온 시간 목록을 반환합니다.
        return reservedTimes;
    }

}
