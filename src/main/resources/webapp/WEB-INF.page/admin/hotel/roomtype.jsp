<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>房型管理</title>
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
        房型管理
        <small>房型管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>业务管理</a></li>
        <li class="active">房型管理</li>
    </ol>
</section>

<!-- Main content -->
<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">


            <table id="dg" title="房型列表" iconCls="icon-man" class="easyui-datagrid" width="100%"
                   url="/roomtype/list"
                   toolbar="#tb" pagination="true"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <th field="ck" checkbox="true"></th>
                <th field="typeId" width="100" align="center">编号</th>
                <th field="typeName" width="100" align="center">房型名称</th>
                <th field="price" width="100" align="center">价格(元)</th>
                <th field="area" width="100" align="center">面积(平米)</th>
                <th field="bedNum" width="100" align="center">床数量</th>
                <th field="bedSize" width="100" align="center">床大小</th>
                <th field="window" width="100" align="center">窗数量</th>
                <th field="rest" width="100" align="center">剩余数量</th>
                <%--                <th field="aa" width="200" align="center" formatter="formatOperate">操作</th>--%>
                </thead>
            </table>

            <div id="tb">
                <div>
                    <a href="javascript:openRoomTypeAddDialog()" class="easyui-linkbutton" iconCls="icon-add"
                       plain="true">添加</a>
                    <a href="javascript:openRoomTypeModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
                       plain="true">修改</a>
                    <a href="javascript:deleteRoomType()" class="easyui-linkbutton" iconCls="icon-remove"
                       plain="true">删除</a>
                </div>
            </div>

            <div id="dlg" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                <form id="fm" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="typeName" id="n_typeName" class="easyui-textbox" required="true"
                               label="房型名称:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input id="n_price" name="price" class="easyui-textbox"
                               required="true" label="价格:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="area" id="n_area" class="easyui-textbox" required="true"
                               label="面积:"
                               style="width:100%">
                    </div>


                    <div style="margin-bottom:10px">
                        <input name="bedNum" id="n_bedNum" class="easyui-textbox" required="true"
                               label="床数量:"
                               style="width:100%">
                    </div>

                    <div style="margin-bottom:10px">
                        <input name="bedSize" id="n_bedSize" class="easyui-textbox" required="true"
                               label="床大小:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="window" id="n_window" class="easyui-textbox" required="true"
                               label="窗数量:"
                               style="width:100%">
                    </div>

                </form>
            </div>
            <div id="dlg-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRoomType()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
            </div>

            <div id="dlg1" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg1-buttons'">
                <form id="fm1" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="typeName" id="u_typeName" class="easyui-textbox" required="true"
                               label="房型名称:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input id="u_price" name="price" class="easyui-textbox"
                               required="true" label="价格:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="area" id="u_area" class="easyui-textbox" required="true"
                               label="面积:"
                               style="width:100%">
                    </div>


                    <div style="margin-bottom:10px">
                        <input name="bedNum" id="u_bedNum" class="easyui-textbox" required="true"
                               label="床数量:"
                               style="width:100%">
                    </div>

                    <div style="margin-bottom:10px">
                        <input name="bedSize" id="u_bedSize" class="easyui-textbox" required="true"
                               label="床大小:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="window" id="u_window" class="easyui-textbox" required="true"
                               label="窗数量:"
                               style="width:100%">
                    </div>

                </form>
            </div>
            <div id="dlg1-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateRoomType()"
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


    var url;

    function openRoomTypeAddDialog() {
        $("#dlg").dialog("open").dialog("center").dialog("setTitle", "新增房型");
        $("#fm").form("clear");
        url = "/roomtype/save";
    }

    function saveRoomType() {
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
                typeName: $("#n_typeName").val(),
                price: $("#n_price").val(),
                area: $("#n_area").val(),
                bedNum: $("#n_bedNum").val(),
                bedSize: $("#n_bedSize").val(),
                window: $("#n_window").val(),
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

    function openRoomTypeModifyDialog() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要修改的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg1").dialog("open").dialog("center").dialog("setTitle", "修改房型信息");
        $("#fm1").form("load", row);
        url = "/roomtype/update?typeId=" + row.typeId;
    }

    function updateRoomType() {
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
                typeName: $("#u_typeName").val(),
                price: $("#u_price").val(),
                area: $("#u_area").val(),
                bedNum: $("#u_bedNum").val(),
                bedSize: $("#u_bedSize").val(),
                window: $("#u_window").val(),
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

    function deleteRoomType() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要删除的数据！");
            return;
        }
        var typeId = selectedRows[0].typeId;
        $.messager.confirm("系统提示", "您确定要删除这条数据吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "DELETE",
                    url: "/roomtype/delete?typeId=" + typeId,
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
