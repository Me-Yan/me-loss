package com.me.outer.controller.backend;

import com.me.outer.entity.UserDTO;
import com.me.outer.service.UserService;
import com.me.outer.util.ResponseData;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 管理用户的类
 */
@Controller
@RequestMapping("user")
public class UserController {

    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    /**
     * 访问用户列表
     * @param message
     * @param model
     * @return
     */
    @RequestMapping("list")
    public ModelAndView listUser(@ModelAttribute("message") String message, Model model) {
        logger.debug("Execute Method listUser...");

        if (StringUtils.isNotBlank(message)) {
            model.addAttribute("message", "新增成功");
        }

        return new ModelAndView("backend/listUser");
    }

    /**
     * ajax请求用户列表数据
     * @return
     */
    @RequestMapping("listUserData")
    @ResponseBody
    public List<UserDTO> listUserData() {
        logger.debug("Execute Method listUserData...");

        return userService.listUserData();
    }

    /**
     * 新增用户的请求
     * @param userForm 表单信息直接绑定到该对象
     * @return
     */
    @RequestMapping("add")
    public ModelAndView addUser(@ModelAttribute("userForm") UserDTO userForm) {
        logger.debug("Execute Method addUser...");

        return new ModelAndView("backend/addUser");
    }

    /**
     * 确认添加用户，进行入库
     * @param userForm  绑定表单信息
     * @param session 从中获取用户信息
     * @return
     */
    @RequestMapping("confirm")
    public ModelAndView confirm(@ModelAttribute("userForm") UserDTO userForm, HttpSession session, Model model) {
        logger.debug("Execute Method confirm...");

        Object object = session.getAttribute("user");
        if (object==null) {

            userForm.setCreateBy(userForm.getUsername());
            userForm.setCreateDate(new Date());

            userService.saveUser(userForm);

            model.addAttribute("message", "注册成功。");

            return new ModelAndView("redirect:/front/application/listAllClaim");
        } else {
            UserDTO user = (UserDTO) session.getAttribute("user");

            userForm.setCreateBy(user.getUsername());
            userForm.setCreateDate(new Date());

            userService.saveUser(userForm);

            return new ModelAndView("redirect:list");
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public ResponseData deleteUser(@RequestParam("userId") Integer userId) {
        logger.debug("Execute Method deleteUser...");

        return userService.deleteUserById(userId);
    }

    /**
     * 注册请求
     * @param userForm 表单信息直接绑定到该对象
     * @return
     */
    @RequestMapping("register")
    public ModelAndView register(@ModelAttribute("userForm") UserDTO userForm) {
        logger.debug("Execute Method register...");

        return new ModelAndView("frontend/registerUser");
    }

}
