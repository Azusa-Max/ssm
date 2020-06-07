<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/6/3 0003
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <title>SSM—CRUD</title>
</head>
<body>
<!-- 新增员工模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--员工名--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="请输入员工姓名">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性      别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gread" id="empGender_M_add_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gread" id="empGender_W_add_input" value="女"> 女
                            </label>
                        </div>
                    </div>

                    <%--员工邮箱--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="empEmail_add_input" placeholder="请输入员工邮箱">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <%--部门--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部      门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改员工模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel_update">修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--员工名--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性      别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gread" id="empGender_M_update_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gread" id="empGender_W_update_input" value="女"> 女
                            </label>
                        </div>
                    </div>

                    <%--员工邮箱--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="empEmail_update_input" placeholder="请输入员工邮箱">
                            <span  class="help-block"></span>
                        </div>
                    </div>
                    <%--部门--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部      门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<%--页面显示内容--%>
<div class="container">
    <%--标签--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--    编辑按钮--%>
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <button type="button" class="btn btn-primary btn-lg" id="emp_add_modal_btn">添加</button>
            <button type="button" class="btn btn-danger btn-lg" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <%--    表格--%>
    <div class="row">
        <table class="table table-striped table-hover" id="emps_table">
            <thead>
            <tr>
                <td>
                    <input type="checkbox" id="checkbox_all"/>
                </td>
                <td>#</td>
                <td>姓名</td>
                <td>性别</td>
                <td>邮箱</td>
                <td>部门</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <%--    分页条--%>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6" id="page_info_area"></div>
        <%--分页条数据信息--%>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>

