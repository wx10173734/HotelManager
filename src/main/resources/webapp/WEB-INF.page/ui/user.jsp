<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <%@include file="css_js.jsp" %>
    <script src="https://cdn.bootcss.com/moment.js/2.20.1/moment.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.20.1/locale/zh-cn.js"></script>

</head>
<body>
<div id="fh5co-wrapper">
    <div id="fh5co-page">

        <%@include file="header.jsp" %>
        <!-- end:fh5co-header -->
        <div class="fh5co-parallax" style="background-image: url(/static/ui/images/slider1.jpg);"
             data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-md-offset-0 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
                        <div class="fh5co-intro fh5co-table-cell">
                            <h1 class="text-center">个人中心</h1>
                            <%--                            <p>注册/登录获取服务</p>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="fh5co-contact-section">

            <div v-if="showLogAndReg" style="margin-left: 10px;margin-right: 10px">
                <el-tabs v-model="activeName1" :tab-position="tabPosition">
                    <el-tab-pane label="用户登录" name="用户登录">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" v-model="username" placeholder="用户名">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" v-model="password" placeholder="密码">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input value="登录" @click="login()" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </el-tab-pane>
                    <el-tab-pane label="用户注册" name="用户注册">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" v-model="reg_username"
                                               placeholder="用户名">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" v-model="reg_password" placeholder="密码">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" v-model="reg_name" placeholder="姓名">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" v-model="reg_phone" placeholder="手机号">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" v-model="reg_idcard"
                                               placeholder="身份证号码">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input value="注册" @click="register()" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </el-tab-pane>
                </el-tabs>
            </div>

            <div v-if="showUser" style="margin-left: 10px;margin-right: 10px">
                <%--                当前登录用户：{{currentuser}}--%>
                <%--                <input value="退出登录" @click="logout()" class="btn btn-primary">--%>
                <el-tabs v-model="activeName2" :tab-position="tabPosition" @tab-click="handleClick">
                    <el-tab-pane label="个人信息" name="个人信息">
                        <el-form ref="form" :label-position="labelPosition" label-width="80px">
                            <el-input v-show="false" v-model="currentUser.customerId"></el-input>

                            <el-form-item label="当前用户">
                                <el-input v-model="currentUser.customerLoginName" :disabled="true"></el-input>
                            </el-form-item>
                            <el-form-item label="姓名">
                                <el-input v-model="currentUser.customerName"></el-input>
                            </el-form-item>
                            <el-form-item label="手机号">
                                <el-input v-model="currentUser.customerPhone"></el-input>
                            </el-form-item>
                            <el-form-item label="身份证号">
                                <el-input v-model="currentUser.customerCardNumber"></el-input>
                            </el-form-item>
                        </el-form>
                        <input value="修改信息" @click="update()" class="btn btn-primary">
                        <input value="退出登录" @click="logout()" class="btn btn-primary">

                    </el-tab-pane>
                    <el-tab-pane label="我的预约" name="我的预约">

                        <el-table
                                :data="tableData"
                                style="width: 100%">

                            <el-table-column
                                    prop="name"
                                    label="姓名">
                            </el-table-column>
                            <el-table-column
                                    prop="phone"
                                    label="手机号">
                            </el-table-column>
                            <el-table-column
                                    prop="idcard"
                                    label="身份证号">
                            </el-table-column>
                            <el-table-column
                                    prop="roomType"
                                    label="房型">
                            </el-table-column>
                            <el-table-column
                                    prop="orderDate"
                                    label="预定日期"
                                    :formatter="dateFormat"
                            >
                            </el-table-column>
                            <el-table-column
                                    prop="orderDays"
                                    label="预定天数">
                            </el-table-column>
                            <el-table-column
                                    prop="orderCost"
                                    label="预定金额">
                            </el-table-column>
                            <el-table-column
                                    prop="orderStatus"
                                    label="订单状态">
                                <template slot-scope="scope">
                                    <el-tag v-if="scope.row.orderStatus==0"
                                            type="primary"
                                            disable-transitions>已预约
                                    </el-tag>
                                    <el-tag v-if="scope.row.orderStatus==1"
                                            type="success"
                                            disable-transitions>已入住
                                    </el-tag>
                                    <el-tag v-if="scope.row.orderStatus==3"
                                            type="success"
                                            disable-transitions>已退房
                                    </el-tag>
                                </template>
                            </el-table-column>
                        </el-table>

                    </el-tab-pane>
                    <el-tab-pane label="用户留言" name="用户留言">
                        <el-form ref="form1" :label-position="labelPosition" label-width="80px">
                            <el-form-item label="留言内容">
                                <el-input type="textarea" :rows="4" v-model="comment_info"></el-input>
                            </el-form-item>
                        </el-form>
                        <input value="提交留言" @click="saveComment()" class="btn btn-primary">

                    </el-tab-pane>
                </el-tabs>
            </div>

        </div>
        <%@include file="footer.jsp" %>

    </div>
    <!-- END fh5co-page -->

