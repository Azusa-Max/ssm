package com.azusa.dao;

import com.azusa.pojo.Department;
import com.azusa.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD(){
        //查询单个员工+部门信息
//        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(2);
//        System.out.println(employee);

        //批量插入员工信息
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String string = UUID.randomUUID().toString().substring(0,5)+""+i;
            mapper.insertSelective(new Employee(null,string,"男",string+"@qq.com",1001));
        }
        System.out.println("批量插入成功");
    }
}
