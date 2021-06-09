package com.mooc.meetingfilm.film;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

@ComponentScan(basePackages = {"com.mooc.meetingfilm"})
@MapperScan(basePackages = {"com.mooc.meetingfilm.film.dao"})
@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
@Import({com.mooc.meetingfilm.film.swagger.SwaggerConfig.class})
public class BackendFilmApplication {
    public static void main(String[] args) {
        SpringApplication.run(BackendFilmApplication.class, args);
    }

}
