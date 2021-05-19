package com.imooc.hystrix.show.command;

import org.junit.Test;
import rx.Observable;
import rx.Subscriber;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

public class HystrixTest {
    @Test
    public void HystrixTest(){
        Long startTime = System.currentTimeMillis();
        HystrixDome dome = new HystrixDome("ceshi");
        String ceshi = dome.execute();
        Long endTime = System.currentTimeMillis();
        System.out.println("ceshi:" + ceshi + "," + (endTime - startTime));

    }

    @Test
    public void HystrixTest2() throws ExecutionException, InterruptedException {
        Long startTime = System.currentTimeMillis();
        HystrixDome dome = new HystrixDome("ceshi");
        Future<String> queue = dome.queue();
        Long endTime = System.currentTimeMillis();
        System.out.println("ceshi1:" + (endTime - startTime));

        System.out.println("ceshi2:" + queue.get());
        Long endTime2 = System.currentTimeMillis();
        System.out.println("ceshi3:" + (endTime2 - startTime));
    }

    @Test
    public void HystrixObserverTest(){
        // 这个是先跑的run方法
        Long startTime = System.currentTimeMillis();
        HystrixDome dome = new HystrixDome("observe");
        Observable<String> observe = dome.observe();
        // 阻塞式调用
        String single = observe.toBlocking().single();
        Long endTime = System.currentTimeMillis();
        System.out.println("observe:" + single + "," + (endTime - startTime));
        // 非阻塞式调用
        observe.subscribe(new Subscriber<String>() {
            @Override
            public void onCompleted() {
                System.out.println("onCompleted");
            }

            @Override
            public void onError(Throwable throwable) {
                System.err.println("onError:" + throwable);
            }

            @Override
            public void onNext(String s) {
                Long endtime2 = System.currentTimeMillis();
                System.out.println("onNext:" + s + (endtime2 - startTime));
            }
        });
    }

    @Test
    public void toObserveTest() throws InterruptedException {
        // 这个是先注册，后run方法
        long beginTime = System.currentTimeMillis();

        HystrixDome commandDemo1 = new HystrixDome("toObservable1");

        Observable<String> toObservable1 = commandDemo1.toObservable();

        // 阻塞式调用
        String result = toObservable1.toBlocking().single();

        long endTime = System.currentTimeMillis();
        System.out.println("result="+result+" , speeding="+(endTime-beginTime));

        HystrixDome commandDemo2 = new HystrixDome("toObservable2");
        Observable<String> toObservable2 = commandDemo2.toObservable();
        // 非阻塞式调用
        toObservable2.subscribe(new Subscriber<String>() {
            @Override
            public void onCompleted() {
                System.err.println("toObservable , onCompleted");
            }

            @Override
            public void onError(Throwable throwable) {
                System.err.println("toObservable , onError - throwable="+throwable);
            }

            @Override
            public void onNext(String result) {
                long endTime = System.currentTimeMillis();
                System.err.println("toObservable , onNext result="+result+" speend:"+(endTime - beginTime));
            }
        });

        Thread.sleep(2000l);
    }
}
