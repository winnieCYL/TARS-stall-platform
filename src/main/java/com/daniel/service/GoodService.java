package com.daniel.service;

import com.daniel.pojo.Good;

import java.util.List;

public interface GoodService {

    int getShopId(int id);

    Good get(int id);

    // 添加
    void add(Good good);

    // 更新
    void update(Good good);

    // 计算商品总数 【这里应该是对应商店下的商品总数】
    int count(int sid);

    // 删除
    void delete(int id);

    // 获取所有商店并放入List
    List<Good> list();

    /**
     * 用于myGoodshelf页面，展示当前用户的商店
     * @param sid 商店Id
     * @return 商品List
     */
    List<Good> listByShopId(int sid);
}
