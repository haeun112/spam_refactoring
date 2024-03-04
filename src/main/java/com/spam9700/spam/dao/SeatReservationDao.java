package com.spam9700.spam.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.spam9700.spam.dto.ReservationDto;

@Mapper
public interface SeatReservationDao {

    boolean insertReservation(ReservationDto reservationDto);

    void saveReservation(ReservationDto reservationDto);

    List<String> findReservedTimesByRoomAndDate(int roomId, String date);

    List<ReservationDto> findReservedTimes(int roomId, String seatNumber, LocalDateTime startTime,
            LocalDateTime endTime);

    String getRoomNameByRoomId(String room_id);

    String getCustomerById(@Param("customer_id") String customerId);

    void insertReservations(ReservationDto reservationDto);

    // 예약 조회 메서드 (고객 ID로 조회)
    List<ReservationDto> selectReservationsByCustomerId(@Param("customer_id") String customer_id);

    boolean checkCustomerExistence(String customer_id);

    boolean checkSeatExistence(String seat_number);

    boolean checkRoomExistence(int room_id);

    void savePaymentRecord(ReservationDto rsd);

}