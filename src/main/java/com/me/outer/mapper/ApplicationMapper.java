package com.me.outer.mapper;


import com.me.outer.entity.ApplicationDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApplicationMapper {

    void saveApplication(ApplicationDTO application);

    void deleteApplicationById(Integer applicationId);

    ApplicationDTO getApplicationById(Integer applicationId);

    void deleteApplicationByUserId(Integer userId);

    List<ApplicationDTO> listClaimData(@Param("userId") Integer userId);

    List<ApplicationDTO> listBelongData(@Param("userId") Integer userId);

    List<ApplicationDTO> listPublishData(@Param("userId")Integer userId);

    List<ApplicationDTO> listProcessData();

    void updateApplicationRef(@Param("applicationId") Integer applicationId, @Param("statusRef") String statusRef);

    List<ApplicationDTO> listAllClaimData();

}
