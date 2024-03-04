package com.spam9700.spam.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ChatbotController {
    @PostMapping("/chatbot")
    public String handleUserInput(@RequestBody String userMessage) {
        String botResponse = "";

        if ("로그인 관련".equals(userMessage)) {
            botResponse = "로그인 관련 정보를 제공해드릴게요.";
        } else if ("리뷰 남기기".equals(userMessage)) {
            botResponse = "리뷰를 남기는 방법에 대해 안내해드릴게요.";
        } else if ("비품 관련".equals(userMessage)) {
            botResponse = "비품 관련 문의 사항을 알려주세요.";
        }

        return botResponse;
    }
}
