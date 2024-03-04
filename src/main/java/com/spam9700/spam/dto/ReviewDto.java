package com.spam9700.spam.dto;



import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReviewDto {
    private int review_id;
    private String review_content;
    private int rating;
    private String customer_id;
    private int room_id;
    private String room_name;
    private LocalDateTime review_date;

    
}
