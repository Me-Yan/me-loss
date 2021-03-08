package com.me.outer.mapper;


import com.me.outer.entity.UserDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    UserDTO getUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    void saveUser(UserDTO user);

    List<UserDTO> listUserData();

    void deleteUserById(Integer userId);

    UserDTO getUserById(Integer userId);
}
