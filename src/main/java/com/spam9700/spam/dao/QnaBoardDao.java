package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.spam9700.spam.dto.QnaBoardDto;

@Mapper
public interface QnaBoardDao {

    List<QnaBoardDto> getAllQnaBoard(@Param("offset") int offset, @Param("pageSize") int pageSize);

    void insertQnaBoard(QnaBoardDto qnaBoardDto);

    List<QnaBoardDto> searchQnaBoard(@Param("keyword") String keyword, @Param("offset") int offset,
            @Param("pageSize") int pageSize);

    int getTotalBoardCount();

    int getSearchResultCount(@Param("keyword") String keyword);

    QnaBoardDto getBoardById(int boardId);

    Page<QnaBoardDto> searchQnaBoard(String keyword, Pageable pageable);

    List<QnaBoardDto> getAllQnaBoardWithPaging(int pageSize, int offset);

    void updateQnaBoard(QnaBoardDto board);

    void deleteQnaBoard(int boardId);

}
