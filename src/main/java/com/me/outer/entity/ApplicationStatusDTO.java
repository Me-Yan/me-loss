package com.me.outer.entity;

import java.util.Date;

/**
 * 跟踪失物招领信息状态的类
 */
public class ApplicationStatusDTO {

    private String statusRef;   // 状态表id
    private Integer applicationId;  // 失物招领信息id
    private Integer belongId;   // 认领人的id
    private String description; // 认领人的简要描述
    private String status;  //  状态
    private Date processDate;   // 管理员确认招领的时间
    private String processBy;   // 由哪个管理员确认某个信息被招领
    private Date createDate;    // 记录生成时间
    private String createBy;    // 由谁引起的记录生成

    public String getStatusRef() {
        return statusRef;
    }

    public void setStatusRef(String statusRef) {
        this.statusRef = statusRef;
    }

    public Integer getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(Integer applicationId) {
        this.applicationId = applicationId;
    }

    public Integer getBelongId() {
        return belongId;
    }

    public void setBelongId(Integer belongId) {
        this.belongId = belongId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getProcessDate() {
        return processDate;
    }

    public void setProcessDate(Date processDate) {
        this.processDate = processDate;
    }

    public String getProcessBy() {
        return processBy;
    }

    public void setProcessBy(String processBy) {
        this.processBy = processBy;
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
