package com.spam9700.spam.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class QnaBoardDto {
    private int board_id;
    private String user_id; // 작성자 ID (고객 또는 기업 회원 아이디)
    private String board_title;
    private String board_content;
    private LocalDateTime board_date;
}
