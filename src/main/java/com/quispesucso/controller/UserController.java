package com.quispesucso.controller;

import com.quispesucso.entity.UserEntity;
import com.quispesucso.service.CaptchaService;
import com.quispesucso.service.RoleService;
import com.quispesucso.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class UserController
{
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    public UserController(){
    }

    @GetMapping("/admin/users")
    public String listar_GET(Map map)
    {
        map.put("usersDb", userService.findAll());
        return "User/listar";
    }

    @GetMapping("/admin/user/registration")
    public String registration_GET(Model model, Map map)
    {
        model.addAttribute("userEntity", new UserEntity());
        map.put("itemsRole", roleService.findAll());

        return "User/registration";
    }

    @PostMapping("/admin/user/registration")
    public String registration_POST(UserEntity newUser)
    {
        userService.insert(newUser);
        return "redirect:/admin";
    }

}
