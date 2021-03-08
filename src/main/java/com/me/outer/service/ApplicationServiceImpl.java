package com.me.outer.service;

import com.me.outer.constants.Constant;
import com.me.outer.entity.ApplicationDTO;
import com.me.outer.entity.ApplicationStatusDTO;
import com.me.outer.mapper.ApplicationMapper;
import com.me.outer.mapper.ApplicationStatusMapper;
import com.me.outer.util.DateUtil;
import com.me.outer.util.ResponseData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;


/**
 * 跟失物招领与报失相关的逻辑
 */
@Service
public class ApplicationServiceImpl implements ApplicationService {

    private Logger logger = LoggerFactory.getLogger(ApplicationServiceImpl.class);

    @Autowired
    private ApplicationMapper applicationMapper;

    @Autowired
    private ApplicationStatusMapper applicationStatusMapper;

    /**
     * 保存失物招领信息
     */
    public void saveApplication(ApplicationDTO application) {
        logger.debug("Execute Method saveApplication...");

        String statusRef = UUID.randomUUID().toString();

        application.setCreateDate(new Date());
        application.setStatusRef(statusRef);

        applicationMapper.saveApplication(application);

        ApplicationStatusDTO applicationStatus = new ApplicationStatusDTO();
        applicationStatus.setStatusRef(statusRef);
        applicationStatus.setApplicationId(application.getApplicationId());
        applicationStatus.setStatus(Constant.APPLICATION_STATUS.PENDING);
        applicationStatus.setCreateBy(application.getCreateBy());
        applicationStatus.setCreateDate(new Date());

        applicationStatusMapper.saveApplicationStatus(applicationStatus);
    }

    /**
     * 删除发布的信息
     */
    public ResponseData deleteApplication(Integer applicationId) {
        logger.debug("Execute Method deleteApplication...");

        ResponseData responseData = new ResponseData();

        try {
            applicationMapper.deleteApplicationById(applicationId);
            applicationStatusMapper.deleteApplicationStatusById(applicationId);

            responseData.setSuccess(Boolean.TRUE);
        } catch (Exception e) {
            logger.error("删除发布的信息发生错误", e);
            responseData.setSuccess(Boolean.FALSE);
            responseData.setMessage("删除失败，请重新操作！");
        }

        return responseData;
    }

    /**
     * 根据id获取失物招领信息
     */
    public ApplicationDTO getApplicationById(Integer applicationId) {
        logger.debug("Execute Method getApplicationById...");

        return applicationMapper.getApplicationById(applicationId);
    }

    /**
     * 获取待任何的信息数据
     * @return
     */
    public List<ApplicationDTO> listClaimData(Integer userId) {
        logger.debug("Execute Method listClaimData...");

        return applicationMapper.listClaimData(userId);
    }

    /**
     * 通过审核
     * @param applicationId
     */
    public void processApplication(Integer applicationId, String status, String processBy, String statusRef) {
        logger.debug("Execute Method processApplication...");

        applicationStatusMapper.processApplication(statusRef, processBy, new Date(), status);

        String newStatusRef = UUID.randomUUID().toString();

        applicationMapper.updateApplicationRef(applicationId, newStatusRef);

        ApplicationStatusDTO applicationStatus = new ApplicationStatusDTO();
        applicationStatus.setStatusRef(newStatusRef);
        applicationStatus.setApplicationId(applicationId);
        applicationStatus.setStatus(Constant.APPLICATION_STATUS.PENDING);
        applicationStatus.setCreateBy(processBy);
        applicationStatus.setCreateDate(new Date());

        applicationStatusMapper.saveApplicationStatus(applicationStatus);
    }

    public List<ApplicationDTO> listBelongData(Integer userId) {
        logger.debug("Execute Method listBelongData...");

        return applicationMapper.listBelongData(userId);
    }

    public List<ApplicationDTO> listPublishData(Integer userId) {
        logger.debug("Execute Method listPublishData...");

        return applicationMapper.listPublishData(userId);
    }

    public void claimApplication(ApplicationDTO application) {
        logger.debug("Execute Method claimApplication...");

        ApplicationStatusDTO applicationStatus = application.getApplicationStatus();
        applicationStatus.setBelongId(application.getUserId());
        applicationStatus.setApplicationId(application.getApplicationId());
        applicationStatus.setStatus(Constant.APPLICATION_STATUS.PROCESSING);
        applicationStatus.setStatusRef(application.getStatusRef());

        applicationStatusMapper.claimApplication(application.getApplicationStatus());
    }

    public List<ApplicationDTO> listProcessData() {
        logger.debug("Execute Method listProcessData...");

        return applicationMapper.listProcessData();
    }

    public List<ApplicationDTO> listAllClaimData() {
        logger.debug("Execute Method listAllClaimData...");

        return applicationMapper.listAllClaimData();
    }
}
