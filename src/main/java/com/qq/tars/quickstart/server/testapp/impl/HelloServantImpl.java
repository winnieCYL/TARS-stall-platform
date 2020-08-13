package com.qq.tars.quickstart.server.testapp.impl;

import com.qq.tars.quickstart.server.testapp.HelloServant;
import com.qq.tars.spring.annotation.TarsServant;

@TarsServant("secondHandbbs")
public class HelloServantImpl implements HelloServant {

    @Override
    public String hello(int no, String name) {
        return String.format("hello no=%s, name=%s, time=%s", no, name, System.currentTimeMillis());
    }
}