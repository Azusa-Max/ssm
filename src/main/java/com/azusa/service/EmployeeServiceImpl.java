package com.azusa.service;

import com.azusa.dao.EmployeeMapper;
import com.azusa.pojo.Employee;
import com.azusa.pojo.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public class EmployeeServiceImpl{
    @Autowired
    private EmployeeMapper employeeMapper;

    public void setEmployeeMapper(EmployeeMapper employeeMapper) {
        this.employeeMapper = employeeMapper;
    }

    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public Integer insert(Employee employee){
        return employeeMapper.insertSelective(employee);
    }

    public boolean checkUser(String empName){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long countByExample = employeeMapper.countByExample(employeeExample);
        return countByExample == 0;
    }

    public Employee getEmployee(Integer id){
        return employeeMapper.selectByPrimaryKey(id);
    }

    public Integer updateEmployee(Employee employee){
        return employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public Integer deleteEmployee(Integer id){
        return employeeMapper.deleteByPrimaryKey(id);
    }

    public Integer deleteEmployees(List<Integer> ids){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(ids);
        return employeeMapper.deleteByExample(employeeExample);
    }
}
