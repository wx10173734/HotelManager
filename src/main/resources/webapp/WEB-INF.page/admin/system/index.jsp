<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-03-12
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>酒店管理系统后台首页</title>
    <%@include file="../../common/head.jsp" %>

</head>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>HO</b>+</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">酒店管理系统</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown tasks-menu">
                        <!-- Menu Toggle Button -->
                        <a href="javascript:void(0);" class="btn" onclick="modifyPassword()">
                            <i class="fa fa-cog"></i>
                            <span>修改密码</span>
                        </a>

                    </li>
                    <!-- User Account Menu -->
                    <li class="dropdown tasks-menu">
                        <!-- Menu Toggle Button -->
                        <a href="/logout" class="btn">
                            <i class="fa fa-lock"></i>
                            <span>安全退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel" style="height: 50px">
                <div class="pull-left image">
<%--                    <img src="" class="img-circle" alt="User Image">--%>

                </div>
                <div class="pull-left info">
                    <p>欢迎:&nbsp; ${user.userName}</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> ${user.roles}</a>
                </div>
            </div>

            <%@include file="../../common/menu.jsp" %>

            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
<%--        <div id="tabs" class="easyui-tabs" border="false" style="height: 100%;width: auto">--%>
<%--            <div iconCls="fa fa-television" title="首页" style="padding:20px;display:none;">--%>
<%--                <h1>后台首页</h1>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div id="menu" class="easyui-menu">--%>
<%--            <div id="mm-tabrefresh" data-options="names:1,iconCls:'icon-refresh'"> 刷新当前标签页</div>--%>
<%--            <div id="mm-tabclose" data-options="names:2,iconCls:'icon-closetab'">关闭当前标签页</div>--%>
<%--            <div id="mm-tabcloseall" data-options="names:3,iconCls:'icon-closealltab'">关闭全部标签页</div>--%>
<%--            <div id="mm-tabcloseother" data-options="names:4,iconCls:'icon-closeothertab'">关闭其他标签页</div>--%>
<%--            <div id="mm-tabcloseright" data-options="names:5,iconCls:'icon-closerighttab'">关闭右侧标签页</div>--%>
<%--            <div id="mm-tabcloseleft" data-options="names:6,iconCls:'icon-closelefttab'">关闭左侧标签页</div>--%>
<%--        </div>--%>
<%--        <div id="container">--%>

<%--        </div>--%>
                <iframe id="mainIframe" name="mainIframe" width="100%" height="100%" onload="this.height=700" scrolling="no" frameborder="0"
                        src=""></iframe>
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            Anything you want
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2020 <a href="#">肆意。-</a>.</strong> All rights reserved.
    </footer>

</div>
<!-- ./wrapper -->
<div id="dlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
    <form id="fm" novalidate style="margin:0;padding:20px 50px">
        <div style="margin-bottom:10px">
            <input type="password" name="oldPassword" id="u_oldPassword" class="easyui-textbox" required="true"
                   label="原密码:"
                   style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input type="password" id="u_userPassword" name="userPassword" class="easyui-textbox"
                   required="true" validType="length[6,15]" label="新密码:"
                   style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input type="password" name="reUserPassword" class="easyui-textbox" required="true"
                   validType="equalTo['#u_userPassword']" invalidMessage="两次输入密码不匹配" label="确认新密码:"
                   style="width:100%">
        </div>

    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateUserPassword()"
       style="width:90px">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>

