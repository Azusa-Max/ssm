package com.azusa.service;

import com.azusa.dao.DepartmentMapper;
import com.azusa.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    /**
    * @Description:返回所有的部门信息
    * @author: hasee
    * @date: 2020/6/4 0004
    * @Param:
    * @return:
    **/
    public List<Department> getDeptAll(){
        return departmentMapper.selectByExample(null);
    }
}
