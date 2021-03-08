package com.me.outer.entity;

import java.util.Date;

/**
 * 用户登录记录
 */
public class LoginHistoryDTO {

    private Integer loginId;    // 登录表id
    private String username;    // 登录的用户名
    private String ip;  // 登录用户的ip
    private String status;  // 登录成功还是失败
    private Date createDate;    // 登录时间

    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
