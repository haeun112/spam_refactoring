package com.spam9700.spam.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReservationDto {
    private int reservation_id;
    private String customer_id;
    private String seat_number;
    private int room_id;
    private String room_name;
    private String status;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime start_time;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime end_time;

}
