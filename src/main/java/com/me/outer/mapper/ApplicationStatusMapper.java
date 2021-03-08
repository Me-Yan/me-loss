package com.me.outer.mapper;

import com.me.outer.entity.ApplicationDTO;
import com.me.outer.entity.ApplicationStatusDTO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface ApplicationStatusMapper {

    void saveApplicationStatus(ApplicationStatusDTO applicationStatus);

    void deleteApplicationStatusById(Integer applicationId);

    void deleteApplicationStatusByUserId(Integer userId);

    void processApplication(@Param("statusRef") String statusRef, @Param("processBy") String processBy,
                            @Param("processDate") Date processDate, @Param("status") String status);

    void claimApplication(ApplicationStatusDTO applicationStatus);
}
