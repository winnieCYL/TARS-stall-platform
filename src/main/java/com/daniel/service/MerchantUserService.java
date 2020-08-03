package com.daniel.service;

import com.daniel.pojo.MerchantUser;

public interface MerchantUserService {

    boolean checkMerchantUser(MerchantUser user);
    MerchantUser get(int id);
    MerchantUser getByUserName(String username);

}