package com.mooc.meetingfilm.film.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mooc.meetingfilm.apis.film.vo.DescribeFilmRespVO;
import com.mooc.meetingfilm.film.controller.vo.DescribeActorsRespVO;
import com.mooc.meetingfilm.film.controller.vo.DescribeFilmsRespVO;
import com.mooc.meetingfilm.film.controller.vo.FilmSavedReqVO;
import com.mooc.meetingfilm.film.dao.entity.MoocFilmActorT;
import com.mooc.meetingfilm.film.dao.entity.MoocFilmInfoT;
import com.mooc.meetingfilm.film.dao.entity.MoocFilmT;
import com.mooc.meetingfilm.film.dao.mapper.MoocActorTMapper;
import com.mooc.meetingfilm.film.dao.mapper.MoocFilmActorTMapper;
import com.mooc.meetingfilm.film.dao.mapper.MoocFilmInfoTMapper;
import com.mooc.meetingfilm.film.dao.mapper.MoocFilmTMapper;
import com.mooc.meetingfilm.utils.exception.CommonServiceException;
import com.mooc.meetingfilm.utils.util.ToolUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class FileServiceImpl implements FileServiceAPI {

    @Resource
    private MoocActorTMapper actorTMapper;

    @Resource
    private MoocFilmTMapper filmTMapper;

    @Resource
    private MoocFilmInfoTMapper filmInfoTMapper;

    @Resource
    private MoocFilmActorTMapper filmActorTMapper;

    @Override
    public IPage<DescribeActorsRespVO> describeActors(int nowPage, int pageSize) throws CommonServiceException {
        return actorTMapper.describeActors(new Page<>(nowPage, pageSize));
    }


    @Override
    public IPage<DescribeFilmsRespVO> describeFilms(int nowPage, int pageSize) throws CommonServiceException {
        return filmTMapper.describeFilms(new Page<>(nowPage, pageSize));
    }

    @Override
    public DescribeFilmRespVO describeFilmById(String filmId) throws CommonServiceException {
        return filmTMapper.descrbeFilmById(filmId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveFilm(FilmSavedReqVO reqVO) throws CommonServiceException {
        try{
            // ??????????????????
            MoocFilmT film = new MoocFilmT();
            film.setFilmName(reqVO.getFilmName());
            film.setFilmType(ToolUtils.str2Int(reqVO.getFilmTypeId()));
            film.setImgAddress(reqVO.getMainImgAddress());
            film.setFilmScore(reqVO.getFilmScore());
            film.setFilmPresalenum(ToolUtils.str2Int(reqVO.getPreSaleNum()));
            film.setFilmBoxOffice(ToolUtils.str2Int(reqVO.getBoxOffice()));
            film.setFilmSource(ToolUtils.str2Int(reqVO.getFilmSourceId()));
            film.setFilmCats(reqVO.getFilmCatIds());
            film.setFilmArea(ToolUtils.str2Int(reqVO.getAreaId()));
            film.setFilmDate(ToolUtils.str2Int(reqVO.getDateId()));
            film.setFilmTime(ToolUtils.str2LocalDateTime(reqVO.getFilmTime()+" 00:00:00"));
            film.setFilmStatus(ToolUtils.str2Int(reqVO.getFilmStatus()));

            filmTMapper.insert(film);
            // ??????????????????
            MoocFilmInfoT filmInfo = new MoocFilmInfoT();

            filmInfo.setFilmId(film.getUuid()+"");
            filmInfo.setFilmEnName(reqVO.getFilmEnName());
            filmInfo.setFilmScore(reqVO.getFilmScore());
            filmInfo.setFilmScoreNum(ToolUtils.str2Int(reqVO.getFilmScorers()));
            filmInfo.setFilmLength(ToolUtils.str2Int(reqVO.getFilmLength()));
            filmInfo.setBiography(reqVO.getBiography());
            filmInfo.setDirectorId(ToolUtils.str2Int(reqVO.getDirectorId()));
            filmInfo.setFilmImgs(reqVO.getFilmImgs());


            filmInfoTMapper.insert(filmInfo);

            String[] actorId = reqVO.getActIds().split("#");
            String[] roleNames = reqVO.getRoleNames().split("#");
            if(actorId.length != roleNames.length){
                throw new CommonServiceException(500, "?????????????????????????????????");
            }

            for(int i=0;i<actorId.length;i++){
                // ?????????????????????
                MoocFilmActorT filmActor = new MoocFilmActorT();

                filmActor.setFilmId(film.getUuid());
                filmActor.setActorId(ToolUtils.str2Int(actorId[i]));
                filmActor.setRoleName(roleNames[i]);


                filmActorTMapper.insert(filmActor);
            }
        }catch (Exception e){
            throw new CommonServiceException(500, e.getMessage());
        }
    }

}
