package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.spam9700.spam.dto.SeatDto;

@Mapper
public interface SeatDao {

    void saveSelectedSeats(int room_id, String seat_number);

    void deletePreviousSeatsByRoomId(int room_id);

    List<SeatDto> getSeatsByRoomName(String room_name);

    List<SeatDto> getAllSeatsOfData();

    List<SeatDto> getAllSeats();

}
