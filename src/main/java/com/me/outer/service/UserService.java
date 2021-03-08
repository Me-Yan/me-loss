package com.me.outer.service;


import com.me.outer.entity.UserDTO;
import com.me.outer.util.ResponseData;

import java.util.List;

public interface UserService {

    UserDTO getUserByUsernameAndPassword(String username, String password);

    void saveUser(UserDTO user);

    List<UserDTO> listUserData();

    ResponseData deleteUserById(Integer userId);

    UserDTO getUserById(Integer userId);
}
