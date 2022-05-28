<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>房间管理</title>
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
        房间管理
        <small>房间管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>业务管理</a></li>
        <li class="active">房间管理</li>
    </ol>
</section>

<!-- Main content -->
<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">


            <table id="dg" title="房间列表" iconCls="icon-man" class="easyui-datagrid" width="100%"
                   url="/roominfo/list"
                   toolbar="#tb" pagination="true"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <th field="ck" checkbox="true"></th>
                <th field="roomId" width="100" align="center">编号</th>
                <th field="roomNumber" width="100" align="center">房间号</th>
                <th field="roomPrice" width="100" align="center">房间价格(元)</th>
                <th field="roomType" width="100" align="center">房间类型</th>
                <th field="roomStatus" width="100" align="center" formatter="formatRoomState">房间状态</th>
                <%--                <th field="aa" width="200" align="center" formatter="formatOperate">操作</th>--%>
                </thead>
            </table>

            <div id="tb">
                <div>
                    <a href="javascript:openRoomInfoAddDialog()" class="easyui-linkbutton" iconCls="icon-add"
                       plain="true">添加</a>
                    <a href="javascript:openRoomInfoModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
                       plain="true">修改</a>
                    <a href="javascript:deleteRoomInfo()" class="easyui-linkbutton" iconCls="icon-remove"
                       plain="true">删除</a>
                </div>
            </div>

            <div id="dlg" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                <form id="fm" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="roomNumber" id="n_roomNumber" class="easyui-textbox" required="true"
                               label="房间号:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input style="width:100%" id="cc" name="type" value="aa" label="房间类型:" required="true">

                    </div>


                </form>
            </div>
            <div id="dlg-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRoomInfo()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
            </div>

            <div id="dlg1" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg1-buttons'">
                <form id="fm1" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="roomNumber" id="u_roomNumber" class="easyui-textbox" required="true"
                               label="房间号:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input style="width:100%" id="cc1" name="typeName" label="房间类型:" required="true">

                    </div>

                </form>
            </div>
            <div id="dlg1-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateRoomInfo()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg1').dialog('close')" style="width:90px">取消</a>
            </div>


        </div>
    </div>
</section>
<!-- /.content -->


<script>

    loadData()

    function loadData() {
        $.ajax({
            type: "get",
            url: "/roomtype/listAll",
            dateType: "json",
            success: (res) => {
                $('#cc').combobox({
                    data: res.data,
                    valueField: 'typeId',
                    textField: 'typeName',
                    panelHeight: 'auto',
                });
                $('#cc1').combobox({
                    data: res.data,
                    valueField: 'typeId',
                    textField: 'typeName',
                    panelHeight: 'auto',
                });
            }
        });
    }

    if ($.fn.datagrid) {
        $.fn.datagrid.defaults.pageSize = 10;//这里一定要用datagrid.defaults.pageSize
        $.fn.datagrid.defaults.pageList = [10];//这里一定要有，不然上面的也不起效
    }

    function formatRoomState(value, row) {
        if (row.roomStatus == 0) {
            return "<h4><span class=\"label label-success\">正常可入住</span><h4>";
        } else {
            return "<h4><span class=\"label label-warning\">已入住</span><h4>";
        }
    }

    var url;

    function openRoomInfoAddDialog() {
        $("#dlg").dialog("open").dialog("center").dialog("setTitle", "新增房间");
        $("#fm").form("clear");
        url = "/roominfo/save";
    }

    function saveRoomInfo() {
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
                roomNumber: $("#n_roomNumber").val(),
                typeId: $('#cc').combobox('getValue'),
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

    function openRoomInfoModifyDialog() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要修改的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg1").dialog("open").dialog("center").dialog("setTitle", "修改房间信息");
        $("#fm1").form("load", row);
        $("#cc1").combobox('setValue', row.typeId);
        url = "/roominfo/update?roomId=" + row.roomId;
    }

    function updateRoomInfo() {
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
                roomNumber: $("#u_roomNumber").val(),
                typeId: $('#cc1').combobox('getValue'),
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

    function deleteRoomInfo() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要删除的数据！");
            return;
        }
        var roomId = selectedRows[0].roomId;
        $.messager.confirm("系统提示", "您确定要删除这条数据吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "DELETE",
                    url: "/roominfo/delete?roomId=" + roomId,
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
