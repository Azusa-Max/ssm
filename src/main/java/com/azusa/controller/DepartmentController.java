package com.azusa.controller;

import com.azusa.pojo.Department;
import com.azusa.pojo.Msg;
import com.azusa.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

//处理和部门有关的请求
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    //查询所有部门信息
    @ResponseBody
    @RequestMapping("/getDeptAll")
    public Msg getDeptAll(){
        List<Department> deptAll = departmentService.getDeptAll();
        return Msg.success().add("deptAll",deptAll);
    }

}
