package com.azusa.pojo;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",
            message = "用户名必须是2-5位中文或者6-16位英文和数字的组合")
    private String empName;

    private String gread;

    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message = "邮箱格式不正确")
    private String email;

    private Integer dId;

    private Department department;

    public Employee() {
    }

    public Employee(Integer empId, String empName, String gread, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gread = gread;
        this.email = email;
        this.dId = dId;
    }

    public Employee(Integer empId, String empName, String gread, String email, Integer dId, Department department) {
        this.empId = empId;
        this.empName = empName;
        this.gread = gread;
        this.email = email;
        this.dId = dId;
        this.department = department;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGread() {
        return gread;
    }

    public void setGread(String gread) {
        this.gread = gread == null ? null : gread.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gread='" + gread + '\'' +
                ", email='" + email + '\'' +
                ", department=" + department +
                '}';
    }
}