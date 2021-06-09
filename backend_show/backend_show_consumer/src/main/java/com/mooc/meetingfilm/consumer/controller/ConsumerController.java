package com.mooc.meetingfilm.consumer.controller;

import com.mooc.meetingfilm.consumer.controller.vo.UserModel;
import com.mooc.meetingfilm.consumer.feign.FeignApi;
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

    @Resource
    private FeignApi feignApi;

    @RequestMapping(value = "/sayhello/feign")
    public String sayHelloFeign(String message){

        return feignApi.providerSayHello(message);
    }

    @RequestMapping(value = "/sayhello/post")
    public String sayHelloPost(String author, String providerId, UserModel userModel){
        log.info("author:{}, providerId:{}, userModel:{}",author,providerId,userModel);
        return feignApi.postTest(author,providerId,userModel);
    }

    @RequestMapping(value = "/sayhello")
    public String sayHello(String message){

        return serviceAPI.sayHello(message);
    }

}
