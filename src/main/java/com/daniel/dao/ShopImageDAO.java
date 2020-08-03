package com.daniel.dao;

import com.daniel.pojo.ShopImage;

public interface ShopImageDAO {

    /*BookImage getByBookId(@Param("start") int start, @Param("count") int count, @Param("cid") int cid);*/
    ShopImage getByShopId(int sid);
    void add(ShopImage shopImage);
    void update(ShopImage shopImage);
    void deleteByShopId(int sid);
}
