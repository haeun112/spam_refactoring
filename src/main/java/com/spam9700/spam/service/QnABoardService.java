package com.spam9700.spam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spam9700.spam.dao.QnaBoardDao;
import com.spam9700.spam.dto.QnaBoardDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QnABoardService {

    private final QnaBoardDao qnaBoardDao;

    public QnABoardService(QnaBoardDao qnaBoardDao) {
        this.qnaBoardDao = qnaBoardDao;
    }

    public List<QnaBoardDto> getAllQnaBoard(int page, int pageSize) {
        log.info("서비스 - 목록");
        int offset = (page - 1) * pageSize; // 페이지 시작 위치 계산
        return qnaBoardDao.getAllQnaBoard(offset, pageSize);
    }

    public void insertQnaBoard(QnaBoardDto qnaBoardDto) {
        log.info("서비스 - 글 쓰기");
        qnaBoardDao.insertQnaBoard(qnaBoardDto);
    }

    public List<QnaBoardDto> searchQnaBoard(String keyword, int page, int pageSize) {
        log.info("서비스 - 검색: {}", keyword);
        int offset = (page - 1) * pageSize; // 페이지 시작 위치 계산
        return qnaBoardDao.searchQnaBoard(keyword, offset, pageSize);
    }

    public int getTotalBoardCount() {
        log.info("서비스 - 총 게시글 수 조회");
        return qnaBoardDao.getTotalBoardCount();
    }

    public int getSearchResultCount(String keyword) {
        log.info("서비스 - 검색 결과 수 조회: {}", keyword);
        return qnaBoardDao.getSearchResultCount(keyword);
    }

    public QnaBoardDto getBoardById(int boardId) {
        log.info("서비스 - 글 상세");
        log.info("getQnaBoardById: {}", boardId);
        return qnaBoardDao.getBoardById(boardId);
    }

    public List<QnaBoardDto> getAllQnaBoardWithPaging(int pageSize, int offset) {
        log.info("서비스 - 페이지별 목록 가져오기");
        return qnaBoardDao.getAllQnaBoardWithPaging(pageSize, offset);
    }

    public void updateQnaBoard(QnaBoardDto existingBoard) {
        log.info("서비스 - 글 수정");
        qnaBoardDao.updateQnaBoard(existingBoard);
    }

    public void deleteQnaBoard(int boardId) {
        log.info("서비스 - 글 삭제");
        qnaBoardDao.deleteQnaBoard(boardId);
    }

}
