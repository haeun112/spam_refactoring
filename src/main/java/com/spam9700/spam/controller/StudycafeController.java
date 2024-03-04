package com.spam9700.spam.controller;

import java.util.Collections;
import java.util.List;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.ReviewDto;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.RatingDto;
import com.spam9700.spam.dto.ReviewDto;


import com.spam9700.spam.service.StudycafeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.spam9700.spam.service.DetailPageService;


import com.spam9700.spam.dto.WishListDto;

import com.spam9700.spam.service.WishListService;


import lombok.extern.slf4j.Slf4j;



@Slf4j //log.info
@Controller
public class StudycafeController {

    @Autowired
    private StudycafeService studycafeService;
    @Autowired
    private DetailPageService detailPageService;
    // 상세 페이지 뷰





    @GetMapping("/{room_name}")
    public String detailPage(@PathVariable("room_name") String room_name, Model model, HttpSession session) {
        DetailPageDto roomDetail = detailPageService.getStudyRoomByRoomName(room_name);
        model.addAttribute("roomDetail", roomDetail);
        log.info("roomDetail:{}", roomDetail);
        // test에 merge 시 이 코드로 변경 _ 

        List<DetailPageDto> rnData = detailPageService.getRoomsByName(room_name);
          for(DetailPageDto rnd : rnData){
            System.out.println(rnd);
        } //rnData 데이터값이 전달되는지 확인
        model.addAttribute("rnData", rnData);
        
        if (roomDetail != null) {
            Integer room_id = roomDetail.getRoom_id(); // "room_id"를 직접 가져옵니다.
            session.setAttribute("room_id", room_id);
            log.info("독서실 room_id:{}", room_id);
            model.addAttribute("room_id", room_id);
            model.addAttribute("room_name", roomDetail.getRoom_name());
            // 추가 데이터도 필요한 경우 모델에 추가하세요.
            return "detailPage"; // 적절한 뷰 이름을 사용하세요.
        } else {
            // 해당 방이 존재하지 않는 경우에 대한 처리
            // 예: 에러 페이지로 리다이렉트 또는 에러 메시지를 표시하도록 수정하세요.
            return "redirect:/member/i_login"; // 에러 페이지로 리다이렉트
        }
    }

    @GetMapping("/wishlist/check")
    public ResponseEntity<String> checkWishlistStatus(@RequestParam("customer_id") String customer_id, @RequestParam("room_id") int room_id){
        boolean isWishlisted = detailPageService.isRoomInWishlist(customer_id, room_id);
        
        if(isWishlisted){
            return ResponseEntity.ok("Added to Wishlist");
        }else{
            return ResponseEntity.ok("Removed from Wishlist");
        }
    }

    @PostMapping("/wishlist/toggle")
    public ResponseEntity<String> toggleWishlist(@RequestBody WishListDto wishListDto) {
       //로그인 여부 확인 ( 비회원일 시 에러 응답)
       if (wishListDto.getCustomer_id() == null){
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 후에 찜하기가 가능합니다.");
       }
       //중복 클릭 여부 확인(찜한 상태: 1, 찜 안한 상태: 0)
       int toggleResult = detailPageService.toggleWishlist(wishListDto);
       if(toggleResult == 0){
        System.out.println("+++++++++++++++++++++++"+toggleResult+"+++++++++++++++++++++");
        return ResponseEntity.ok("Added to Wishlist");
       }else{
        return ResponseEntity.ok("Removed from Wishlist");
       }
       
    }





    // 검색 결과 뷰
    @GetMapping("/search")
    public String searchStudyRooms(@RequestParam(name = "region", required = false) String region,
                                   @RequestParam(name = "searchKeyword", required = false) String searchKeyword,
                                   @RequestParam(name = "page", defaultValue = "1") int page,
                                   @RequestParam(name = "pageSize", defaultValue = "5") int pageSize,
                                   Model model, HttpSession session) {
    
        String company_id = (String) session.getAttribute("company_id");
    
        // 페이징 정보 계산
        int totalReviews = studycafeService.getTotalSearchListByCompanyId(company_id);
        int totalPages = (int) Math.ceil((double) totalReviews / pageSize);
    
        List<DetailPageDto> searchResults = studycafeService.searchRooms(region, searchKeyword, company_id, page, pageSize);
                                    
        // 로그 추가
        System.out.println("currentPage: " + page);
        System.out.println("totalPages: " + totalPages);
        System.out.println("searchResults size: " + searchResults.size());
    
        model.addAttribute("detailPageDtos", searchResults);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
    
        return "searchList";
    }
    

 // Ajax 요청을 처리하는 메서드
  @GetMapping("/searchRooms")
  @ResponseBody
  public List<DetailPageDto> searchRoomsAjax(@RequestParam(name = "region", required = false) String region,
                                   @RequestParam(name = "searchKeyword", required = false) String searchKeyword) {
    return studycafeService.searchRooms(region, searchKeyword, searchKeyword, 1, 5);
  }

  @PostMapping(value = "/{room_name}/review", consumes = "application/x-www-form-urlencoded")
  @Transactional
  @ResponseBody
  public ResponseEntity < String > review(@PathVariable("room_name") String room_name,
      @RequestParam("rating") int rating,
      @RequestParam("review_content") String review_content,
      @RequestParam("customer_id") String customer_id,
      Model model, HttpSession session) {

      // 세션에서 "room_id" 값을 가져옵니다.
      Integer room_id = (Integer) session.getAttribute("room_id");

      if (room_id != null) {
          // ReviewDto 객체 생성
          ReviewDto reviewDto = new ReviewDto();
          reviewDto.setCustomer_id(customer_id);
          reviewDto.setRoom_id(room_id);
          reviewDto.setRating(rating);
          reviewDto.setReview_content(review_content);

          boolean result = detailPageService.reviewInsert(reviewDto);

          if (result) {
              // 리뷰 작성이 성공한 경우
              return ResponseEntity.ok("success");
          } else {
              // 리뷰 작성이 실패한 경우
              return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("error");
          }
      } else {
          // 해당 방이 존재하지 않는 경우에 대한 처리
          // 예: 에러 페이지로 리다이렉트 또는 에러 메시지를 표시하도록 수정하세요.
          return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Room not found");
      }
  }



     @GetMapping("/{room_name}/reviews")
     @ResponseBody
     public List<ReviewDto> getReviews(@PathVariable("room_name") String room_name,
                                @RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "5") int pageSize,
                                     Model model, HttpSession session){
      
      System.out.println("room_name:"+room_name);
      Integer room_id = (Integer) session.getAttribute("room_id");
      System.out.println("id="+room_id);

      List < ReviewDto > reviewList = detailPageService.getReviewsByRoomId(room_id);
      
      //페이징 로직 추가
      int totalStart = (page - 1) * pageSize;
      int totalEnd = Math.min(totalStart + pageSize, reviewList.size());
      
      if (totalStart < totalEnd) {
          return reviewList.subList(totalStart, totalEnd);  //List-->잭슨-->Json   
      } else {
          return Collections.emptyList();
      }
  }
}
