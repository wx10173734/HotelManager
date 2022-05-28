<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-04-10
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>应用管理</title>
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

<section class="content-header">
    <h1>
        应用管理
        <small>应用管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>系统管理</a></li>
        <li class="active">应用管理</li>
    </ol>
</section>

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box" style="margin-bottom: 2px">

                <table id="permissionList" class="easyui-treegrid" width="100%"
                       data-options="url:'/permission/list',idField:'permissionId',
                       treeField:'permissionName',fitColumns:true,singleSelect:false,
                       rownumbers:true">
                    <thead>

                    <th field="ck" checkbox="true"></th>
                    <th field="permissionName" width="250" align="center">应用名称</th>
                    <th field="permissionUrl" width="250" align="center">应用URL</th>
                    <th field="icon" width="250" align="center" formatter="formatPermissionIcon">应用图标</th>
                    <th field="permissionCreateTime" width="250" align="center">创建时间</th>
                    <th field="permissionLastModifyTime" width="250" align="center">更新时间</th>

                    </thead>
                </table>

            </div>
        </div>
    </div>
</section>


<script>
    function formatPermissionIcon(value, row) {
        return "<i class='" + row.permissionIcon + "'></i>"
    }
</script>
</body>
</html>
