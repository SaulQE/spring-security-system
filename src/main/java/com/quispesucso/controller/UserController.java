package com.quispesucso.controller;

import com.quispesucso.entity.UserEntity;
import com.quispesucso.service.RoleService;
import com.quispesucso.service.UserService;
import com.quispesucso.util.CaptchaGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class UserController
{
    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    public UserController(){
    }

    @GetMapping("/user")
    public String user_GET() {
        return "user";
    }

    @GetMapping("/admin")
    public String admin_GET() {
        return "admin";
    }

    @GetMapping("/dba")
    public String dba_GET() {
        return "dba";
    }

    @GetMapping("/admin/registration")
    public String registration_GET(Model model, Map map)
    {
        model.addAttribute("userEntity", new UserEntity());
        map.put("itemsRole", roleService.findAll());

        return "registration";
    }

    @PostMapping("/admin/registration")
    public String registration_POST(UserEntity newUser)
    {
        userService.insert(newUser);
        return "redirect:/admin";
    }

    @GetMapping("/access_denied")
    public String access_denied_GET() {
        return "access_denied";
    }

    @GetMapping("/login")
    public String login_GET() {
        return "login";
    }

    @GetMapping("/register")
    public String register_GET(Model model, HttpSession session) {
        model.addAttribute("newUserEntity", new UserEntity());
        String captcha = new CaptchaGenerator().generateCaptcha();
        session.setAttribute("captcha", captcha);
        model.addAttribute("captcha", captcha);
        return "register";
    }

    @PostMapping("/register")
    public String register_POST(UserEntity newUser, @RequestParam("captcha") String userInput, HttpSession session) {
        String captcha = (String) session.getAttribute("captcha");
        if (captcha.equals(userInput)) {
            userService.insert(newUser);
            return "redirect:/login";
        } else {
            return "redirect:/register";
        }
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
