package com.mooc.meetingfilm.cinema.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.google.common.collect.Maps;
import com.mooc.meetingfilm.cinema.controller.vo.CinemaSavedReqVO;
import com.mooc.meetingfilm.cinema.controller.vo.DescribeCinemasRespVO;
import com.mooc.meetingfilm.cinema.dao.entity.MoocCinemaT;
import com.mooc.meetingfilm.cinema.service.CinemaServiceAPI;
import com.mooc.meetingfilm.utils.common.vo.BasePageVO;
import com.mooc.meetingfilm.utils.common.vo.BaseResponseVO;
import com.mooc.meetingfilm.utils.exception.CommonServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author : jiangzh
 * @program : com.mooc.meetingfilm.cinema.controller
 * @description : 影院模块表现层
 **/
@RestController
@RequestMapping("/cinemas")
public class CinemaController {

    @Autowired
    private CinemaServiceAPI cinemaServiceAPI;

    @RequestMapping(value = "/cinema:add",method = RequestMethod.POST)
    public BaseResponseVO saveCinema(@RequestBody CinemaSavedReqVO cinemaSavedReqVO) throws CommonServiceException {

        // 数据验证
        cinemaSavedReqVO.checkParam();

        cinemaServiceAPI.saveCinema(cinemaSavedReqVO);

        return BaseResponseVO.success();
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public BaseResponseVO describeCinemas(
            @RequestParam(name = "nowPage", defaultValue = "1") int nowPage,
            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
        BaseResponseVO baseResponseVO = null;
        try {

            IPage<MoocCinemaT> page = cinemaServiceAPI.describeCinemas(nowPage, pageSize);

            Map<String, Object> result = Maps.newHashMap();
            result.put("nowPage", page.getCurrent());
            result.put("pageSize", page.getSize());
            result.put("totalPages", page.getPages());
            result.put("totalSize", page.getTotal());

//            if(page.getSize() == 0){
                baseResponseVO = BaseResponseVO.success();
//            }else{
//                List<CinemaAddReqVO> cinemas =
//                        page.getRecords().stream().map((entity) -> {
//                            return CinemaAddReqVO.pojo2VO(entity);
//                        }).collect(Collectors.toList());
//
//                result.put("cinemas", cinemas);
//                baseResponseVO = BaseResponseVO.success(result);
//            }
        } catch (CommonServiceException e) {
            baseResponseVO = BaseResponseVO.serviceException(e);
        }
        return baseResponseVO;
    }

}
