package com.mooc.meetingfilm.hall.apis;

import com.mooc.meetingfilm.apis.film.FilmFeignApis;
import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(name = "film-service")
public interface FilmApis extends FilmFeignApis {
}
