package com.azusa.controller;

import com.azusa.pojo.Employee;
import com.azusa.pojo.Msg;
import com.azusa.service.EmployeeServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeServiceImpl employeeService;

    //不适用Ajax时
/*    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 6);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> employees = employeeService.getAll();
        //把查询的全部数据封装到pageInfo中,5的参数表示连续显示的页数
        PageInfo pageInfo = new PageInfo(employees,6);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }*/
    //使用Ajax时
    @RequestMapping(value = "/emps",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 6);
        //startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> employees = employeeService.getAll();
        //把查询的全部数据封装到pageInfo中,5的参数表示连续显示的页数
        PageInfo pageInfo = new PageInfo(employees,6);
        return Msg.success().add("pageInfo",pageInfo);
    }

    //新增一名员工
    @ResponseBody
    @RequestMapping(value = "/addEmp",method = RequestMethod.POST)
    public Msg addEmp(Employee employee){
        System.out.println(employee);
        employeeService.insert(employee);
        return Msg.success();
    }

    //检查用户名是否可用
    @ResponseBody
    @RequestMapping(value = "/checkUser",method = RequestMethod.POST)
    public Msg checkUser(@RequestParam("empName") String empName){
        //先判断用户名是否是合法的表达式
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名可以是2-5位中文或者6-16位英文和数字的组合");
        }
        //数据库用户名重复校验
        boolean b = employeeService.checkUser(empName);
        if (!b){
            return Msg.fail().add("va_msg","用户名已存在");
        }
        return Msg.success();
    }

    /**
    * @Description: 员工保存,支持JSR303校验
    * @author: hasee
    * @date: 2020/6/5 0005
    * @Param: [employee, bindingResult]
    * @return:com.azusa.pojo.Msg
    **/
    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult bindingResult){
        if (bindingResult.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String,Object> map = new HashMap<String, Object>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError error : fieldErrors) {
                System.out.println("错误的字段名："+error.getField());
                System.out.println("错误信息："+error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else{
            employeeService.insert(employee);
            return Msg.success();
        }
    }
    /**
    * @Description:前端获取id查询员工信息返回
    * @author: hasee
    * @date: 2020/6/6 0006
    * @Param: [id]
    * @return:com.azusa.pojo.Msg
    **/
    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmployee(id);
        return Msg.success().add("emp",employee);
    }
    /**
    * @Description:员工更新
    * @author: hasee
    * @date: 2020/6/6 0006
    * @Param: [employee]
    * @return:com.azusa.pojo.Msg
    **/
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
        employeeService.updateEmployee(employee);
        return Msg.success();
    }
    /**
    * @Description: 删除员工，如果传入“1-2-3”格式则批量删除，否则为单个删除
    * @author: hasee
    * @date: 2020/6/6 0006
    * @Param: [ids]
    * @return:com.azusa.pojo.Msg
    **/
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids") String ids){
        if (ids.contains("-")){
            List<Integer> list = new ArrayList<Integer>();
            String[] split = ids.split("-");
            for (String s : split) {
                list.add(Integer.parseInt(s));
            }
            employeeService.deleteEmployees(list);
        }else{
            Integer empId = Integer.parseInt(ids);
            employeeService.deleteEmployee(empId);
        }
        return Msg.success();
    }
}
