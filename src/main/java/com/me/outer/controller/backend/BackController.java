package com.me.outer.controller.backend;

import com.me.outer.constants.Constant;
import com.me.outer.entity.ApplicationDTO;
import com.me.outer.entity.UserDTO;
import com.me.outer.service.ApplicationService;
import com.me.outer.service.UserService;
import com.me.outer.util.ResponseData;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 处理失物招领与报失相关的请求
 */
@Controller
@RequestMapping("back/application")
public class BackController {

    private Logger logger = LoggerFactory.getLogger(BackController.class);

    @Autowired
    private ApplicationService applicationService;

    @Autowired
    private UserService userService;

    /**
     * 访问失物招领列表页面
     * @return
     */
    @RequestMapping("listClaim")
    public ModelAndView listClaim(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listClaim...");

        if (null != message) {
            model.addAttribute("message", message);
        }

        return new ModelAndView("backend/listClaim");
    }

    /**
     * ajax请求失物招领列表的数据
     * @return
     */
    @RequestMapping("listClaimData")
    @ResponseBody
    public List<ApplicationDTO> listClaimData() {
        logger.debug("Execute Method listClaimData...");

        return applicationService.listClaimData(null);
    }

    /**
     * 跳转至发布失物招领信息页面
     */
    @RequestMapping("add")
    public ModelAndView addApplication(@ModelAttribute("applicationForm") ApplicationDTO applicationForm) {
        logger.debug("Execute Method addApplication...");

        return new ModelAndView("backend/addApplication");
    }

    /**
     * 确认发布
     */
    @RequestMapping("confirm")
    public ModelAndView confirmApplication(@ModelAttribute("applicationForm") ApplicationDTO applicationForm,
                                           HttpSession session,
                                           RedirectAttributes attributes) {
        logger.debug("Execute Method confirmApplication...");

        UserDTO user = (UserDTO) session.getAttribute("user");
        applicationForm.setUserId(user.getUserId());
        applicationForm.setCreateBy(user.getUsername());

        applicationService.saveApplication(applicationForm);

        attributes.addFlashAttribute("message", "发布成功");

        return new ModelAndView("redirect:/back/application/listClaim");
    }

    /**
     * 删除发布的信息
     */
    @RequestMapping("delete")
    @ResponseBody
    public ResponseData deleteApplication(@RequestParam("applicationId") Integer applicationId) {
        logger.debug("Execute Method deleteApplication...");

        return applicationService.deleteApplication(applicationId);
    }

    /**
     * 查看失物招领详情
     */
    @RequestMapping("detail/{applicationId}")
    public ModelAndView detail(@PathVariable("applicationId") Integer applicationId, Model model) {
        logger.debug("Execute Method detail...");

        ApplicationDTO application = applicationService.getApplicationById(applicationId);

        model.addAttribute("application", application);

        return new ModelAndView("backend/detailApplication");
    }

    /**
     * 跳转到待审核信息列表的页面
     * @return
     */
    @RequestMapping("listProcess")
    public ModelAndView listProcess(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listProcess...");

        if (StringUtils.isNotBlank(message)) {
            model.addAttribute("message", "审核完毕。");
        }

        return new ModelAndView("backend/listProcess");
    }

    /**
     * 访问待审核信息列表
     * @return
     */
    @RequestMapping("listProcessData")
    @ResponseBody
    public List<ApplicationDTO> listProcessData() {
        logger.debug("Execute Method listProcessData...");

        return applicationService.listProcessData();
    }

    /**
     * 管理进入认领审核页面
     * @param applicationId
     * @param model
     * @return
     */
    @RequestMapping("process/{applicationId}")
    public ModelAndView processApplication(@PathVariable("applicationId") Integer applicationId, Model model) {
        logger.debug("Execute Method processApplication...");

        ApplicationDTO application = applicationService.getApplicationById(applicationId);
        UserDTO user = userService.getUserById(application.getApplicationStatus().getBelongId());

        model.addAttribute("application", application);
        model.addAttribute("user", user);

        return new ModelAndView("backend/processApplication");
    }

    /**
     * 通过审核
     * @param applicationId
     * @param attributes
     * @return
     */
    @RequestMapping("approve/{applicationId}")
    public ModelAndView approveApplication(@PathVariable("applicationId") Integer applicationId, RedirectAttributes attributes, HttpSession session) {
        logger.debug("Execute Method approveApplication...");

        UserDTO user = (UserDTO) session.getAttribute("user");

        ApplicationDTO application = applicationService.getApplicationById(applicationId);

        applicationService.processApplication(applicationId, Constant.APPLICATION_STATUS.APPROVED, user.getUsername(), application.getStatusRef());


        attributes.addFlashAttribute("message", "审核完毕");

        return new ModelAndView("redirect:/back/application/listProcess");
    }

    /**
     * 拒绝认领
     * @param applicationId
     * @param attributes
     * @param session
     * @return
     */
    @RequestMapping("reject/{applicationId}")
    public ModelAndView rejectApplication(@PathVariable("applicationId") Integer applicationId, RedirectAttributes attributes, HttpSession session) {
        logger.debug("Execute Method rejectApplication...");

        UserDTO user = (UserDTO) session.getAttribute("user");

        ApplicationDTO application = applicationService.getApplicationById(applicationId);

        applicationService.processApplication(applicationId, Constant.APPLICATION_STATUS.REJECTED, user.getUsername(), application.getStatusRef());


        attributes.addFlashAttribute("message", "审核完毕");

        return new ModelAndView("redirect:/back/application/listProcess");
    }

}
