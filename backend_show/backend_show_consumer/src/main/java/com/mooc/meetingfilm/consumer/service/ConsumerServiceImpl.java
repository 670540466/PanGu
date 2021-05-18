package com.mooc.meetingfilm.consumer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * @author : jiangzh
 * @program : com.mooc.meetingfilm.consumer.service
 * @description :
 **/
@Service
public class ConsumerServiceImpl implements ConsumerServiceAPI {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private LoadBalancerClient eureka;

    @Override
    public String sayHello(String message) {
        ServiceInstance choose = eureka.choose("hello-service-provider");

        // 准备工作
        String hostname = choose.getHost();
        int port = choose.getPort();
        String uri = "/provider/sayhello?message="+message;

        // GET Register
//        String url = "http://localhost:" + port + uri;
        String url = "http://hello-service-provider:" + uri;
//        http://host.docker.internal:7101/provider/sayhello?message=ss

        // invoker provider test
        String result = restTemplate.getForObject(url, String.class);

        return result;
    }

}
