package com.mooc.meetingfilm.film.controller.vo;

import lombok.Data;

@Data
public class DescribeFilmsRespVO{

    private String filmId;
    private String filmStatus;
    private String filmName;
    private String filmEnName;
    private String filmScore;
    private String preSaleNum;
    private String boxOffice;
    private String filmTime;
    private String filmLength;
    private String mainImg;

}
