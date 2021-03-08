package com.me.outer.constants;

/**
 * Created by Me on 2019/6/4.
 */
public class Constant {

    /**
     * 用户权限
     */
    public interface USER_AUTHORITY {
        String SUPER = "S"; // 管理员
        String NORMAL = "N"; // 普通用户
    }

    /**
     * 登录成功还是失败
     */
    public interface LOGIN_OUTCOME {
        String SUCCESS = "success";
        String FAILED = "failed";
    }

    /**
     * 失物信息状态
     */
    public interface APPLICATION_STATUS {
        String PENDING = "Pending"; // 等待认领
        String PROCESSING = "Processing"; // 用户认领，等待管理员核实
        String FINISHED = "Finished";   // 失物招领被认领
        String REJECTED = "Rejected";   // 被拒绝
        String APPROVED = "Approved";   // 审核通过
    }
}
