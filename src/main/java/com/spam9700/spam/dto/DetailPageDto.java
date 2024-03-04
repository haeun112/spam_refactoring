package com.spam9700.spam.dto;
import lombok.Data;

@Data
public class DetailPageDto {
    private int room_id;
    private String company_id;
    private String room_name;
    private String room_description;
    private String region;
    private int time_price;
    private int day_price;
    private String bs_time;


}
