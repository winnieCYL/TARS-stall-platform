package com.daniel.service;

import com.daniel.pojo.ShopImage;

public interface ShopImageService {

    ShopImage getByShopId(int sid);
    void add(ShopImage shopImage);
    void update(ShopImage shopImage);
    void deleteByShopId(int sid);
}
