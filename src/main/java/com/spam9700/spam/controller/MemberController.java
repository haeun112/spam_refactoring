package com.spam9700.spam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spam9700.spam.dto.CompanyMemberDto;
import com.spam9700.spam.dto.CustomerMemberDto;
import com.spam9700.spam.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private final MemberService memberService;

    @Autowired
    private PlatformTransactionManager transactionManager;

    private void invalidateSession(HttpSession session) {
        session.invalidate();
    }

    @GetMapping("/joinfrm")
    public String joinForm() {
        log.info("회원가입 선택 화면");
        return "joinFrm";
    }

    @GetMapping("/i_join")
    public String iJoinForm() {
        log.info("개인 회원가입 화면");
        return "i_join";
    }

    @GetMapping("/c_join")
    public String cJoinForm() {
        log.info("기업 회원가입 화면");
        return "c_join";
    }

    @PostMapping("/i_join")
    public String iJoin(CustomerMemberDto customerMemberDto, Model model, RedirectAttributes rttr) {
        model.addAttribute("cusmb", customerMemberDto);
        log.info("개인 회원가입 처리");
        log.info("customerMemberDto:{}", customerMemberDto);
        boolean result = memberService.iJoin(customerMemberDto);
        if (result) {
            model.addAttribute("msg", "가입성공");
            rttr.addFlashAttribute("msg", "가입성공");
            return "redirect:/member/i_login";
        } else {
            model.addAttribute("msg", "가입실패");
            return "i_join";
        }
    }

    @PostMapping("/c_join")
    public String cJoin(CompanyMemberDto companyMemberDto, Model model, RedirectAttributes rttr) {
        model.addAttribute("cusmb", companyMemberDto);
        log.info("기업 회원가입 처리");
        log.info("companyMemberDto:{}", companyMemberDto);
        boolean result = memberService.cJoin(companyMemberDto);
        if (result) {
            model.addAttribute("msg", "가입성공");
            rttr.addFlashAttribute("msg", "가입성공");
            return "redirect:/member/c_login";
        } else {
            model.addAttribute("msg", "가입실패");
            return "c_join";
        }
    }

    @GetMapping("/i_login")
    public String iLoginForm() {
        log.info("개인로그인 화면");
        return "i_login";
    }

    @GetMapping("/c_login")
    public String cLoginForm() {
        log.info("기업로그인 화면");
        return "c_login";
    }

    @PostMapping("/i_login")
    public String iLogin(@RequestParam String customer_id, @RequestParam String customer_pwd, HttpSession session) {
        log.info("개인로그인 처리");
        log.info("id:{}, pwd:{}", customer_id, customer_pwd);

        boolean result = memberService.iLogin(customer_id, customer_pwd);
        if (result) {
            log.info("개인로그인 성공");
            session.setAttribute("loggedInUserId", customer_id); // 사용자 아이디를 세션에 저장
            session.setAttribute("customer_id", customer_id); // 사용자 아이디를 세션에 저장
            return "redirect:/main"; // 로그인 성공 시 홈 화면으로 이동
        } else {
            log.info("로그인 실패");
            return "i_login";
        }
    }

    @PostMapping("/c_login")
    public String cLogin(@RequestParam String company_id, @RequestParam String company_pwd,
            @RequestParam String company_businessnum, HttpSession session) {
        log.info("기업로그인 처리");
        log.info("id:{}, pwd:{}, businessnum:{}", company_id, company_pwd, company_businessnum);

        boolean loginResult = memberService.cLogin(company_id, company_pwd, company_businessnum);

        if (loginResult) {
            log.info("기업로그인 성공");

            // 로그인 성공 시, 세션에 필요한 정보를 저장
            session.setAttribute("company_id", company_id);
            CompanyMemberDto companyMemberDto = new CompanyMemberDto();
            companyMemberDto.setCompany_id(company_id);
            session.setAttribute("loggedInUser", companyMemberDto); // 기업 회원 정보 세션에 추가

            return "redirect:/main";
        } else {
            log.info("로그인 실패");
            return "c_login";
        }
    }

    @GetMapping("/check/id")
    public ResponseEntity<String> checkId(@RequestParam String customer_id, @RequestParam String company_id) {
        boolean idCheck = memberService.idCheck(customer_id, company_id);

        if (idCheck) {
            return ResponseEntity.ok("exists");
        } else {
            return ResponseEntity.ok("available");
        }
    }

    @GetMapping("/find/id")
    public String findIdForm() {
        return "findId"; // 아이디 찾기 뷰 페이지 이름
    }

    @PostMapping("/find/id")
    public String findId(@RequestParam String customer_name, @RequestParam String customer_email, Model model) {
        List<String> foundId = memberService.findId(customer_name, customer_email);

        if (foundId != null) {
            model.addAttribute("foundId", foundId);
        } else {
            model.addAttribute("notFound", true);
        }
        return "findIdResult"; // 아이디 찾기 결과를 보여주는 뷰 페이지 이름
    }

    @GetMapping("/find/pwd")
    public String findPwdForm() {
        return "findPwd";
    }

    @PostMapping("/find/pwd")
    public String findPwd(@RequestParam String customer_id, @RequestParam String customer_email, Model model) {
        String foundPwd = memberService.findPwd(customer_id, customer_email);

        if (foundPwd != null) {
            model.addAttribute("foundPwd", foundPwd);
        } else {
            model.addAttribute("notFound", true);
        }
        return "findPwdResult";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // Remove the loggedInUser attribute from the session
        session.invalidate(); // 세션 무효화
        return "redirect:/main"; // 로그아웃 후 홈 화면으로 이동
    }

    @PostMapping("/i_mypage/resign")
    public String resign(HttpSession session) {

        String customer_id = (String) session.getAttribute("customer_id");

        memberService.resign(customer_id);
        log.info("회원탈퇴1");

        invalidateSession(session); // 세션 무효화

        return "redirect:/main";
    }

    @PostMapping("/c_mypage/resign")
