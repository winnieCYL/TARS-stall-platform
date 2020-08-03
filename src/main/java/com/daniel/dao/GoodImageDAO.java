package com.daniel.dao;

import com.daniel.pojo.GoodImage;

public interface GoodImageDAO {

    /*BookImage getByBookId(@Param("start") int start, @Param("count") int count, @Param("cid") int cid);*/
    GoodImage getByGoodId(int gid);
    void add(GoodImage goodImage);
    void update(GoodImage goodImage);
    void deleteByGoodId(int gid);
}
