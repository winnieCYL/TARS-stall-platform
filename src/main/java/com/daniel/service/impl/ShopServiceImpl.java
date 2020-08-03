package com.daniel.service.impl;

import com.daniel.dao.ShopDAO;
import com.daniel.dao.ShopImageDAO;
import com.daniel.pojo.Shop;
import com.daniel.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShopServiceImpl implements ShopService{

    @Autowired
    private ShopDAO shopDAO;

    @Autowired
    private ShopImageDAO shopImageDAO;

    @Override
    public int getMerchantUserId(int id) {
        return shopDAO.getMerchantUserId(id);
    }

    @Override
    public Shop get(int id) {
        Shop shop = shopDAO.get(id);
        shop.setShopImage(shopImageDAO.getByShopId(id));
        return shop;
    }

    @Override
    public void add(Shop shop) {
        shopDAO.add(shop);
    }

    @Override
    public void update(Shop shop) {
        shopDAO.update(shop);
    }

    @Override
    public int count() {
        return shopDAO.count();
    }

    @Override
    public void delete(int id) {
        shopDAO.delete(id);
    }

    @Override
    public List<Shop> list() {
        List<Shop> shops = shopDAO.list();
        for (Shop shop : shops) {
            shop.setShopImage(shopImageDAO.getByShopId(shop.getId()));
        }
        return shops;
    }

    @Override
    public List<Shop> listByUserId(int uid) {
        List<Shop> shops = shopDAO.getListByUserId(uid);
        for (Shop shop : shops) {
            shop.setShopImage(shopImageDAO.getByShopId(shop.getId()));
        }
        return shops;
    }

    @Override
    public Shop getByUserId(int uid) {
        return shopDAO.getByUserId(uid);
    }
}
