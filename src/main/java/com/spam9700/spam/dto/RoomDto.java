package com.spam9700.spam.dto;

import lombok.Data;

@Data
public class RoomDto {
    private int room_id;
    private int category_id;
    private String company_id; // 기업 회원 ID를 사용하여 독서실과 회사(기업)를 연결
    private String room_name;
    private String room_description;
    private int time_price;
    private int day_price;
    private int reservation_period;

    // 생성자, getter 및 setter 메서드
}
