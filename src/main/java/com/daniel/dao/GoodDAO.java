package com.daniel.dao;

import com.daniel.pojo.Good;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodDAO {

    int getShopId(int id);

    Good get(int id);

    // 添加
    void add(Good good);

    // 更新
    void update(Good good);

    // 计算商品总数
    int count(int sid);

    // 删除
    void delete(int id);

    // 获取所有商品并放入List
    List<Good> list();

    /**
     * 根据条件获取所有商店
     * @param sid 商品Id
     * @return 相应的List
     */
    List<Good> getListByShopId(@Param("sid") int sid);

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
