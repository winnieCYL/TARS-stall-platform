package com.daniel.service;

import com.daniel.pojo.Shop;
import com.daniel.pojo.ShopImage;

import java.util.List;
import java.util.Map;

public interface ShopService {

    int getMerchantUserId(int id);

    Shop get(int id);

    // 添加
    void add(Shop shop);

    // 更新
    void update(Shop shop);

    // 计算商店总数
    int count();

    // 删除
    void delete(int id);

    // 获取所有商店并放入List
    List<Shop> list();

    /**
     * 用于myShopshelf页面，展示当前用户的商店
     * @param uid 用户Id
     * @return 商店List
     */
    List<Shop> listByUserId(int uid);

    Shop getByUserId(int uid);
}
