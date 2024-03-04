package com.spam9700.spam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class paymentController {
     @GetMapping("/test")
    public String test(){
        return "payment";
    }
 
    @GetMapping("/return")
    public String hi(){
        return "return";
    }

    
    @GetMapping("/bot")
    public String chat(){
        return "bot";
    }
}
//     @Controller
//     @RequestMapping("/payment")
//     public class PaymentController {

//     @PostMapping("/process")
//     public String processPayment(@ModelAttribute PaymentForm paymentForm, Model model) {
//         // 결제 처리 로직
//         boolean paymentSuccess = paymentService.processPayment(paymentForm);

//         if (paymentSuccess) {
//             // 결제가 성공하면 데이터를 DB에 저장
//             reservationService.saveReservation(paymentForm.getReservation());
//             return "payment/success";
//         } else {
//             model.addAttribute("error", "Payment failed. Please try again.");
//             return "payment/error";
//         }
//     }
// }

// }
