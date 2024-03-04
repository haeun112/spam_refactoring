package com.spam9700.spam.dto;

import java.util.List;

import lombok.Data;

@Data
public class RoomPageDto {
    private List<DetailPageDto> roomDataPage;
    private int currentPage;
    private int totalPages;
    private int pageNum;
    private int pageSize;

     
}
