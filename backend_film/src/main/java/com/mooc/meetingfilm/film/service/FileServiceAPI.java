package com.mooc.meetingfilm.film.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mooc.meetingfilm.apis.film.vo.DescribeFilmRespVO;
import com.mooc.meetingfilm.film.controller.vo.DescribeActorsRespVO;
import com.mooc.meetingfilm.film.controller.vo.DescribeFilmsRespVO;
import com.mooc.meetingfilm.film.controller.vo.FilmSavedReqVO;
import com.mooc.meetingfilm.utils.exception.CommonServiceException;

public interface FileServiceAPI {
    IPage<DescribeActorsRespVO> describeActors(int nowPage,int pageSize) throws CommonServiceException;
    IPage<DescribeFilmsRespVO> describeFilms(int nowPage, int pageSize) throws CommonServiceException;
    DescribeFilmRespVO describeFilmById(String filmId) throws CommonServiceException;
    // 保存电影信息
    void saveFilm(FilmSavedReqVO filmSavedReqVO) throws CommonServiceException;
}
