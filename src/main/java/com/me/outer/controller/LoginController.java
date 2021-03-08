package com.me.outer.controller;

import com.me.outer.constants.Constant;
import com.me.outer.entity.LoginHistoryDTO;
import com.me.outer.entity.UserDTO;
import com.me.outer.service.LoginHistoryService;
import com.me.outer.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 登录请求相关
 */
@Controller
public class LoginController {

    Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private LoginHistoryService loginHistoryService;

    /**
     * 网站首页
     * @return
     */
    @RequestMapping("/")
    public ModelAndView index() {
        logger.debug("Execute Method index...");

        return new ModelAndView("index");
    }

    /**
     * 访问登录页面
     * @return
     */
    @RequestMapping("login")
    public ModelAndView login(@RequestParam(name = "error", required = false) String error) {
        logger.debug("Execute Method login...");

        ModelAndView model = new ModelAndView("login");

        if (null != error) {
            model.addObject("error", Boolean.TRUE);
        } else {
            model.addObject("error", Boolean.FALSE);
        }


        return model;
    }

    /**
     * 用户输入用户名和密码后，点击登录进行处理
     * @param username 获取用户名
     * @param password 获取密码
     * @return
     */
    @RequestMapping("checklogin")
    public ModelAndView checklogin(@RequestParam(required = false, name = "username") String username,
                                   @RequestParam(required = false, name = "password") String password,
                                   RedirectAttributes attributes,
                                   HttpSession session,
                                   HttpServletRequest request) {
        logger.debug("Execute Method checklogin...");

        UserDTO user = userService.getUserByUsernameAndPassword(username, password);

        String page = null;
        LoginHistoryDTO loginHistory = new LoginHistoryDTO();
        loginHistory.setCreateDate(new Date());
        loginHistory.setUsername(username);
        loginHistory.setIp(request.getRemoteHost());
        // 判断用户登录信息是否正确
        if (null != user) {
            session.setAttribute("user", user); // 登录成功后将用户信息放入session中
            loginHistory.setStatus(Constant.LOGIN_OUTCOME.SUCCESS);
            page = "redirect:home";
        } else {
            // 登录失败后跳转至登录页面
            attributes.addAttribute("error", "error");
            page = "redirect:login";
            loginHistory.setStatus(Constant.LOGIN_OUTCOME.FAILED);
        }

        loginHistoryService.saveLoginHistory(loginHistory);

        return new ModelAndView(page);
    }

    /**
     * 访问用户的主页面
     * @param session
     * @return
     */
    @RequestMapping("home")
    public ModelAndView home(HttpSession session) {
        logger.debug("Execute Method home...");

        Object userObj = session.getAttribute("user");

        String page = null;
        if (null != userObj) {
            UserDTO user = (UserDTO) userObj;

            // 根据用户信息跳转至相应的首页
            if (Constant.USER_AUTHORITY.SUPER.equals(user.getType())) {
                page = "redirect:/back/application/listClaim";
            } else {
                page = "redirect:/front/application/listClaim";
            }
        } else { // 如果没有登录则进入登录页面
            page = "redirect:/login";
        }

        return new ModelAndView(page);
    }

    /**
     * 如果程序出现错误，跳转至错误页面
     * @return
     */
    @RequestMapping("error")
    public ModelAndView error() {
        logger.debug("Execute Method error...");

        return new ModelAndView("error");
    }

    /**
     * 用户请求退出登录
     * @param session
     * @return
     */
    @RequestMapping("logout")
    public ModelAndView logout(HttpSession session) {
        logger.debug("Execute Method logout...");

        Object userObj = session.getAttribute("user");

        // 如果用户登录了，则清除session中用户信息
        if (null != userObj) {
            session.removeAttribute("user");
        }

        return new ModelAndView("redirect:/front/application/listAllClaim");
    }
}
