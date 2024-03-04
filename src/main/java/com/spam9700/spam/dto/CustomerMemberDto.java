package com.spam9700.spam.dto;


import lombok.Data;

@Data
public class CustomerMemberDto {
    private String customer_id;
    private String customer_pwd;
    private String customer_name;
    private String customer_email;
    private String customer_birth;
    // private LocalDate customer_birth;

    private String customer_phone;
}
