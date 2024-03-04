package com.spam9700.spam.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.spam9700.spam.dto.CommentDto;
import com.spam9700.spam.service.CommentService;

import jakarta.servlet.http.HttpSession;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/comments")
public class CommentController {

    private final CommentService commentService;

    @Autowired
    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    @PostMapping("/add")
    public ResponseEntity<Integer> addComment(@RequestBody CommentDto commentDto, HttpSession session) {
        // 로그인 여부 확인
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
            log.warn("댓글 작성 권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build(); // 403 Forbidden 반환
        }

        commentDto.setUser_id(loggedInUserId); // 댓글 작성자 설정

        int addedCommentId = commentService.addComment(commentDto);
        log.info("댓글 추가 성공: 댓글 ID = {}", addedCommentId);
        return ResponseEntity.ok(addedCommentId);
    }

    @GetMapping("/{commentId}")
    public ResponseEntity<CommentDto> getComment(@PathVariable int commentId) {
        CommentDto comment = commentService.getCommentById(commentId);
        if (comment == null) {
            log.debug("댓글을 찾을 수 없음: 댓글 ID = {}", commentId);
            return ResponseEntity.notFound().build();
        }
        log.info("댓글 조회 성공: 댓글 ID = {}", commentId);
        return ResponseEntity.ok(comment);
    }

    @PutMapping("/{commentId}")
    public ResponseEntity<Integer> updateComment(@PathVariable int commentId, @RequestBody CommentDto commentDto,
            HttpSession session) {
        // 로그인 여부 확인
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
            log.warn("댓글 업데이트 권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build(); // 403 Forbidden 반환
        }

        commentDto.setComment_id(commentId);
        int updatedCount = commentService.updateComment(commentDto);
        if (updatedCount == 0) {
            log.warn("댓글 업데이트 실패: 댓글 ID = {}", commentId);
            return ResponseEntity.notFound().build();
        }
        log.info("댓글 업데이트 성공: 댓글 ID = {}", commentId);
        return ResponseEntity.ok(updatedCount);
    }

    @DeleteMapping("/{commentId}")
    public ResponseEntity<Void> deleteComment(@PathVariable int commentId, HttpSession session) {
        // 로그인 여부 확인
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
            log.warn("댓글 삭제 권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build(); // 403 Forbidden 반환
        }

        int deletedCount = commentService.deleteComment(commentId);
        if (deletedCount == 0) {
            log.warn("댓글 삭제 실패: 댓글 ID = {}", commentId);
            return ResponseEntity.notFound().build();
        }
        log.info("댓글 삭제 성공: 댓글 ID = {}", commentId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/getByBoardId/{boardId}")
    public ResponseEntity<List<CommentDto>> getCommentsByBoardId(
            @PathVariable int boardId,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "5") int pageSize) {
        List<CommentDto> comments = commentService.getCommentsByBoardId(boardId, page, pageSize);
        log.info("댓글 목록 조회 성공: 게시글 ID = {}, 댓글 수 = {}", boardId, comments.size());
        log.info("page:{},pageSize:{}", page, pageSize);
        return ResponseEntity.ok(comments);
    }

}
