package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dao.WishListDao;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReviewDto;
import com.spam9700.spam.dto.WishListDto;

// 독서실 상세페이지 

@Service
public class DetailPageService {
    private final DetailPageDao detailPageDao;

    @Autowired
    public DetailPageService(DetailPageDao detailPageDao){
        this.detailPageDao = detailPageDao;
    }

    @Autowired
    public WishListService wishListService;
    
    @Autowired
    public WishListDao wishListDao;

    public DetailPageDto getStudyRoomByRoomName(String room_name){
        return detailPageDao.getStudyRoomByRoomName(room_name);
    }

    public String getOpenTimeByStudyRoom(String room_name) {
        String room_description = detailPageDao.getOpenTimeByStudyRoom(room_name);
    
        // 조회한 room_description 값을 반환합니다.
        return room_description;
    }

        public List<DetailPageDto>getAllRooms(){
        return detailPageDao.getAllRooms();
    }

    public DetailPageDto getRomById(int room_id){
        return detailPageDao.getRoomById(room_id);
    }



    public List<DetailPageDto> getRoomsByComapny(String company_id){
        return detailPageDao.getRoomsByCompany(company_id);
    }

    public boolean reviewInsert(ReviewDto reviewDto) {
        return detailPageDao.reviewInsert(reviewDto);
    }

    public List<ReviewDto> getReviewsByRoomId(Integer room_id) {
        return detailPageDao.getReviewsByRoomId(room_id);
    }

    public List<DetailPageDto> searchRooms(String region, String searchKeyword) {
        return null;
    }
    public List<DetailPageDto> getRoomsByName(String room_name) {
        return detailPageDao.getRoomsByName(room_name);
    }


//찜

    public void removeFromWishList(WishListDto wishListDto) {
        // Wishlist 테이블에서 해당 데이터 삭제
        detailPageDao.removeFromWishList(wishListDto);
    }
    public void addToWishList(WishListDto wishListDto) {
         // Wishlist 테이블에 데이터 추가
         detailPageDao.addToWishList(wishListDto);
    }

    public int  toggleWishlist(WishListDto wishListDto) {
        int count = detailPageDao.isProductInWishList(wishListDto);
        if(count == 0){
            detailPageDao.addToWishList(wishListDto);
        }else{
            detailPageDao.removeFromWishList(wishListDto);
        }
        return count;
    }

    public boolean isRoomInWishlist(String customer_id, int room_id) {
        int count = detailPageDao.isRoomInWishlist(customer_id, room_id);
        return count > 0; // count가 0보다 크면 찜한 상태, 그렇지 않으면 찜하지 않은 상태
    }

 


  
}
