package com.mooc.meetingfilm.consumer.feign;

import com.mooc.meetingfilm.consumer.controller.vo.UserModel;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(name="hello-service-provider", primary = true,fallback = FeignFallback.class)
public interface FeignApi {
    @RequestMapping(value = "/provider/sayhello", method = RequestMethod.GET)
    String providerSayHello(@RequestParam("message") String message);

    @RequestMapping(value = "/provider/{providerId}/sayhello", method = RequestMethod.POST)
    String postTest(
            @RequestHeader("author") String author,
            @PathVariable("providerId")String providerId,
            @RequestBody UserModel json);
}
