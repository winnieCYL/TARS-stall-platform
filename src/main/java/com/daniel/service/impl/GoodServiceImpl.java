package com.daniel.service.impl;

import com.daniel.dao.GoodDAO;
import com.daniel.dao.GoodImageDAO;
import com.daniel.pojo.Good;
import com.daniel.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodServiceImpl implements GoodService{

    @Autowired
    private GoodDAO goodDAO;

    @Autowired
    private GoodImageDAO goodImageDAO;

    @Override
    public int getShopId(int id) {
        return goodDAO.getShopId(id);
    }

    @Override
    public Good get(int id) {
        Good good = goodDAO.get(id);
        good.setGoodImage(goodImageDAO.getByGoodId(id));
        return good;
    }

    @Override
    public void add(Good good) {
        goodDAO.add(good);
    }

    @Override
    public void update(Good good) {
        goodDAO.update(good);
    }

    @Override
    public int count(int sid) {
        return goodDAO.count(sid);
    }

    @Override
    public void delete(int id) {
        goodDAO.delete(id);
    }

    @Override
    public List<Good> list() {
        List<Good> goods = goodDAO.list();
        for (Good good : goods) {
            good.setGoodImage(goodImageDAO.getByGoodId(good.getId()));
        }
        return goods;
    }

    @Override
    public List<Good> listByShopId(int sid) {
        List<Good> goods = goodDAO.getListByShopId(sid);
        for (Good good : goods) {
            good.setGoodImage(goodImageDAO.getByGoodId(good.getId()));
        }
        return goods;
    }
}