public String deleteUser(@RequestParam("company_id") String company_id, HttpSession session,
        RedirectAttributes redirectAttributes) {
    // 현재 로그인된 company_id를 세션에서 가져옴
    String loggedInCompanyId = (String) session.getAttribute("company_id");

    // 로그인된 사용자의 company_id와 탈퇴 요청에서 받은 companyId를 비교하여 처리
    if (loggedInCompanyId != null && loggedInCompanyId.equals(company_id)) {
        // 여기서 트랜잭션을 시작합니다.
        TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());
        
        try {
            // 먼저 리뷰를 삭제하는 쿼리 실행
            memberService.deleteReviewsByRoomId(company_id);

            // study_room 데이터 삭제 쿼리 실행
            memberService.deleteUserWithRooms(company_id);

            // 트랜잭션 커밋
            transactionManager.commit(status);

            session.invalidate(); // 세션 무효화 (로그아웃)

            redirectAttributes.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다."); // 리다이렉트 시 메시지 전달

            return "redirect:/main"; // 탈퇴 후 로그인 페이지로 리다이렉트
        } catch (Exception e) {
            // 트랜잭션 롤백
            transactionManager.rollback(status);

            // 예외 처리 - 회원 탈퇴 실패 시
            redirectAttributes.addFlashAttribute("error", "회원 탈퇴에 실패하였습니다."); // 리다이렉트 시 에러 메시지 전달
            return "redirect:/main"; // 회원 탈퇴 실패 시 이동할 페이지
        }
    } else {
        // 로그인된 사용자와 탈퇴 요청의 company_id가 일치하지 않을 때 처리
        redirectAttributes.addFlashAttribute("error", "회원 탈퇴에 실패하였습니다."); // 리다이렉트 시 에러 메시지 전달
        return "redirect:/main"; // 회원 탈퇴 실패 시 이동할 페이지
    }
}

}
