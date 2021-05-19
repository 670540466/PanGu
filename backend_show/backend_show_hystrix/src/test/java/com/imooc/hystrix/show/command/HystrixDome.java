package com.imooc.hystrix.show.command;

import com.netflix.hystrix.HystrixCommand;
import com.netflix.hystrix.HystrixCommandGroupKey;

public class HystrixDome extends HystrixCommand<String> {

    private String name;

    protected HystrixDome(String name) {
        super(Setter.withGroupKey(HystrixCommandGroupKey.Factory.asKey("CommandName")));
        this.name = name;
    }

    @Override
    protected String run() throws Exception {
        String result = "CommandName:" + name;
        Thread.sleep(800l);
        System.out.println(result + "....." + Thread.currentThread().getName());
        return result;
    }
}
