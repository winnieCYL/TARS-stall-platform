package com.daniel.service.impl;

import com.daniel.dao.MerchantUserDAO;
import com.daniel.pojo.MerchantUser;
import com.daniel.service.MerchantUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MerchantUserServiceImpl implements MerchantUserService{

    @Autowired
    private MerchantUserDAO merchantUserDAO;

    @Override
    public boolean checkMerchantUser(MerchantUser user) {
        int flag = merchantUserDAO.checkPassword(user);
        return flag==1;
    }

    @Override
    public MerchantUser get(int id) {
        return merchantUserDAO.get(id);
    }

    @Override
    public MerchantUser getByUserName(String username) {
        return merchantUserDAO.getByUserName(username);
    }

}
