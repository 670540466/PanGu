package com.mooc.meeting.apigwzuul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@EnableZuulProxy
@SpringBootApplication
public class BackendApigwZuulApplication {

    public static void main(String[] args) {
        SpringApplication.run(BackendApigwZuulApplication.class, args);
    }

}
