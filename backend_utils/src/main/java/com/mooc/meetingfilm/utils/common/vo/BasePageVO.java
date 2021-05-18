package com.mooc.meetingfilm.utils.common.vo;

import com.mooc.meetingfilm.utils.exception.CommonServiceException;
import lombok.Data;

@Data
public class BasePageVO extends BaserRequestVO{
    private Integer nowPage = 1;
    private Integer pageSize = 10;

    @Override
    public void checkParam() throws CommonServiceException {

    }
}
