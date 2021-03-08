package com.me.outer.mapper;

import com.me.outer.entity.LoginHistoryDTO;

/**
 * Created by Me on 2019/6/4.
 */
public interface LoginHistoryMapper {

    void saveLoginHistory(LoginHistoryDTO loginHistory);
}
