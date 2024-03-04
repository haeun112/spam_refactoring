package com.spam9700.spam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spam9700.spam.dao.MemberDao;
import com.spam9700.spam.dto.CompanyMemberDto;
import com.spam9700.spam.dto.CustomerMemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {
    @Autowired
    MemberDao memberDao;

    public boolean iJoin(CustomerMemberDto customerMemberDto) {
        // customerMemberDto.se
        // customerMemberDto.setCustomerBirth(LocalDate.of(Year, Month, Day));
        return memberDao.iJoin(customerMemberDto);
    }

    public boolean cJoin(CompanyMemberDto companyMemberDto) {
        return memberDao.cJoin(companyMemberDto);
    }

    public boolean iLogin(String customer_id, String customer_pwd) {
        return memberDao.iLogin(customer_id, customer_pwd);
    }

    public boolean cLogin(String company_id, String company_pwd, String company_businessnum) {
        return memberDao.cLogin(company_id, company_pwd, company_businessnum);
    }

    public boolean iIdCheck(String customer_id) {
        return memberDao.iIdCheck(customer_id);
    }

    public boolean cIdCheck(String company_id) {
        return memberDao.cIdCheck(company_id);
    }

    public List<String> findId(String customer_name, String customer_email) {
        return memberDao.findId(customer_name, customer_email);
    }

    public String findPwd(String customer_id, String customer_email) {
        return memberDao.findPwd(customer_id, customer_email);
    }

    public CustomerMemberDto getCustomerInfoById(String customer_id) {
        return memberDao.getCustomerInfoById(customer_id);
    }

    public boolean updateMypage(CustomerMemberDto customerMemberDto) {
        return memberDao.updateMypage(customerMemberDto);
    }

    @Transactional
    public void resign(String customer_id) {
        memberDao.deleteMemberInfo(customer_id);
    }

    public void deleteUserWithRooms(String company_id) {
        memberDao.deleteStudyRoomsByCompanyId(company_id);
        memberDao.deleteCMemberInfo(company_id);

    }

    public boolean isCustomerExist(String customer_id) {
        // DAO를 통해 데이터베이스에서 해당 customer_id가 존재하는지 확인
        boolean isExist = memberDao.isCustomerExist(customer_id);

        return isExist;
    }

    public boolean idCheck(String customer_id, String company_id) {
        return memberDao.idCheck(customer_id, company_id);
    }

    public void deleteReviewsByRoomId(String company_id) {
        memberDao.deleteReviewsByRoomId(company_id);
    }

}