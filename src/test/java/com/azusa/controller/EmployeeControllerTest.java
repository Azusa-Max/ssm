package com.azusa.controller;

import com.azusa.pojo.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

//@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration
//@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class EmployeeControllerTest {
//    //传入SpringMVC的IOC容器
//    @Autowired
//    WebApplicationContext webApplicationContext;
//    //虚拟的MVC请求
//    MockMvc mockMvc;
//
//    @Before
//    public void initMockMVC(){
//        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
//    }
//    @Test
//    public void testGetEmps() throws Exception {
////        //获取请求结果返回值
////        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders
////                .get("/emps")
////                .param("pn","1"))
////                .andReturn();
////        PageInfo pageInfo = (PageInfo) mvcResult.getRequest().getAttribute("pageInfo");
////        System.out.println("总页数"+pageInfo.getPages());
////        System.out.println("总记录数"+pageInfo.getTotal());
////        int[] nums = pageInfo.getNavigatepageNums();
////        for (int i : nums) {
////            System.out.print("  "+i);
////        }
////        System.out.println();
////        List<Employee> list = pageInfo.getList();
////        for (Employee employee : list) {
////            System.out.println("ID:"+employee.getEmpId()+"--->Name"+employee.getEmpName());
////        }
//    }
}
