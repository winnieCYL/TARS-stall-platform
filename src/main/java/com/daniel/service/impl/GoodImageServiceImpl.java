package com.daniel.service.impl;

import com.daniel.dao.GoodImageDAO;
import com.daniel.pojo.GoodImage;
import com.daniel.service.GoodImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodImageServiceImpl implements GoodImageService{

    @Autowired
    private GoodImageDAO goodImageDAO;

    @Override
    public GoodImage getByGoodId(int gid) {
        return goodImageDAO.getByGoodId(gid);
    }

    @Override
    public void add(GoodImage goodImage) {
        goodImageDAO.add(goodImage);
    }

    @Override
    public void update(GoodImage goodImage) {
        goodImageDAO.update(goodImage);
    }

    @Override
    public void deleteByGoodId(int gid) {
        goodImageDAO.deleteByGoodId(gid);
    }
}
