<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>预约订单管理</title>
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
        预约订单管理
        <small>预约订单管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>业务管理</a></li>
        <li class="active">预约订单管理</li>
    </ol>
</section>

<!-- Main content -->
<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">


            <table id="dg" title="订单列表" iconCls="icon-man" class="easyui-datagrid" width="100%"
                   url="/orderinfo/list"
                   toolbar="#tb" pagination="true"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <th field="ck" checkbox="true"></th>
                <th field="orderId" width="50" align="center">编号</th>
                <th field="name" width="50" align="center">姓名</th>
                <th field="phone" width="100" align="center">手机号</th>
                <th field="idcard" width="150" align="center">身份证号</th>
                <th field="roomType" width="100" align="center">房型</th>
                <th field="orderDate" width="100" align="center">预定日期</th>
                <th field="orderDays" width="100" align="center">预定天数</th>
                <th field="orderCost" width="100" align="center">预定金额</th>
                <th field="orderStatus" width="100" align="center" formatter="formatOrderState">订单状态</th>
                <th field="aa" width="200" align="center" formatter="formatOperate">操作</th>
                </thead>
            </table>

            <div id="dlg2" class="easyui-dialog" style="width:600px" iconCls="icon-man"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg2-buttons'">

                <table id="dg2" class="easyui-datagrid" pagination="true"
                       rownumbers="true" fitColumns="true" width="100%" singleSelect="true">
                    <thead>
                    <input type="hidden" id="orderId" name="orderId"/>
                    <input type="hidden" id="name" name="name"/>
                    <input type="hidden" id="idcard" name="idcard"/>
                    <th field="ck" checkbox="true" align="center"></th>
                    <th field="roomId" width="100" align="center">编号</th>
                    <th field="roomNumber" width="100" align="center">房间号</th>
                    <th field="roomType" width="100" align="center">房间类型</th>
                    <th field="roomStatus" width="100" align="center" formatter="formatRoomState">房间状态</th>
                    </thead>
                </table>

            </div>
            <div id="dlg2-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCheckIn()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg2').dialog('close')" style="width:90px">取消</a>
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

    function formatOrderState(value, row) {
        if (row.orderStatus == 0) {
            return "<h4><span class=\"label label-success\">已预约</span><h4>";
        } else if (row.orderStatus == 1) {
            return "<h4><span class=\"label label-warning\">已入住</span><h4>";
        } else {
            return "<h4><span class=\"label label-primary\">已退房</span><h4>";
        }
    }

    function formatRoomState(value, row) {
        if (row.roomStatus == 0) {
            return "<h4><span class=\"label label-success\">正常可入住</span><h4>";
        } else {
            return "<h4><span class=\"label label-warning\">已入住</span><h4>";
        }
    }

    function formatOperate(value, row) {
        return "<button onclick=\"openCheckInDialog('" + row.orderId + "','" + row.name + "','" + row.idcard + "','" + row.roomTypeId + "','" + row.orderStatus + "')\" class='btn btn-info btn-sm'>办理入住</button>  ";
    }


    function openCheckInDialog(orderId, name, idcard, roomTypeId, orderStatus) {

        if (orderStatus == 0) {
            $("#dlg2").dialog("open").dialog("center").dialog("setTitle", "选择房间");
            $("#dg2").datagrid({
                url: "/roominfo/listByRoomTypeId?typeId=" + roomTypeId,
            });
            $("#orderId").val(orderId);
            $("#name").val(name);
            $("#idcard").val(idcard);
        } else {
            alert("已办理入住，无法多次办理")
        }
    }

    function saveCheckIn() {
        var orderId = $("#orderId").val();
        var name = $("#name").val();
        var idcard = $("#idcard").val();
        var selectedRows = $("#dg2").datagrid("getSelections");
        if (selectedRows.length != 1) {
            alert("请选择房间")
        } else {
            console.log(orderId + name + idcard + selectedRows[0].roomId + selectedRows[0].roomNumber)
            $.post("/checkin/in", {
                orderId: orderId,
                roomId: selectedRows[0].roomId,
                roomNumber: selectedRows[0].roomNumber,
                persons: name,
                ids: idcard
            }, function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", res.msg);
                    $("#dlg2").dialog("close");
                    $("#dg").datagrid("reload");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }, "json");
        }
    }
</script>
</body>
</html>