<script>

    // $(".sidebar-toggle").attr("disabled",true).css("pointer-events","none");


    $(".mainMenu").click(function () {
        var address = $(this).attr("data-src");
        $("#mainIframe").attr("src", address);
        // $('#container').load(address);
        // var name = $(this).attr("data-name");
        // var icon = $(this).attr("data-icon");
        // console.log(name)
        // var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='" + address + "'></iframe>";
        //
        // $("#tabs").tabs("add", {
        //     title: name,
        //     iconCls: icon,
        //     closable: true,
        //     content: content
        // });

        // openTab(name, address, icon)

    })


    /**
     * 打开tab
     * @param name
     * @param address
     * @param icon
     */
    // function openTab(name, address, icon) {
    //     var e = $('#tabs').tabs('exists', name);
    //     if (e) {
    //         $("#tabs").tabs('select', name);
    //
    //         var tab = $("#tabs").tabs('getSelected');
    //         $('#tabs').tabs('update', {
    //             tab: tab,
    //             options: {
    //                 title: name,
    //                 content: '<iframe scrolling="auto" src="' + address + '" frameborder="0" style="width:100%;height:100%;"></iframe>',
    //                 closable: true,
    //                 selected: true
    //             }
    //         });
    //     } else {
    //         $('#tabs').tabs('add', {
    //             title: name,
    //             content: '<iframe scrolling="auto" src="' + address + '" frameborder="0" style="width:100%;height:100%;"></iframe>',
    //             iconCls: icon,
    //             closable: true
    //         });
    //     }
    // }

    function reinitIframe() {
        var iframe = document.getElementById("mainIframe");
        try {
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            iframe.height = height;
            // console.log(height);
        } catch (ex) {
        }
    }

    window.setInterval("reinitIframe()", 200);

    $.extend($.fn.validatebox.defaults.rules, {
        /*必须和某个字段相等*/
        equalTo: {
            validator: function (value, param) {
                return $(param[0]).val() == value;
            }, message: '字段不匹配'
        },
    });

    var url;

    function modifyPassword() {
        $("#dlg").dialog("open").dialog("center").dialog("setTitle", "修改密码");
        $("#fm").form("clear");
        url = "/user/modifyPassword";
    }

    function updateUserPassword() {
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
                oldPassword: $("#u_oldPassword").val(),
                newPassword: $("#u_userPassword").val(),
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "修改成功！");
                    $("#dlg").dialog("close");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    // $(document).ready(function () {
    //     // 监听右键事件，创建右键菜单
    //     $('#tabs').tabs({
    //         onContextMenu: function (e, title, index) {
    //             e.preventDefault();
    //             if (index > 0) {
    //                 $('#menu').menu('show', {
    //                     left: e.pageX,
    //                     top: e.pageY
    //                 }).data("tabTitle", title);
    //             }
    //         }
    //     });
    //
    //     // 右键菜单click
    //     $("#menu").menu({
    //         onClick: function (item) {
    //             console.log(item.names + "type")
    //             closeTab(this, item.names);
    //         }
    //     });
    //
    //
    // })

    // function closeTab(menu, type) {
    //     var allTabs = $("#tabs").tabs('tabs');
    //     //console.log(allTabs)
    //     var allTabtitle = [];
    //     $.each(allTabs, function (i, n) {
    //         var opt = $(n).panel('options');
    //         if (opt.closable)
    //             allTabtitle.push(opt.title);
    //     });
    //     //console.log(allTabtitle)
    //     var curTabTitle = $(menu).data("tabTitle");
    //     console.log(curTabTitle)
    //     var curTabIndex = $("#tabs").tabs("getTabIndex", $("#tabs").tabs("getTab", curTabTitle));
    //     console.log(curTabIndex)
    //     if (type == "1") {
    //         var currTab = $("#tabs").tabs("getTab", curTabTitle);
    //         var iframe = $(currTab.panel('options').content);
    //         var src = iframe.attr('src');
    //         $('#tabs').tabs('update',
    //             {
    //                 tab: currTab,
    //                 options: {content: '<iframe scrolling="auto" src="' + src + '" frameborder="0" style="width:100%;height:100%;"></iframe>'}
    //             });
    //     }
    //     if (type == "2") {
    //         $("#tabs").tabs("close", curTabIndex);
    //     }
    //     if (type == "3") {
    //         for (var i = 0; i < allTabtitle.length; i++) {
    //             $('#tabs').tabs('close', allTabtitle[i]);
    //         }
    //     }
    //     if (type == "4") {
    //         for (var i = 0; i < allTabtitle.length; i++) {
    //             if (curTabTitle != allTabtitle[i])
    //                 $('#tabs').tabs('close', allTabtitle[i]);
    //         }
    //         $('#tabs').tabs('select', curTabTitle);
    //     }
    //
    //     if (type == "5") {
    //         for (var i = curTabIndex; i < allTabtitle.length; i++) {
    //             $('#tabs').tabs('close', allTabtitle[i]);
    //         }
    //         $('#tabs').tabs('select', curTabTitle);
    //     }
    //     if (type == "6") {
    //         for (var i = 0; i < curTabIndex - 1; i++) {
    //             $('#tabs').tabs('close', allTabtitle[i]);
    //         }
    //         $('#tabs').tabs('select', curTabTitle);
    //     }
    //
    //
    // }
</script>
</body>
</html>
