package com.daniel.service.impl;

import com.daniel.dao.ShopImageDAO;
import com.daniel.pojo.ShopImage;
import com.daniel.service.ShopImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopImageServiceImpl implements ShopImageService{

    @Autowired
    private ShopImageDAO shopImageDAO;

    @Override
    public ShopImage getByShopId(int sid) {
        return shopImageDAO.getByShopId(sid);
    }

    @Override
    public void add(ShopImage shopImage) {
        shopImageDAO.add(shopImage);
    }

    @Override
    public void update(ShopImage shopImage) {
        shopImageDAO.update(shopImage);
    }

    @Override
    public void deleteByShopId(int sid) {
        shopImageDAO.deleteByShopId(sid);
    }
}
