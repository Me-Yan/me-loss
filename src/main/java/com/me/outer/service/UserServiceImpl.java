package com.me.outer.service;

import com.me.outer.entity.UserDTO;
import com.me.outer.mapper.ApplicationMapper;
import com.me.outer.mapper.ApplicationStatusMapper;
import com.me.outer.mapper.UserMapper;
import com.me.outer.util.ResponseData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 跟用户相关的类
 */
@Service
public class UserServiceImpl implements UserService {

    Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ApplicationMapper applicationMapper;

    @Autowired
    private ApplicationStatusMapper applicationStatusMapper;

    /**
     * 匹配用户
     * @param username
     * @param password
     * @return
     */
    public UserDTO getUserByUsernameAndPassword(String username, String password) {
        logger.debug("Execute Method getUserByUsernameAndPassword...");

        return userMapper.getUserByUsernameAndPassword(username, password);
    }

    /**
     * 保存用户信息
     * @param user
     */
    public void saveUser(UserDTO user) {
        logger.debug("Execute Method saveUser...");

        userMapper.saveUser(user);
    }

    /**
     * 查询用户想信息
     * @return
     */
    public List<UserDTO> listUserData() {
        logger.debug("Execute Method listUserData...");

        return userMapper.listUserData();
    }

    /**
     * 删除用户
     * @param userId 用户id
     */
    public ResponseData deleteUserById(Integer userId) {
        logger.debug("Execute Method deleteUserById...");

        ResponseData responseData = new ResponseData();

        try {
            userMapper.deleteUserById(userId);
            applicationMapper.deleteApplicationByUserId(userId);
            applicationStatusMapper.deleteApplicationStatusByUserId(userId);

            responseData.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("删除用户发生错误。", e);
            responseData.setSuccess(Boolean.FALSE);
        }

        return responseData;
    }

    /**
     * 根据id获取用户信息
     * @param userId
     * @return
     */
    public UserDTO getUserById(Integer userId) {
        logger.debug("Execute Method getUserById...");

        return userMapper.getUserById(userId);
    }
}
