package com.spam9700.spam.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RatingDto {
    private int rating_id;
    private int rating_value;
    private String customer_id;
    private int room_id;
}
