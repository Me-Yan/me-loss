package com.me.outer.service;

import com.me.outer.entity.LoginHistoryDTO;

/**
 * Created by Me on 2019/6/4.
 */
public interface LoginHistoryService {

    void saveLoginHistory(LoginHistoryDTO loginHistory);
}
