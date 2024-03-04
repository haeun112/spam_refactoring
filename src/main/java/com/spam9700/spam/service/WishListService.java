package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam9700.spam.dao.DetailPageDao;
import com.spam9700.spam.dao.WishListDao;
import com.spam9700.spam.dto.DetailPageDto;
import com.spam9700.spam.dto.WishListDto;

@Service
public class WishListService {
    
    @Autowired
    private WishListDao wishListDao;

    @Autowired
    private DetailPageDao detailPageDao;

    


    
}
