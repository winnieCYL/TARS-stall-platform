package com.daniel.pojo;

public class Shop {

    private int id;
    private String name;
    private double lon;     //位置，经度
    private double lat;     //纬度
    private String openTime;    //营业时间，暂时先string处理
    private MerchantUser user;
    private ShopImage shopimage;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getLon() { return lon; }

    public void setLon(double lon) { this.lon = lon; }

    public double getLat() { return lat; }

    public void setLat(double lat) { this.lat = lat; }

    public String getOpenTime() { return openTime; }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public MerchantUser getUser() {
        return user;
    }

    public void setMerchantUser(MerchantUser user) {
        this.user = user;
    }

    public ShopImage getShopimage() { return shopimage; }

    public void setShopImage(ShopImage shopimage) { this.shopimage = shopimage; }

    /**用于日志中的信息输出*/
    @Override
    public String toString() {
        return "id:" + this.id +
                " ,name:" + this.name;
    }
}
