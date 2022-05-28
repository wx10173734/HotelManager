
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>留言管理</title>
    <%@include file="../../common/head.jsp" %>

    <style>
        .datagrid-header-row, .datagrid-row {
            height: 40px;
        }
        /*CSS*/
        .datagrid-btable .datagrid-cell{
            padding:6px 4px;/*如果影响到其他单元格显示效果，则注释该行*/
            overlow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
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
        留言管理
        <small>留言管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>业务管理</a></li>
        <li class="active">留言管理</li>
    </ol>
</section>

<!-- Main content -->
<section  class="content container-fluid" >
    <div class="row">
        <div   class="col-md-12">
            <div  class="box" style="margin-bottom: 2px;">

                <div class="easyui-accordion" style="width:100%">
                    <div title="按条件查询:" data-options="iconCls:'icon-search'" style="overflow:auto;padding: 20px;">
                        留言账号:&nbsp;<input type="text" id="s_commentLoginName" size="20"
                                         onkeydown="if(event.keyCode==13) searchComment()"/>

                        <a href="javascript:searchComment()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">搜索</a>
                        <a href="javascript:resetSearchValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>

                    </div>
                </div>
            </div>





            <table id="dg" title="留言列表" iconCls="icon-man" class="easyui-datagrid" width="100%"
                   url="/comment/list"
                   toolbar="#tb" pagination="true"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <th field="ck" checkbox="true"></th>
<%--                <th field="userId" width="200" align="center">编号</th>--%>
                <th field="commentId" width="100" align="center">留言编号</th>
                <th field="commnetContent" width="150" align="center">留言内容</th>
                <th field="commentAccount" width="100" align="center">留言账号</th>
                <th field="customer.customerName" width="100" align="center" formatter="formatCommentUser">留言人</th>
                <th field="commentGrade" width="100" align="center" formatter="formatCommentGrade">留言等级</th>
                <th field="commentCreateTime" width="150" align="center">创建时间</th>
                <th field="commentLastModifyTime" width="150" align="center">更新时间</th>
                <th field="aa" width="200" align="center" formatter="formatOperate">操作</th>
                </thead>
            </table>

<%--            <div id="tb">--%>
<%--                <div>--%>
<%--                    <a href="javascript:openCustomerAddDialog()" class="easyui-linkbutton" iconCls="icon-add"--%>
<%--                       plain="true">添加</a>--%>
<%--                    <a href="javascript:openCustomerModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"--%>
<%--                       plain="true">修改</a>--%>
<%--                    <a href="javascript:deleteCustomer()" class="easyui-linkbutton" iconCls="icon-remove"--%>
<%--                       plain="true">删除</a>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div id="dlg" class="easyui-dialog" style="width:400px"--%>
<%--                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">--%>
<%--                <form id="fm" novalidate style="margin:0;padding:20px 50px">--%>
<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input name="customerLoginName" id="n_customerLoginName" class="easyui-textbox" required="true"--%>
<%--                               label="登录账号:"--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>
<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input type="password" id="n_customerLoginPassword" name="customerLoginPassword" class="easyui-textbox"--%>
<%--                               required="true" label="密码:"--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>
<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input name="customerName" id="n_customerName" class="easyui-textbox" required="true"--%>
<%--                               label="姓名:"--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>


<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input name="customerPhone" id="n_customerPhone" class="easyui-textbox" required="true"--%>
<%--                               label="手机号:"--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>

<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input name="customerCardNumber" id="n_customerCardNumber" class="easyui-textbox" required="true"--%>
<%--                               label="身份证号:"--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>

<%--                </form>--%>
<%--            </div>--%>
<%--            <div id="dlg-buttons">--%>
<%--                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveCustomer()"--%>
<%--                   style="width:90px">保存</a>--%>
<%--                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"--%>
<%--                   onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>--%>
<%--            </div>--%>

<%--            <div id="dlg1" class="easyui-dialog" style="width:400px"--%>
<%--                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg1-buttons'">--%>
<%--                <form id="fm1" novalidate style="margin:0;padding:20px 50px">--%>
<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input name="customerLoginName" id="u_customerLoginName" class="easyui-textbox" required="true"--%>
<%--                               label="登录账号:" readonly--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>

<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input name="customerName" id="u_customerName" class="easyui-textbox" required="true"--%>
<%--                               label="姓名:"--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>


<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input name="customerPhone" id="u_customerPhone" class="easyui-textbox" required="true"--%>
<%--                               label="手机号:"--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>

<%--                    <div style="margin-bottom:10px">--%>
<%--                        <input name="customerCardNumber" id="u_customerCardNumber" class="easyui-textbox" required="true"--%>
<%--                               label="身份证号:"--%>
<%--                               style="width:100%">--%>
<%--                    </div>--%>

<%--                </form>--%>
<%--            </div>--%>
<%--            <div id="dlg1-buttons">--%>
<%--                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateCustomer()"--%>
<%--                   style="width:90px">保存</a>--%>
<%--                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"--%>
<%--                   onclick="javascript:$('#dlg1').dialog('close')" style="width:90px">取消</a>--%>
<%--            </div>--%>


        </div>
    </div>
</section>
<!-- /.content -->



    <script>
    if ($.fn.datagrid) {
        $.fn.datagrid.defaults.pageSize = 10;//这里一定要用datagrid.defaults.pageSize
        $.fn.datagrid.defaults.pageList = [10];//这里一定要有，不然上面的也不起效
    }
    function formatCommentUser(value, row) {
        return row.customer.customerName
    }
    function formatCommentGrade(value, row) {
        if (row.commentGrade == 1) {
            return "<h4><span class=\"label label-success\">精选</span><h4>";
        } else {
            return "<h4><span class=\"label label-info\">普通</span><h4>";
        }
    }


    function formatOperate(value, row) {
        return "<button onclick=\"openShowComment('" + row.commnetContent + "')\" class='btn btn-success btn-sm'>查看详情</button>  ";
    }

    function openShowComment(commnetContent){
        // console.log(commnetContent)
        alert(commnetContent)
    }



    //
    function searchComment() {
        $("#dg").datagrid("load", {
            "commentAccount": $("#s_commentLoginName").val(),
        })
    }

    function resetSearchValue() {
        $("#s_commentLoginName").val("");
        searchComment();
    }



</script>
</body>
</html>
