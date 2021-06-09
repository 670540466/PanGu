package com.mooc.meetingfilm.consumer.feign;

import com.mooc.meetingfilm.consumer.controller.vo.UserModel;
import org.springframework.stereotype.Service;

@Service
public class FeignFallback implements FeignApi{
    @Override
    public String providerSayHello(String message) {
        return "fallback message:" + message;
    }

    @Override
    public String postTest(String author, String providerId, UserModel json) {
        return null;
    }
}
