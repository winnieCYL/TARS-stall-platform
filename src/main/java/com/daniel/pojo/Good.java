package com.daniel.pojo;

public class Good {

    private int id;
    private String name;
    private double price;
    private String description;
    private Shop shop;
    private GoodImage goodImage;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }

    public void setPrice(double price) { this.price = price; }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public Shop getShop() { return shop; }

    public void setShop(Shop shop) { this.shop = shop; }

    public GoodImage getGoodImage() { return goodImage; }

    public void setGoodImage(GoodImage goodImage) { this.goodImage = goodImage; }

    /**用于日志中的信息输出*/
    @Override
    public String toString() {
        return "id:" + this.id +
                " ,name:" + this.name;
    }
}
