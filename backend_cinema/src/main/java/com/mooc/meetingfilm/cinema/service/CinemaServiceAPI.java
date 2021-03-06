package com.mooc.meetingfilm.cinema.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mooc.meetingfilm.cinema.controller.vo.CinemaSavedReqVO;
import com.mooc.meetingfilm.cinema.controller.vo.DescribeCinemasRespVO;
import com.mooc.meetingfilm.cinema.dao.entity.MoocCinemaT;
import com.mooc.meetingfilm.utils.exception.CommonServiceException;

/**
 * @author : jiangzh
 * @program : com.mooc.meetingfilm.cinema.service
 * @description :
 **/
public interface CinemaServiceAPI {

    // 保存影院
    void saveCinema(CinemaSavedReqVO reqVO) throws CommonServiceException;

    // 获取影院列表
    IPage<MoocCinemaT> describeCinemas(int nowPage, int pageSize) throws CommonServiceException;

}
