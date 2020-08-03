package com.daniel.dao;

import com.daniel.pojo.Shop;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopDAO {

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
     * 根据条件获取商店
     * @param uid 用户Id
     * @return 相应的Shop
     */
    Shop getByUserId(@Param("uid") int uid);

    List<Shop> getListByUserId(@Param("uid") int uid);

    /*
    /**
     * 根据条件获取相应书本的List
     * @param start 起始图书ID
     * @param count 需要的书的总数
     * @param bookType 书的类型（图书信息1/求书信息0）
     * @param cid CategoryId
     * @return 符合条件的List
    List<Book> getListByCategoryId(@Param("start") int start, @Param("count") int count, @Param("bookType") int bookType, @Param("cid") int cid);
    */

}
