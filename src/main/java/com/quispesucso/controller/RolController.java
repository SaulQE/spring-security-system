package com.quispesucso.controller;

import com.quispesucso.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class RolController
{
    @Autowired
    private RoleService roleService;

    public RolController(){}

    @GetMapping("/dba/roles")
    public String listar_GET(Map map)
    {
        map.put("rolesDb", roleService.findAllOrderBy());
        return "Role/listar";
    }

}
