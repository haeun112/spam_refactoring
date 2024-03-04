package com.spam9700.spam.dao;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spam9700.spam.dto.StudyRoomCategoryDto;

@Mapper
public interface StudyRoomCategoryDao {
    List<StudyRoomCategoryDto> getAllCategories();
    StudyRoomCategoryDto getCategoryById(int category_id);
}
