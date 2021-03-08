package com.me.outer.entity;

import java.util.Date;


/**
 * 表示用户信息的类
 */
public class UserDTO {

    private Integer userId; // 用户id
    private String username;    // 用户名（即登录名）
    private String password;    // 密码
    private String sex; // 性别（男或女）
    private Integer age;    // 年龄
    private String email;   // 邮箱
    private String phone;   // 联系电话
    private String description; // 简介
    private String type;    // 用户的类型: 普通用户或者管理员, S:管理员，N：普通用户
    private Date createDate;    // 创建时间
    private String createBy;    // 创建人

    // 功能需要
    private Integer serialNo;

    public Integer getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(Integer serialNo) {
        this.serialNo = serialNo;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
}
