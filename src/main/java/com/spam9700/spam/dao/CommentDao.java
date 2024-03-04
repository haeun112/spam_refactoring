package com.spam9700.spam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.CommentDto;

@Mapper
public interface CommentDao {

    int addComment(CommentDto commentDto);

    CommentDto getCommentById(int commentId);

    int updateComment(CommentDto commentDto);

    int deleteComment(int commentId);

    List<CommentDto> getCommentsByBoardId(int boardId, int offset, int pageSize);

    int getTotalCommentCount(int boardId);

}
