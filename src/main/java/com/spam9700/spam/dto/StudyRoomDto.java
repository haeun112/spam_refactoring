package com.spam9700.spam.dto;

import java.sql.Time;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "study_room")
public class StudyRoomDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private Long roomId;
    
    @Column(name = "category_id")
    private Long categoryId;
    
    @Column(name = "company_id")
    private String companyId;
    
    @Column(name = "room_name")
    private String roomName;
    
    @Column(name = "room_description", columnDefinition = "TEXT")
    private String roomDescription;
    
    @Column(name = "reservation_period")
    private Time reservationPeriod;
    
    @Column(name = "time_price")
    private int timePrice;
    
    @Column(name = "day_price")
    private int dayPrice;

}
