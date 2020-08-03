package com.daniel.service;

import com.daniel.pojo.GoodImage;

public interface GoodImageService {

    GoodImage getByGoodId(int gid);
    void add(GoodImage goodImage);
    void update(GoodImage goodImage);
    void deleteByGoodId(int gid);
}
