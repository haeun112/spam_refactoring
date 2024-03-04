package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.SeatDao;
import com.spam9700.spam.dto.SeatDto;

@Service
public class SeatService {

    @Autowired
    private final SeatDao seatDao;

    public SeatService(SeatDao seatDao) {
        this.seatDao = seatDao;
    }

    public List<SeatDto> getAllSeats() {
        // DAO를 통해 모든 좌석 정보를 데이터베이스에서 조회
        return seatDao.getAllSeats();
    }

    // public List<SeatDto> getSeatsByRoomId(int room_id) {
    // // DAO를 통해 특정 방의 좌석 정보를 데이터베이스에서 조회
    // return seatDao.getSeatsByRoomId(room_id);
    // }

    // public SeatDto reserveSeat(int seat_id) {
    // // DAO를 통해 좌석 예약 로직 구현
    // // 좌석 예약 상태를 변경하고 예약된 좌석 정보를 반환
    // return seatDao.reserveSeat(seat_id);
    // }
}
