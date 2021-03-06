package com.mooc.meetingfilm.provider.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
public class ProviderController {

    @Value("${server.port}")
    private int port;

    @RequestMapping(value = "/provider/sayhello", method = RequestMethod.GET)
    public String providerSayHello(String message){

        log.error("provder sayhello port:{}, message:{}",port,message);

        return "Provider sayhello port:"+port+" , message:"+message;
    }

    @RequestMapping(value = "/provider/{providerId}/sayhello", method = RequestMethod.POST)
    public String postTest(
            @RequestHeader("author") String author,
            @PathVariable("providerId")String providerId,
            @RequestBody String json){

        log.error("provder sayhello port:{},author:{} , providerId:{}, message:{}",port,author,providerId,json);

        return "Provider sayhello port:"+port+" , message:"+json;
    }

}
