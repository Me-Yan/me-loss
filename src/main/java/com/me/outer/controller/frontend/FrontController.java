package com.me.outer.controller.frontend;

import com.me.outer.entity.ApplicationDTO;
import com.me.outer.entity.UserDTO;
import com.me.outer.service.ApplicationService;
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

@Controller
@RequestMapping("front/application")
public class FrontController {

    private Logger logger = LoggerFactory.getLogger(FrontController.class);

    @Autowired
    private ApplicationService applicationService;

    @RequestMapping("delete/{applicationId}")
    @ResponseBody
    public ModelAndView deleteApplication(@PathVariable("applicationId") Integer applicationId, RedirectAttributes attributes) {
        logger.debug("Execute Method deleteApplication...");

        applicationService.deleteApplication(applicationId);

        attributes.addAttribute("message", "删除成功。");

        return new ModelAndView("redirect:/front/application/listPublish");
    }

    @RequestMapping("claim/{applicationId}")
    public ModelAndView claimApplication(@PathVariable("applicationId") Integer applicationId, Model model) {
        logger.debug("Execute Method claimApplication...");

        ApplicationDTO application = applicationService.getApplicationById(applicationId);
        model.addAttribute("applicationForm", application);

        return new ModelAndView("frontend/claimApplication");
    }

    @RequestMapping("confirmClaim")
    public ModelAndView confirmClaim(@ModelAttribute("applicationForm") ApplicationDTO applicationForm, RedirectAttributes attributes, HttpSession session) {
        logger.debug("Execute Method confirmClaim...");

        UserDTO user = (UserDTO) session.getAttribute("user");
        applicationForm.setUserId(user.getUserId());

        applicationService.claimApplication(applicationForm);

        attributes.addAttribute("message", "已发起申请，等待管理员审核。");

        return new ModelAndView("redirect:/front/application/listClaim");
    }

    /**
     * 查看失物招领详情
     */
    @RequestMapping("detail/{applicationId}")
    public ModelAndView detail(@PathVariable("applicationId") Integer applicationId, Model model) {
        logger.debug("Execute Method detail...");

        ApplicationDTO application = applicationService.getApplicationById(applicationId);

        model.addAttribute("application", application);

        return new ModelAndView("frontend/detailApplication");
    }

    /**
     * 跳转至发布失物招领信息页面
     */
    @RequestMapping("add")
    public ModelAndView add(@ModelAttribute("applicationForm") ApplicationDTO applicationForm) {
        logger.debug("Execute Method add...");

        return new ModelAndView("frontend/addApplication");
    }

    /**
     * 确认发布
     */
    @RequestMapping("confirm")
    public ModelAndView confirm(@ModelAttribute("applicationForm") ApplicationDTO applicationForm,
                                           HttpSession session,
                                           RedirectAttributes attributes) {
        logger.debug("Execute Method confirm...");

        UserDTO user = (UserDTO) session.getAttribute("user");
        applicationForm.setUserId(user.getUserId());
        applicationForm.setCreateBy(user.getUsername());

        applicationService.saveApplication(applicationForm);

        attributes.addFlashAttribute("message", "发布成功");

        return new ModelAndView("redirect:/front/application/listPublish");
    }

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

        return new ModelAndView("frontend/listClaim");
    }

    /**
     * ajax请求失物招领列表的数据
     * @return
     */
    @RequestMapping("listClaimData")
    @ResponseBody
    public List<ApplicationDTO> listClaimData(HttpSession session) {
        logger.debug("Execute Method listClaimData...");

        UserDTO user = (UserDTO) session.getAttribute("user");

        Integer userId = user.getUserId();

        return applicationService.listClaimData(userId);
    }

    /**
     * 访问我的认领页面
     * @return
     */
    @RequestMapping("listBelong")
    public ModelAndView listBelong(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listBelong...");

        if (null != message) {
            model.addAttribute("message", message);
        }

        return new ModelAndView("frontend/listBelong");
    }

    /**
     * ajax请求我的认领列表
     * @return
     */
    @RequestMapping("listBelongData")
    @ResponseBody
    public List<ApplicationDTO> listBelongData(HttpSession session) {
        logger.debug("Execute Method listBelongData...");

        UserDTO user = (UserDTO) session.getAttribute("user");

        Integer userId = user.getUserId();

        List<ApplicationDTO> applicationList = applicationService.listBelongData(userId);

        return applicationList;
    }

    /**
     * 访问我的发布
     * @return
     */
    @RequestMapping("listPublish")
    public ModelAndView listPublish(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listBelong...");

        if (null != message) {
            model.addAttribute("message", message);
        }

        return new ModelAndView("frontend/listPublish");
    }

    /**
     * ajax请求我的发布数据
     * @return
     */
    @RequestMapping("listPublishData")
    @ResponseBody
    public List<ApplicationDTO> listPublishData(HttpSession session) {
        logger.debug("Execute Method listPublishData...");

        UserDTO user = (UserDTO) session.getAttribute("user");

        Integer userId = user.getUserId();

        return applicationService.listPublishData(userId);
    }

    /**
     * 游客访问失物招领列表页面
     * @return
     */
    @RequestMapping("listAllClaim")
    public ModelAndView listAllClaim(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listAllClaim...");

        if (null != message) {
            model.addAttribute("message", message);
        }

        return new ModelAndView("frontend/listAllClaim");
    }

    /**
     * 游客ajax请求失物招领列表的数据
     * @return
     */
    @RequestMapping("listAllClaimData")
    @ResponseBody
    public List<ApplicationDTO> listAllClaimData(HttpSession session) {
        logger.debug("Execute Method listAllClaimData...");

        return applicationService.listAllClaimData();
    }
}
