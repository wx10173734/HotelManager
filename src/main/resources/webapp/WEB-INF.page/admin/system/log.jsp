<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-03-16
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>日志管理</title>
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
<body>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        日志管理
        <small>日志管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>系统管理</a></li>
        <li class="active">日志管理</li>
    </ol>
</section>

<!-- Main content -->
<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box" style="margin-bottom: 2px">


                <div class="easyui-accordion" style="width:100%">
                    <div title="按条件查询:" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px">
                        用户名:&nbsp;<input type="text" id="s_userName" size="20"
                                         onkeydown="if(event.keyCode==13) searchLog()"/>

                        <a href="javascript:searchLog()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">搜索</a>
                        <a href="javascript:resetSearchValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>

                    </div>
                </div>
            </div>


            <table id="dg" title="日志列表" iconCls="icon-tip" class="easyui-datagrid" width="100%"
                   url="/log/list"
                   toolbar="#tb" pagination="true"
                   rownumbers="true" fitColumns="true" singleSelect="false">
                <thead>
<%--                <th field="ck" checkbox="true"></th>--%>
<%--                <th field="logId" width="50" align="center">编号</th>--%>
                <th field="logUserName" width="150" align="center">用户名</th>
                <th field="logUserRole" width="200" align="center">角色</th>
                <th field="logOperateContent" width="200" align="center">操作内容</th>
                <th field="logIpAddress" width="200" align="center">操作IP</th>
<%--                <th field="logIpLocation" width="200" align="center">操作地址</th>--%>
                <th field="logSystemType" width="200" align="center">设备类型</th>
                <th field="logBrowserType" width="200" align="center">浏览器类型</th>
                <th field="logCreateTime" width="250" align="center">操作时间</th>
                </thead>
            </table>

        </div>
    </div>
</section>
<!-- /.content -->


<script>
    if ($.fn.datagrid) {
        $.fn.datagrid.defaults.pageSize = 10;//这里一定要用datagrid.defaults.pageSize
        $.fn.datagrid.defaults.pageList = [10];//这里一定要有，不然上面的也不起效
    }


    function searchLog() {
        $("#dg").datagrid("load", {
            "logUserName": $("#s_userName").val(),
        })
    }

    function resetSearchValue() {
        $("#s_userName").val("");
        searchLog();
    }
</script>
</body>
</html>
