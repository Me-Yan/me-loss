package com.me.outer.service;

import com.me.outer.entity.LoginHistoryDTO;
import com.me.outer.mapper.LoginHistoryMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 处理登录结果的逻辑
 */
@Service
public class LoginHistoryServiceImpl implements LoginHistoryService {

    Logger logger = LoggerFactory.getLogger(LoginHistoryServiceImpl.class);

    @Autowired
    private LoginHistoryMapper loginHistoryMapper;

    /**
     * 存储用户登录的记录
     * @param loginHistory
     */
    public void saveLoginHistory(LoginHistoryDTO loginHistory) {
        logger.debug("Execute Method saveLoginHistory...");

        loginHistoryMapper.saveLoginHistory(loginHistory);
    }
}
