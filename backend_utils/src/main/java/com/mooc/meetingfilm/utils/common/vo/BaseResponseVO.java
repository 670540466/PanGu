package com.mooc.meetingfilm.utils.common.vo;

import com.mooc.meetingfilm.utils.exception.CommonServiceException;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author : jiangzh
 * @program : com.mooc.meetingfilm.utils.common.vo
 * @description : 表现层公共返回
 **/
@ApiModel(value="BaseResponseVO对象",description="基础响应对象BaseResponseVO")
@Data
public class BaseResponseVO<M> {

    @ApiModelProperty(name = "code",value = "业务编号")
    private Integer code;   // 业务编号

    @ApiModelProperty(name = "message",value = "异常信息")
    private String message; // 异常信息

    @ApiModelProperty(name = "data",value = "业务数据返回")
    private M data;         // 业务数据返回

    private BaseResponseVO(){}

    // 成功但是无参数
    public static BaseResponseVO success(){
        BaseResponseVO response = new BaseResponseVO();
        response.setCode(200);
        response.setMessage("");
        return response;
    }

    // 成功有参数
    public static<M> BaseResponseVO success(M data){
        BaseResponseVO response = new BaseResponseVO();
        response.setCode(200);
        response.setMessage("");
        response.setData(data);
        return response;
    }

    // 未登录异常
    public static<M> BaseResponseVO noLogin(){
        BaseResponseVO response = new BaseResponseVO();
        response.setCode(401);
        response.setMessage("请登录");
        return response;
    }

    // 出现业务异常
    public static<M> BaseResponseVO serviceException(CommonServiceException e){
        BaseResponseVO response = new BaseResponseVO();
        response.setCode(e.getCode());
        response.setMessage(e.getMessage());
        return response;
    }

}