</div>
<!-- END fh5co-wrapper -->
<script>
    var app = new Vue({
        el: '#fh5co-wrapper',
        data: {
            activeName1: '用户登录',
            activeName2: '个人信息',
            tabPosition: 'left',
            username: '',
            password: '',
            showLogAndReg: true,
            showUser: false,
            currentUser: {
                customerId: '',
                customerLoginName: '',
                customerName: '',
                customerPhone: '',
                customerCardNumber: ''
            },
            labelPosition: 'left',
            reg_username: '',
            reg_password: '',
            reg_name: '',
            reg_phone: '',
            reg_idcard: '',
            comment_info: '',
            tableData: []


        },
        methods: {
            dateFormat(row, column) {

                var date = row[column.property];

                if (date == undefined) {
                    return ''
                }

                return moment(date).format("YYYY-MM-DD")

            },
            // tab点击事件处理
            handleClick(tab, event) {
                console.log(tab, event);
                console.log(tab.name);
                if (tab.name == "我的预约") {
                    $.ajax({
                        type: "get",
                        url: "/orderinfo/listById?userId=" + this.currentUser.customerId,
                        dateType: "json",
                        success: (res) => {
                            console.log(res.data)
                            if (res.ret) {
                                this.tableData = res.data
                            }
                        }
                    });
                }
            },
            // 用户登录
            login() {
                if (this.username == "") {
                    this.$message({
                        message: '用户名不能为空！',
                        type: 'warning'
                    });
                } else if (this.password == "") {
                    this.$message({
                        message: '密码不能为空！',
                        type: 'warning'
                    });
                } else {

                    // var _this = this
                    $.ajax({
                        type: "POST",
                        url: "/customer/login",
                        dateType: "json",
                        data: {
                            customerLoginName: this.username,
                            customerLoginPassword: this.password,
                        },
                        success: (res) => {


                            if (res.ret) {
                                this.$message({
                                    message: '登录成功！',
                                    type: 'success'
                                });
                                this.username = ''
                                this.password = ''
                                //登录成功后
                                localStorage.setItem("customerLoginName", res.data.user.customerLoginName)
                                localStorage.setItem("customerId", res.data.user.customerId)
                                localStorage.setItem("customerName", res.data.user.customerName)
                                localStorage.setItem("customerPhone", res.data.user.customerPhone)
                                localStorage.setItem("customerCardNumber", res.data.user.customerCardNumber)
                                this.currentUser = res.data.user
                                // _this.$set(_this.currentUser,'customerLoginName', res.data.user.customerLoginName)
                                this.showLogAndReg = false
                                this.showUser = true
                                // console.log(res.data.user)
                                // location.reload()
                            } else {
                                this.$message.error(res.msg);
                                this.username = ''
                                this.password = ''

                            }
                        }
                    });
                    // console.log(user)

                }

            },
            // 退出登录
            logout() {
                localStorage.removeItem("customerId")
                localStorage.removeItem("customerLoginName")
                localStorage.removeItem("customerName")
                localStorage.removeItem("customerPhone")
                localStorage.removeItem("customerCardNumber")
                location.reload()
            },
            //提交留言
            saveComment() {
                // alert("提交留言")
                // console.log(this.comment_info)
                if (this.comment_info == "") {
                    this.$message({
                        message: '留言不能为空！',
                        type: 'warning'
                    });
                } else {
                    $.ajax({
                        type: "POST",
                        url: "/comment/save",
                        dateType: "json",
                        data: {
                            commnetContent: this.comment_info,
                            commentAccount: localStorage.getItem("customerLoginName"),
                        },
                        success: (res) => {


                            if (res.ret) {
                                this.$message({
                                    message: '提交成功！',
                                    type: 'success'
                                });
                                this.comment_info = ''
                            } else {
                                this.$message.error(res.msg);
                                this.comment_info = ''
                            }
                        }
                    });
                }
            },
            // 修改个人信息
            update() {
                if (this.currentUser.customerName == "") {
                    this.$message({
                        message: '姓名不能为空！',
                        type: 'warning'
                    });
                } else if (this.currentUser.customerPhone == "") {
                    this.$message({
                        message: '手机号不能为空！',
                        type: 'warning'
                    });
                } else if (this.currentUser.customerCardNumber == "") {
                    this.$message({
                        message: '身份证不能为空！',
                        type: 'warning'
                    });
                } else {
                    // var _this = this
                    $.ajax({
                        type: "PUT",
                        url: "/customer/update",
                        dateType: "json",
                        data: {
                            customerId: this.currentUser.customerId,
                            customerLoginName: this.currentUser.customerLoginName,
                            customerName: this.currentUser.customerName,
                            customerPhone: this.currentUser.customerPhone,
                            customerCardNumber: this.currentUser.customerCardNumber
                        },
                        success: (res) => {


                            if (res.ret) {
                                this.$message({
                                    message: '修改成功！',
                                    type: 'success'
                                });
                                localStorage.setItem("customerLoginName", res.data.customerLoginName)
                                localStorage.setItem("customerId", res.data.customerId)
                                localStorage.setItem("customerName", res.data.customerName)
                                localStorage.setItem("customerPhone", res.data.customerPhone)
                                localStorage.setItem("customerCardNumber", res.data.customerCardNumber)

                            } else {
                                this.$message.error(res.msg);

                            }
                        }
                    });

                }
            },
            //用户注册
            register() {
                // alert("注册成功！请登录")
                // this.activeName = 'first'
                if (this.reg_username == "") {
                    this.$message({
                        message: '用户名不能为空！',
                        type: 'warning'
                    });
                } else if (this.reg_password == "") {
                    this.$message({
                        message: '密码不能为空！',
                        type: 'warning'
                    });
                } else if (this.reg_name == "") {
                    this.$message({
                        message: '姓名不能为空！',
                        type: 'warning'
                    });
                } else if (this.reg_phone == "") {
                    this.$message({
                        message: '手机号不能为空！',
                        type: 'warning'
                    });
                } else if (this.reg_idcard == "") {
                    this.$message({
                        message: '身份证号不能为空！',
                        type: 'warning'
                    });
                } else {

                    $.ajax({
                        type: "POST",
                        url: "/customer/save",
                        dateType: "json",
                        data: {
                            customerLoginName: this.reg_username,
                            customerLoginPassword: this.reg_password,
                            customerName: this.reg_name,
                            customerPhone: this.reg_phone,
                            customerCardNumber: this.reg_idcard
                        },
                        success: (res) => {


                            if (res.ret) {
                                this.$message({
                                    message: '注册成功！请登录',
                                    type: 'success'
                                });
                                this.activeName1 = '用户登录'
                                this.reg_username = ''
                                this.reg_password = ''
                                this.reg_name = ''
                                this.reg_phone = ''
                                this.reg_idcard = ''
                            } else {
                                this.$message.error(res.msg);
                                this.reg_username = ''
                                this.reg_password = ''
                                this.reg_name = ''
                                this.reg_phone = ''
                                this.reg_idcard = ''
                            }
                        }
                    });
                }
            },


        },
        mounted() {

            if (localStorage.getItem("customerLoginName") != "" && localStorage.getItem("customerLoginName") != null) {
                this.showLogAndReg = false
                this.showUser = true
                this.currentUser.customerId = localStorage.getItem("customerId")
                this.currentUser.customerLoginName = localStorage.getItem("customerLoginName")
                this.currentUser.customerName = localStorage.getItem("customerName")
                this.currentUser.customerPhone = localStorage.getItem("customerPhone")
                this.currentUser.customerCardNumber = localStorage.getItem("customerCardNumber")


            }


        }


    })
</script>

</body>
</html>