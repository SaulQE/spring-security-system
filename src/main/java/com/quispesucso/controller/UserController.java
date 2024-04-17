package com.quispesucso.controller;

import com.quispesucso.entity.UserEntity;
import com.quispesucso.service.CaptchaService;
import com.quispesucso.service.RoleService;
import com.quispesucso.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class UserController
{
    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Autowired
    private CaptchaService captchaService;

    public UserController(){
    }

    @GetMapping("/user")
    public String user_GET() {
        return "User/user";
    }

    @GetMapping("/admin")
    public String admin_GET() {
        return "User/admin";
    }

    @GetMapping("/dba")
    public String dba_GET() {
        return "User/dba";
    }

    @GetMapping("/admin/registration")
    public String registration_GET(Model model, Map map)
    {
        model.addAttribute("userEntity", new UserEntity());
        map.put("itemsRole", roleService.findAll());

        return "User/registration";
    }

    @PostMapping("/admin/registration")
    public String registration_POST(UserEntity newUser)
    {
        userService.insert(newUser);
        return "redirect:/admin";
    }

    @GetMapping("/access_denied")
    public String access_denied_GET() {
        return "User/access_denied";
    }

    @GetMapping("/login")
    public String login_GET() {
        return "User/login";
    }

    @GetMapping("/register")
    public String register_GET(Model model) {
        model.addAttribute("newUserEntity", new UserEntity());
        return "User/register";
    }

    @PostMapping("/register")
    public String register_POST(UserEntity newUser,
                                @RequestParam("g-recaptcha-response") String recaptchaResponse, HttpServletRequest request) {
        String ip = request.getRemoteAddr();
        if (!captchaService.isResponseValid(ip, recaptchaResponse)) {
            return "redirect:/register";
        }
        userService.insert(newUser);
        return "redirect:/login";
    }


    @RequestMapping(value="/logout",method= RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response)
    {
        Authentication auth= SecurityContextHolder.getContext().getAuthentication();

        if(auth!=null)
            new SecurityContextLogoutHandler().logout(request,response,auth);

        return "redirect:login?logout";
    }
}