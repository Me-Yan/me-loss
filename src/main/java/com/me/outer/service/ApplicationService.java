package com.me.outer.service;


import com.me.outer.entity.ApplicationDTO;
import com.me.outer.util.ResponseData;

import java.util.List;

public interface ApplicationService {

    void saveApplication(ApplicationDTO application);

    ResponseData deleteApplication(Integer applicationId);

    ApplicationDTO getApplicationById(Integer applicationId);

    List<ApplicationDTO> listClaimData(Integer userId);

    List<ApplicationDTO> listProcessData();

    void processApplication(Integer applicationId, String status, String processBy, String statusRef);

    List<ApplicationDTO> listBelongData(Integer userId);

    List<ApplicationDTO> listPublishData(Integer userId);

    void claimApplication(ApplicationDTO application);

    List<ApplicationDTO> listAllClaimData();
}
