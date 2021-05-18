package com.mooc.meetingfilm.user.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mooc.meetingfilm.user.dao.entity.MoocBackendUserT;
import com.mooc.meetingfilm.user.dao.mapper.MoocBackendUserTMapper;
import com.mooc.meetingfilm.utils.exception.CommonServiceException;
import com.mooc.meetingfilm.utils.util.MD5Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceAPI implements UserService {

    @Resource
    private MoocBackendUserTMapper tMapper;

    @Override
    public String checkUserLogin(String username, String password) throws CommonServiceException {
        QueryWrapper<MoocBackendUserT> queryWrapper = new QueryWrapper<MoocBackendUserT>();
        queryWrapper.eq("user_name",username);
        List<MoocBackendUserT> list = tMapper.selectList(queryWrapper);
        MoocBackendUserT user = null;
        if(list !=null && list.size()>0){
            user = list.stream().findFirst().get();
        }else{
            throw new CommonServiceException(404, "用户名输入有误");
        }
        // 验证密码是否正确【密码要做MD5加密，才能验证是否匹配】
        String encrypt = MD5Util.encrypt(password);

        if(!encrypt.equals(user.getUserPwd())){
            throw new CommonServiceException(500,"用户密码输入有误");
        }else{
            return user.getUuid()+"";
        }
    }
}
