package com.spam9700.spam.dto;

import java.util.List;

import lombok.Data;

@Data
public class WishListDto {
    private int wishlist_id;
    private String customer_id;
    private int room_id;
    private String room_name;
}
