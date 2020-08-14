package com.secondHandbbs;

import com.qq.tars.spring.annotation.EnableTarsServer;
import com.qq.tars.spring.annotation.TarsHttpService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableTarsServer
@TarsHttpService("Httpstall")
public class SecondHandbbsApplication {

    public static void main(String[] args) {
        SpringApplication.run(SecondHandbbsApplication.class, args);
    }

}
