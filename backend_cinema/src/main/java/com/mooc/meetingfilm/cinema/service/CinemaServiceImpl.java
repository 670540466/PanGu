package com.mooc.meetingfilm.cinema.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mooc.meetingfilm.cinema.controller.vo.CinemaSavedReqVO;
import com.mooc.meetingfilm.cinema.controller.vo.DescribeCinemasRespVO;
import com.mooc.meetingfilm.cinema.dao.entity.MoocCinemaT;
import com.mooc.meetingfilm.cinema.dao.mapper.MoocCinemaTMapper;
import com.mooc.meetingfilm.utils.exception.CommonServiceException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author : jiangzh
 * @program : com.mooc.meetingfilm.cinema.service
 * @description :
 **/
@Service
public class CinemaServiceImpl implements CinemaServiceAPI {

    @Resource
    private MoocCinemaTMapper cinemaTMapper;

    @Override
    public void saveCinema(CinemaSavedReqVO reqVO) throws CommonServiceException {
        MoocCinemaT cinema = new MoocCinemaT();

        // TODO 填写具体参数
        cinema.setCinemaName(reqVO.getCinemaName());
        cinema.setCinemaPhone(reqVO.getCinemaTele());
        cinema.setBrandId(
                Integer.valueOf(reqVO.getBrandId())
        );
        cinema.setAreaId(
                Integer.valueOf(reqVO.getAreaId())
        );
        cinema.setHallIds(reqVO.getHallTypeIds());
        cinema.setImgAddress(reqVO.getCinemaImgAddress());
        cinema.setCinemaAddress(reqVO.getCinemaAddress());
        cinema.setMinimumPrice(
                Integer.valueOf(reqVO.getCinemaPrice())
        );

        // TODO 记得把实体对象进行保存
        cinemaTMapper.insert(cinema);
    }


    @Override
    public IPage<MoocCinemaT> describeCinemas(int nowPage, int pageSize) throws CommonServiceException {

        // 查询实体对象，然后与表现层对象进行交互
        Page<MoocCinemaT> page = new Page<>(nowPage,pageSize);

        IPage<MoocCinemaT> moocCinemaTIPage = cinemaTMapper.selectPage(page, null);

        return moocCinemaTIPage;
    }
}
