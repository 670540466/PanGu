package com.mooc.meetingfilm.consumer.controller;

import com.mooc.meetingfilm.consumer.service.ConsumerServiceAPI;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Slf4j
@RestController
public class ConsumerController {

    @Resource
    private ConsumerServiceAPI serviceAPI;

    @RequestMapping(value = "/sayhello")
    public String sayHello(String message){

        return serviceAPI.sayHello(message);
    }

}
