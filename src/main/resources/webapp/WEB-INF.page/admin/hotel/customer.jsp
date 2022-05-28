
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>客户管理</title>
    <%@include file="../../common/head.jsp" %>

    <style>
        .datagrid-header-row, .datagrid-row {
            height: 40px;
        }

        body {
            font-family: verdana, helvetica, arial, sans-serif;
        }



    </style>
</head>
<body >
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        客户管理
        <small>客户管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>业务管理</a></li>
        <li class="active">客户管理</li>
    </ol>
</section>

<!-- Main content -->
<section  class="content container-fluid" >
    <div class="row">
        <div   class="col-md-12">
            <div  class="box" style="margin-bottom: 2px;">

                <div class="easyui-accordion" style="width:100%">
                    <div title="按条件查询:" data-options="iconCls:'icon-search'" style="overflow:auto;padding: 20px;">
                        登录账号:&nbsp;<input type="text" id="s_customerLoginName" size="20"
                                         onkeydown="if(event.keyCode==13) searchCustomer()"/>
                        姓名:&nbsp;<input type="text" id="s_customerName" size="20"
                                          onkeydown="if(event.keyCode==13) searchCustomer()"/>
                        手机号:&nbsp;<input type="text" id="s_customerPhone" size="20"
                                         onkeydown="if(event.keyCode==13) searchCustomer()"/>

                        <a href="javascript:searchCustomer()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">搜索</a>
                        <a href="javascript:resetSearchValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>

                    </div>
                </div>
            </div>





            <table id="dg" title="客户列表" iconCls="icon-man" class="easyui-datagrid" width="100%"
                   url="/customer/list"
                   toolbar="#tb" pagination="true"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <th field="ck" checkbox="true"></th>
<%--                <th field="userId" width="200" align="center">编号</th>--%>
                <th field="customerLoginName" width="100" align="center">登录账号</th>
                <th field="customerName" width="100" align="center">姓名</th>
                <th field="customerPhone" width="150" align="center">手机号</th>
                <th field="customerCardNumber" width="200" align="center">身份证号</th>
                <th field="customerCreateTime" width="150" align="center">创建时间</th>
                <th field="customerLastModifyTime" width="150" align="center">更新时间</th>
<%--                <th field="aa" width="200" align="center" formatter="formatOperate">操作</th>--%>
                </thead>
            </table>

            <div id="tb">
                <div>
                    <%--<a href="javascript:openCustomerAddDialog()" class="easyui-linkbutton" iconCls="icon-add"
                       plain="true">添加</a>--%>
                    <a href="javascript:openCustomerModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
                       plain="true">修改</a>
                    <a href="javascript:deleteCustomer()" class="easyui-linkbutton" iconCls="icon-remove"
                       plain="true">删除</a>
                </div>
            </div>

            <div id="dlg" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                <form id="fm" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="customerLoginName" id="n_customerLoginName" class="easyui-textbox" required="true"
                               label="登录账号:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input type="password" id="n_customerLoginPassword" name="customerLoginPassword" class="easyui-textbox"
                               required="true" label="密码:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="customerName" id="n_customerName" class="easyui-textbox" required="true"
                               label="姓名:"
                               style="width:100%">
                    </div>


                    <div style="margin-bottom:10px">
                        <input name="customerPhone" id="n_customerPhone" class="easyui-textbox" required="true"
                               label="手机号:"
                               style="width:100%">
                    </div>

                    <div style="margin-bottom:10px">
                        <input name="customerCardNumber" id="n_customerCardNumber" class="easyui-textbox" required="true"
                               label="身份证号:"
                               style="width:100%">
                    </div>

                </form>
            </div>
            <div id="dlg-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCustomer()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
            </div>

            <div id="dlg1" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg1-buttons'">
                <form id="fm1" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="customerLoginName" id="u_customerLoginName" class="easyui-textbox" required="true"
                               label="登录账号:" readonly
                               style="width:100%">
                    </div>

                    <div style="margin-bottom:10px">
                        <input name="customerName" id="u_customerName" class="easyui-textbox" required="true"
                               label="姓名:"
                               style="width:100%">
                    </div>


                    <div style="margin-bottom:10px">
                        <input name="customerPhone" id="u_customerPhone" class="easyui-textbox" required="true"
                               label="手机号:"
                               style="width:100%">
                    </div>

                    <div style="margin-bottom:10px">
                        <input name="customerCardNumber" id="u_customerCardNumber" class="easyui-textbox" required="true"
                               label="身份证号:"
                               style="width:100%">
                    </div>

                </form>
            </div>
            <div id="dlg1-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateCustomer()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg1').dialog('close')" style="width:90px">取消</a>
            </div>


        </div>
    </div>
</section>
<!-- /.content -->



    <script>
    if ($.fn.datagrid) {
        $.fn.datagrid.defaults.pageSize = 10;//这里一定要用datagrid.defaults.pageSize
        $.fn.datagrid.defaults.pageList = [10];//这里一定要有，不然上面的也不起效
    }



    function searchCustomer() {
        $("#dg").datagrid("load", {
            "customerLoginName": $("#s_customerLoginName").val(),
            "customerName": $("#s_customerName").val(),
            "customerPhone": $("#s_customerPhone").val()
        })
    }

    function resetSearchValue() {
        $("#s_customerLoginName").val("");
        $("#s_customerName").val("");
        $("#s_customerPhone").val("");
        searchCustomer();
    }

    var url;

    function openCustomerAddDialog() {
        $("#dlg").dialog("open").dialog("center").dialog("setTitle", "新增客户");
        $("#fm").form("clear");
        url = "/customer/save";
    }

    function saveCustomer() {
        $.ajax({
            type: "POST",
            url: url,
            dateType: "json",
            // headers: {"token": $.cookie("token")},
            beforeSend: function () {
                var isValid = $("#fm").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                customerLoginName: $("#n_customerLoginName").val(),
                customerLoginPassword: $("#n_customerLoginPassword").val(),
                customerName: $("#n_customerName").val(),
                customerPhone: $("#n_customerPhone").val(),
                customerCardNumber: $("#n_customerCardNumber").val()
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "新增成功！");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });

    }

    function openCustomerModifyDialog() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要修改的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg1").dialog("open").dialog("center").dialog("setTitle", "修改客户信息");
        $("#fm1").form("load", row);
        url = "/customer/update?customerId=" + row.customerId;
    }

    function updateCustomer() {
        $.ajax({
            type: "PUT",
            url: url,
            dateType: "json",
            // headers: {"token": $.cookie("token")},
            beforeSend: function () {
                var isValid = $("#fm1").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                customerLoginName: $("#u_customerLoginName").val(),
                customerName: $("#u_customerName").val(),
                customerPhone: $("#u_customerPhone").val(),
                customerCardNumber: $("#u_customerCardNumber").val()
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "修改成功！");
                    $("#dlg1").dialog("close");
                    $("#dg").datagrid("reload");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function deleteCustomer() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要删除的数据！");
            return;
        }
        var customerId = selectedRows[0].customerId;
        $.messager.confirm("系统提示", "您确定要删除这条数据吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "DELETE",
                    url: "/customer/delete?customerId=" + customerId,
                    // headers: {"token": $.cookie("token")},
                    success: function (res) {
                        if (res.ret) {
                            $.messager.alert("系统提示", "删除成功！");
                            $("#dg").datagrid("reload");
                        } else {
                            //$.messager.alert("系统提示", "删除失败！");
                            $.messager.alert("系统提示", res.msg);
                        }
                    }
                });
            }
        });
    }


</script>
</body>
</html>
