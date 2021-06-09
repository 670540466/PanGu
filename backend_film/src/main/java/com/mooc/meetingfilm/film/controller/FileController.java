package com.mooc.meetingfilm.film.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.google.common.collect.Maps;
import com.mooc.meetingfilm.apis.film.vo.DescribeFilmRespVO;
import com.mooc.meetingfilm.film.controller.vo.DescribeActorsRespVO;
import com.mooc.meetingfilm.film.controller.vo.DescribeFilmsRespVO;
import com.mooc.meetingfilm.film.controller.vo.FilmSavedReqVO;
import com.mooc.meetingfilm.film.service.FileServiceImpl;
import com.mooc.meetingfilm.utils.common.vo.BasePageVO;
import com.mooc.meetingfilm.utils.common.vo.BaseResponseVO;
import com.mooc.meetingfilm.utils.exception.CommonServiceException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping(value = "/films")
@Api(tags = "我的swagger测试类",description = "用户基本信息操作")
public class FileController {

    @Autowired
    private FileServiceImpl filmServiceAPI;

    @RequestMapping(value = "/actors",method = RequestMethod.GET)
    @ApiOperation(value = "我的方法value",notes="方法的注意事项和备注",tags="说明该方法的作用，参数是个数组，可以填多个。格式：tags={\"作用1\",\"作用2\"}" )
    public BaseResponseVO actors(BasePageVO pageVO) throws CommonServiceException {
        pageVO.checkParam();
        IPage<DescribeActorsRespVO> iPage = filmServiceAPI.describeActors(pageVO.getNowPage(),pageVO.getPageSize());
        Map<String,Object> result = descrbePageResult(iPage,"actors");
        return BaseResponseVO.success(result);
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    public BaseResponseVO films(BasePageVO pageVO) throws CommonServiceException {
        pageVO.checkParam();
        IPage<DescribeFilmsRespVO> iPage = filmServiceAPI.describeFilms(pageVO.getNowPage(),pageVO.getPageSize());
        Map<String,Object> result = descrbePageResult(iPage,"films");
        return BaseResponseVO.success(result);
    }

    // 根据电影主键获取电影信息
    @RequestMapping(value = "/{filmId}",method = RequestMethod.GET)
    public BaseResponseVO describeFilmById(@PathVariable("filmId")String filmId) throws CommonServiceException {

        DescribeFilmRespVO describeFilmRespVO = filmServiceAPI.describeFilmById(filmId);
        if(describeFilmRespVO == null){
            return BaseResponseVO.success();
        }else{
            return BaseResponseVO.success(describeFilmRespVO);
        }

    }

    // 根据电影编号获取电影信息
    @RequestMapping(value = "/film:add",method = RequestMethod.POST)
    public BaseResponseVO saveFilmInfo(@RequestBody FilmSavedReqVO filmSavedReqVO) throws CommonServiceException {

        filmServiceAPI.saveFilm(filmSavedReqVO);

        return BaseResponseVO.success();
    }

    // 获取分页对象的公共接口
    private Map<String,Object> descrbePageResult(IPage page, String title){
        Map<String,Object> result = Maps.newHashMap();

        result.put("totalSize",page.getTotal());
        result.put("totalPages",page.getPages());
        result.put("pageSize",page.getSize());
        result.put("nowPage",page.getCurrent());

        result.put(title, page.getRecords());

        return result;
    }
}
