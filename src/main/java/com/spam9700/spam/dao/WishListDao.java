package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.spam9700.spam.dto.WishListDto;

@Mapper
public interface WishListDao {

    List<WishListDto> getWishListData();


    // int getTotalWishlistCount(@Param("company_id") String company_id);


    int getTotalWishlistCountByCompanyId(@Param("company_id") String company_id);
   
  
}
