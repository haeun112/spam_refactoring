package com.spam9700.spam.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CommentDto {
    private int comment_id;
    private int board_id;
    private String user_id;
    private String comment_content;
    private LocalDateTime comment_date;

}