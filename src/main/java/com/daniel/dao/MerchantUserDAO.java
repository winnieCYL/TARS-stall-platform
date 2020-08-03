package com.daniel.dao;

import com.daniel.pojo.MerchantUser;

public interface MerchantUserDAO {

    MerchantUser get(int id);

    void update(MerchantUser user);

    int checkPassword(MerchantUser user);

    MerchantUser getByUserName(String username);

}