<script type="text/javascript">
    //总记录数,当前页信息
    var totalRecord,currentPage;
    //页面加载完成以后，直接去发送一个ajax请求，要到分页数据
    $(function () {
        to_page(1);
    });
    //指定跳转到的页数，默认为1
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                //console.log(result);//测试能否在控制台打印
                //1、解析并显示员工数据
                build_emps_table(result);
                //2、解析并显未分页信息
                build_page_info(result);
                //3、解析显示分页条数据源测
                build_page_nav(result);
            }
        });
    }

    //1.解析并显示员工数据
    function build_emps_table(result) {
        //清空table表格,防止点击下一页时出现上一页分页数据还存在的情况
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gread);
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性，表示当前员工的id
            editBtn.attr("edit-id",item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性，表示当前员工的id
            delBtn.attr("del-id",item.empId)
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        })
    }
    //2、解析并显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前页数: "+
            result.extend.pageInfo.pageNum+"&nbsp;&nbsp;总共有"+
            result.extend.pageInfo.pages+"页&nbsp;&nbsp;总共有"+
            result.extend.pageInfo.total+"条数据");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }
    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
        var pageInfo = result.extend.pageInfo;
        // 每个导航数字 1 2 3都在li标签里面，所有li在一个ul里面，ul在nav里面
        var ul = $("<ul></ul>").addClass("pagination");
        var nav = $("<nav></nav>").attr("aria-label","Page navigation");
        var firstLi = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
        var prevLi = $("<li></li>").append($("<a></a>").attr("href","#").append("&laquo;"));
        // 绑定事件（不在第一页时，点击首页和上一页才发送请求）
        if(pageInfo.hasPreviousPage == false){
            firstLi.addClass("disabled");
            prevLi.addClass("disabled")
        }else {
            firstLi.click(function () {
                to_page(1);
            });
            prevLi.click(function () {
                to_page(pageInfo.pageNum - 1);
            });
        }
        ul.append(firstLi).append(prevLi);
        // 遍历此次pageInfo中的导航页，并构建li标签，添加到ul
        $.each(pageInfo.navigatepageNums,function (index,item) {
            var navLi = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
            // 遍历到当前显示的页，就高亮，且不能点击
            if(pageInfo.pageNum == item){
                navLi.addClass("active");
            }
            navLi.click(function () {
                to_page(item)
            })
            ul.append(navLi);
        })
        // 下一页li
        var nextLi = $("<li></li>").append($("<a></a>").attr("href","#").append("&raquo;"));
        // 尾页li
        var lastLi = $("<li></li>").append($("<a></a>").attr("href","#").append("尾页"));
        // 绑定事件（不在最后页时，点击尾页和下一页才发送请求）
        if(pageInfo.hasNextPage == false){
            nextLi.addClass("disabled");
            lastLi.addClass("disabled");
        }else{
            nextLi.click(function () {
                to_page(pageInfo.pageNum + 1);
            });
            lastLi.click(function () {
                to_page(pageInfo.pages);
            });
        }
        ul.append(nextLi).append(lastLi);
        // 将ul添加到nav
        nav.append(ul);
        // 将构造好的nav添加到table tbody
        nav.appendTo($("#page_nav_area"));
    }


    //清空表单样式即内容
    function reset_form(ele){
        //清空表单内容
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框
    $("#emp_add_modal_btn").click(function () {
        //清空原先的表单样式和内容
        reset_form("#empAddModal form");
        //发送ajax请求，查出部门信息，显示在下拉到表中
        getDepts("#dept_add_select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });
    //获取部门信息
    function getDepts(element) {
        //清空之前下拉列表的值
        $(element).empty();
        $.ajax({
            url: "${APP_PATH}/getDeptAll",
            type: "GET",
            success(result){
                $.each(result.extend.deptAll,function () {
                    var optionElement = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionElement.appendTo(element);
                });
            }
        });
    }

    //点击模态框的保存按钮
    $("#emp_save_btn").click(function () {
        //1.模态框中填写的表单数据进行校验
        if(!validate_add_form()){
            return false;
        }
        //2、判断之前的ajax用户名校验是否成功了。如果成功了则进行下一步。
        if($(this).attr("ajax_va")=="error"){
            return false;
        }
        //3.发送ajax请求保存员工
        //alert($("#empAddModal form").serialize());
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function(result) {
                //员工保存成功：
                if(result.code==100){
                    //1、关闭模态框
                    $("#empAddModal").modal('hide');
                    //2、来到最后一页，显示刚才保存的数据
                    to_page(totalRecord);
                }else {
                    //显示失败信息
                    //console.log(result);
                    //有哪个字段的错误信息就显示哪个字段的
                    if(undefined != result.extend.errorFields.email){
                        //显示邮箱错误信息
                        show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                    }
                    if(undefined != result.extend.errorFields.empName){
                        //显示员工名字的错误信息
                        show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                    }
                }
            }
        });
    });
    //使用正则表达式校验表单数据
    function validate_add_form(){
        //1、拿到要校验的数据，使用正则表达式
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            //应该清空这个元素之前的样式
            //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        }else {
            show_validate_msg("#empName_add_input","success","");
        }
        var email = $("#empEmail_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            //alert("邮箱格式不正确");
            show_validate_msg("#empEmail_add_input","error","邮箱格式不正确")
            return false;
        }else {
            show_validate_msg("#empEmail_add_input","success","");
        }
        return true;
    }

    function show_validate_msg(ele,status,msg){
        //清除当前元素的校验
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
    //校验用户名是否重复
    $("#empName_add_input").change(function () {
        //发送ajax请求校验用户名是否可用（与数据库中的是否重复）
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkUser",
            data:"empName="+empName,
            type:"POST",
            success:function (result) {
                if(result.code==100){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax_va","success");
                }else{
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax_va","error");
                }
            }
        })
    });

    //编辑按钮绑上点击事件
    $(document).on("click",".edit_btn",function () {
        //0.弹出修改的模态框
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
        //1.发送ajax请求，查出部门信息，显示在下拉到表中
        getDepts("#dept_update_select");
        //2.查询员工信息学生在模态框上
        getEmp($(this).attr("edit-id"));
        //3、把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
    });
    //查询员工信息显示在模态框上
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result) {
                var empDate = result.extend.emp;
                $("#empName_update_static").text(empDate.empName);
                $("#empEmail_update_input").val(empDate.email);
                $("#empUpdateModal input[name=gread]").val([empDate.gread]);
                $("#empUpdateModal select").val([empDate.dId]);
            }
        })
    }
    //点击更新，更新员工信息
    $("#emp_update_btn").click(function () {
        //1、验证邮箱是否合法
        var email = $("#empEmail_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#empEmail_update_input","error","邮箱格式不正确")
            return false;
        }else {
            show_validate_msg("#empEmail_update_input","success","");
        }
        //2、发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                //alert(result.msg);
                //1、关闭模态框
                $("#empUpdateModal").modal("hide");
                to_page(currentPage);
            }
        });
    });

    //单个删除，删除按钮绑定点击事件
    $(document).on("click",".delete_btn",function () {
        var empName =$(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del-id");
        //询问是否要删除
        if(confirm("确认要删除"+empName+"吗？")){
            //确认，发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    //提示处理结果
                    alert(result.msg);
                    //返回当前页
                    to_page(currentPage);
                }
            })
        }
    });
    //全选点击事件
    $("#checkbox_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    })
    //单选全选上时，checkbox_all也变成选中状态
    $(document).on("click",".check_item",function () {
        //判断当前选中元素是否已全选上
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#checkbox_all").prop("checked",flag);
    });
    //点击全部删除，就批量删除
    $("#emp_delete_all_btn").click(function () {
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        })
        //去除多余的符号
        empNames.substring(0,empNames.length-1);
        del_idstr.substring(0,del_idstr.length-1);
        //询问是否删除
        if (confirm("是否删除"+empNames+"吗？")){
            //确认删除，发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+del_idstr,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    //回到本页
                    to_page(currentPage);
                }
            })
        }
    });
</script>
</body>
</html>

