package com.mooc.meetingfilm.user.service;

import com.mooc.meetingfilm.utils.exception.CommonServiceException;

public interface UserService {
    String checkUserLogin(String username, String password) throws CommonServiceException;
}
