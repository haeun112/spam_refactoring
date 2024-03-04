package com.spam9700.spam.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.spam9700.spam.dto.QnaBoardDto;
import com.spam9700.spam.dto.ReservationDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.dto.WishListDto;

@Mapper
public interface MypageDao {

    int insertReview(ReviewDto reviewDto);

    List<ReservationDto> getReservationListByCustomerId(String customer_id, int offset, int pageSize);

    List<ReviewDto> getReviewListByCustomerId(String customer_id, int offset, int pageSize);

    List<QnaBoardDto> getQnaListByUserId(String customer_id, int offset, int pageSize);

    int getTotalReservationsByCustomerId(String customer_id);

    int getTotalReviewsByCustomerId(String customer_id);

    int getTotalQnaListByCustomerId(String customer_id);

    List<WishListDto> getWishListWithRoomNameByCustomerId(@Param("customerId") String customer_id, 
                                                          @Param("offset") int offset, 
                                                          @Param("pageSize") int pageSize);

    int getTotalWishListByCustomerId(String customer_id);

    void cancelReservation(int reservation_id);

    

    
}
