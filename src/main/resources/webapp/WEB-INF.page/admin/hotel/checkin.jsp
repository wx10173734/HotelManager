<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>入住管理</title>
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
        入住管理
        <small>入住管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>业务管理</a></li>
        <li class="active">入住管理</li>
    </ol>
</section>

<!-- Main content -->
<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">

            <table id="dg" title="入住记录" iconCls="icon-man" class="easyui-datagrid" width="100%"
                   url="/checkin/list"
                   toolbar="#tb" pagination="true"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <th field="ck" checkbox="true"></th>
                <th field="checkInId" width="50" align="center">编号</th>
                <th field="persons" width="50" align="center">入住人</th>
                <th field="ids" width="150" align="center">身份证号</th>
                <th field="roomNumber" width="100" align="center">房间号</th>
                <th field="checkInTime" width="100" align="center">入住时间</th>
                <th field="aa" width="200" align="center" formatter="formatOperate">操作</th>
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

    function formatOperate(value, row) {
        return "<button onclick=\"checkOut('" + row.orderId + "','" + row.roomId + "')\" class='btn btn-info btn-sm'>退房</button>  ";
    }


    function checkOut(orderId, roomId) {

        $.post("/checkin/out?orderId=" + orderId + "&roomId=" + roomId, function (res) {
            if (res.ret) {
                $.messager.alert("系统提示", res.msg);
                location.reload();
            } else {
                $.messager.alert("系统提示", res.msg);
                location.reload();
            }
        }, "json");

    }

</script>
</body>
</html>
