package com.daniel.pojo;

public class MerchantUser {

    private int id;
    private String username;
    private String name;
    private String password;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }

    /** 用于日志中的信息输出 */
    @Override
    public String toString() {
        return "username:"+this.username+" ,name:"+this.name;
    }
}
