package com.me.outer.entity;

import java.util.Date;

/**
 * 表示失物招领信息的类
 */
public class ApplicationDTO {

    private Integer applicationId;  // 表id
    private Integer userId; // 发布信息用户的id
    private String title;   // 发布信息标题
    private String type;    // 物品类型
    private String address; // 遗失位置
    private String content; // 发布信息内容
    private Date createDate;  // 记录生成时间
    private String createBy;    // 谁引起该记录生成
    private String statusRef;   //   状态表外键
    private ApplicationStatusDTO applicationStatus;

    // 功能需要
    private int serialNo;
    private String status;
    private String createDateStr;

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(int serialNo) {
        this.serialNo = serialNo;
    }

    public Integer getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(Integer applicationId) {
        this.applicationId = applicationId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public ApplicationStatusDTO getApplicationStatus() {
        return applicationStatus;
    }

    public void setApplicationStatus(ApplicationStatusDTO applicationStatus) {
        this.applicationStatus = applicationStatus;
    }

    public String getStatusRef() {
        return statusRef;
    }

    public void setStatusRef(String statusRef) {
        this.statusRef = statusRef;
    }
}
