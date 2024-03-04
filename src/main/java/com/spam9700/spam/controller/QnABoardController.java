package com.spam9700.spam.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spam9700.spam.dto.QnaBoardDto;
import com.spam9700.spam.service.QnABoardService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna")
public class QnABoardController {

    private final QnABoardService qnABoardService;

    public QnABoardController(QnABoardService qnABoardService) {
        this.qnABoardService = qnABoardService;
    }

    @GetMapping("/list")
    public String list(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "pageSize", defaultValue = "7") int pageSize,
            @RequestParam(value = "keyword", required = false) String keyword) {
        // 올바른 OFFSET 계산
        int offset = (page - 1) * pageSize;

        // 게시글 리스트와 총 게시글 수 가져오기
        List<QnaBoardDto> qnaBoardDtoList;
        int totalBoardCount;

        if (keyword != null && !keyword.isEmpty()) {
            // 키워드가 제공된 경우 검색을 수행하도록 수정
            qnaBoardDtoList = qnABoardService.searchQnaBoard(keyword, pageSize, offset); // 수정된 메서드 호출
            totalBoardCount = qnABoardService.getSearchResultCount(keyword);
        } else {
            // 키워드가 제공되지 않은 경우 모든 글을 가져오도록 유지
            qnaBoardDtoList = qnABoardService.getAllQnaBoardWithPaging(pageSize, offset); // 수정된 메서드 호출
            totalBoardCount = qnABoardService.getTotalBoardCount();
        }

        model.addAttribute("qnaBoardDtoList", qnaBoardDtoList);
        log.info("qnaBoardDtoList:{}", qnaBoardDtoList);

        // 페이징 계산
        int totalPages = (int) Math.ceil((double) totalBoardCount / pageSize);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", pageSize); // 페이지 사이즈도 모델에 추가
        model.addAttribute("keyword", keyword); // 검색어도 모델에 추가
        log.info("totalPages:{}", totalPages);
        log.info("currentPage:{}", page);
        log.info("pageSize:{}", pageSize);
        log.info("keyword:{}", keyword);
        log.info("게시판 리스트");
        return "qna/qnaBoardList"; // JSP 파일 경로를 정확하게 지정
    }

    @GetMapping("/write")
    public String writeForm(HttpServletRequest request) {
        // 현재 로그인한 사용자의 정보를 세션에서 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");

        if (userId == null) {
            // 사용자가 로그인하지 않았으면 로그인 페이지로 리다이렉트
            return "redirect:/member/i_login";
        }

        log.info("글쓰기 창");
        return "qna/qnaBoardWrite"; // JSP 파일 경로를 정확하게 지정
    }

    @PostMapping("/write")
    public String write(HttpServletRequest request,
            @RequestParam("board_title") String title,
            @RequestParam("board_content") String content) {
        log.info("write");

        // 현재 로그인한 사용자의 정보를 세션에서 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");

        QnaBoardDto qnaBoardDto = new QnaBoardDto();
        qnaBoardDto.setUser_id(userId);
        qnaBoardDto.setBoard_title(title);
        qnaBoardDto.setBoard_content(content);

        qnABoardService.insertQnaBoard(qnaBoardDto);

        return "redirect:/qna/list";
    }

    @GetMapping("/detail")
    public String detail(Model model, @RequestParam("board_id") int boardId) {
        // 글 상세 내용 가져오는 로직 추가
        QnaBoardDto board = qnABoardService.getBoardById(boardId);
        model.addAttribute("board", board);
        return "qna/qnaBoardDetail"; // JSP 파일 경로를 정확하게 지정
    }

    @GetMapping("/edit")
    public String editForm(Model model, @RequestParam("board_id") int boardId, HttpServletRequest request) {
        // 해당 게시글의 정보 가져오기
        QnaBoardDto board = qnABoardService.getBoardById(boardId);

        // 현재 로그인한 사용자의 정보 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");

        // 로그인한 사용자와 글 작성자가 동일한지 확인합니다.
        if (userId == null || !userId.equals(board.getUser_id())) {
            // 사용자가 로그인하지 않았거나 글 작성자가 아니면 수정할 수 없도록 처리합니다.
            return "redirect:/qna/list";
        }

        // 게시글 정보를 모델에 추가하여 폼에 전달합니다.
        model.addAttribute("board", board);

        return "qna/qnaBoardEdit"; // JSP 파일 경로를 정확하게 지정
    }

    @PostMapping("/update")
    public String update(@RequestParam("board_id") int boardId,
            @RequestParam("board_title") String title,
            @RequestParam("board_content") String content, HttpServletRequest request) {
        log.info("update");

        // 글 수정을 위해 해당 글의 정보를 먼저 가져옵니다.
        QnaBoardDto existingBoard = qnABoardService.getBoardById(boardId);

        // 현재 로그인한 사용자의 정보를 세션에서 가져옵니다.
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");

        // 로그인한 사용자와 글 작성자가 동일한지 확인합니다.
        if (userId == null || !userId.equals(existingBoard.getUser_id())) {
            // 사용자가 로그인하지 않았거나 글 작성자가 아니면 수정할 수 없도록 처리합니다.
            return "redirect:/qna/list";
        }

        // 수정할 내용을 업데이트합니다.
        existingBoard.setBoard_title(title);
        existingBoard.setBoard_content(content);
        qnABoardService.updateQnaBoard(existingBoard);

        return "redirect:/qna/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("board_id") int boardId, HttpServletRequest request) {
        log.info("delete");

        // 글 삭제를 위해 해당 글의 정보를 먼저 가져옵니다.
        QnaBoardDto existingBoard = qnABoardService.getBoardById(boardId);

        // 현재 로그인한 사용자의 정보를 세션에서 가져옵니다.
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("loggedInUserId");

        // 로그인한 사용자와 글 작성자가 동일한지 확인합니다.
        if (userId == null || !userId.equals(existingBoard.getUser_id())) {
            // 사용자가 로그인하지 않았거나 글 작성자가 아니면 삭제할 수 없도록 처리합니다.
            return "redirect:/qna/list";
        }

        // 글을 삭제합니다.
        qnABoardService.deleteQnaBoard(boardId);

        return "redirect:/qna/list";
    }

}