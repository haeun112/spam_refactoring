package com.spam9700.spam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spam9700.spam.dto.CustomerMemberDto;
import com.spam9700.spam.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/main")
    public String mainPage() {
        log.info("메인 페이지");
        return "main";
    }

    // @GetMapping("/search")
    // public String search() {
    //     log.info("검색창");
    //     return "searchList";
    // }

    @GetMapping("/qna_list")
    public String qnaboard() {
        return "qnaBoard";
    }

    @GetMapping("/i_mypage")
    public String iMypage(HttpSession session, Model model) {
        log.info("get 마이페이지");
        
        // 세션에서 저장된 회원 ID 가져오기
        String customer_id = (String) session.getAttribute("customer_id");

        CustomerMemberDto customerMemberDto = memberService.getCustomerInfoById(customer_id);
        session.setAttribute("customerMemberDto", customerMemberDto);
        model.addAttribute("customerMemberDto", customerMemberDto);

        return "iMypage";
    }

    @PostMapping("/i_mypage")
    public String updateMypage(CustomerMemberDto customerMemberDto, HttpSession session){
        log.info("customerMemberDto:{}", customerMemberDto);

        boolean result = memberService.updateMypage(customerMemberDto);
        if(result){
            log.info("업데이트 성공");
            return "redirect:/i_mypage";
        }   
        log.info("업데이트 실패");
        return "redirect:/i_mypage";
    }
    
     @GetMapping("/res")
    public String resPage() {
        log.info("res 페이지");
        return "res";
    }

     @GetMapping("/minibot")
    public String minibot() {
        return "minibot";
    }
    
}