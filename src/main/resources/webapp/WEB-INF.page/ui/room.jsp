<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <%@include file="css_js.jsp" %>
</head>
<body>
<div id="fh5co-wrapper">
    <div id="fh5co-page">

        <%@include file="header.jsp" %>
        <div class="fh5co-parallax" style="background-image: url(/static/ui/images/slider1.jpg);"
             data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-md-offset-0 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
                        <div class="fh5co-intro fh5co-table-cell">
                            <h1 class="text-center">选择我们的酒店</h1>
                            <p>最便利的活动送给你们，最艰难的工作留给我们</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="fh5co-hotel-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4" v-for="(roomtype, index) in roomTypeList">
                        <div class="hotel-content">

                            <div class="hotel-grid" style="background-image: url(/static/ui/images/image-1.jpg);">
                                <div class="price"><small>最低</small><span>￥{{roomtype.price}}/天</span></div>
                                <a class="book-now text-center" @click="yuding(roomtype)"><i
                                        class="ti-calendar"></i>
                                    立即预定</a>

                            </div>

                            <div class="desc">
                                <h3><a href="#">{{roomtype.typeName}}</a></h3>
                                <p>
                                    房型介绍：
                                </p>
                                <p>
                                    房型名称：{{roomtype.typeName}}
                                </p>
                                <p>
                                    房型价格：{{roomtype.price}} 元
                                </p>
                                <p>
                                    房型面积：{{roomtype.area}} 平米
                                </p>
                                <p>
                                    房型床数量：{{roomtype.bedNum}}
                                </p>
                                <p>
                                    房型床大小：{{roomtype.bedSize}}
                                </p>
                                <p>
                                    房型窗数量：{{roomtype.window}}
                                </p>
                                <p>
                                    房型剩余可定数量：{{roomtype.rest}}
                                </p>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

        <el-dialog title="房间预订" :visible.sync="dialogFormVisible">
            <el-form>
                <el-form-item label="预定人:" :label-width="formLabelWidth">
                    <el-input v-model="user.name" autocomplete="off" :disabled="true"></el-input>
                </el-form-item>

                <el-form-item label="预定人手机:" :label-width="formLabelWidth">
                    <el-input v-model="user.phone" autocomplete="off" :disabled="true"></el-input>
                </el-form-item>

                <el-form-item label="预定人身份证:" :label-width="formLabelWidth">
                    <el-input v-model="user.idcard" autocomplete="off" :disabled="true"></el-input>
                </el-form-item>

                <el-form-item label="房间类型:" :label-width="formLabelWidth">
                    <el-input v-model="roomType.typeName" autocomplete="off" :disabled="true"></el-input>
                </el-form-item>
                <el-form-item
                        :rules="[
          { required: true, message: '不能为空'}
        ]"
                        label="入住日期:" :label-width="formLabelWidth"
                >
                    <el-date-picker
                            v-model="orderDateRange"
                            type="daterange"
                            @change="calcDays"
                            range-separator=" 至 "
                            start-placeholder="开始日期"
                            end-placeholder="结束日期"
                            :picker-options="expireTimeOption">
                    </el-date-picker>
                </el-form-item>

                <el-form-item
                        :rules="[
          { required: true, message: '不能为空'}
        ]"
                        label="入住天数:"
                        prop="orderDays" :label-width="formLabelWidth"
                >
                    <!--<el-input-number v-model="form1.orderDays" @change="idToType(form1.roomTypeId)" :min="1" label="预订天数"></el-input-number>-->
                    {{ orderDays + ' 晚' }}
                </el-form-item>

                <el-form-item
                        :rules="[
          { required: true, message: '不能为空'},
          { type: 'number', message: '必须为数字值'}
        ]"
                        label="订单费用:"
                        prop="orderCost" :label-width="formLabelWidth"
                >
                    {{ '￥' + orderCost.toFixed(2) }}
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="cancelYuDing()">取 消</el-button>
                <el-button type="primary" @click="confirmYuDing()">确 定</el-button>
            </div>
        </el-dialog>

        <%@include file="footer.jsp" %>

    </div>
    <!-- END fh5co-page -->

</div>
<!-- END fh5co-wrapper -->
<script>
    var app = new Vue({
        el: '#fh5co-wrapper',
        data: {
            roomTypeList: [],
            formLabelWidth: '120px',
            dialogFormVisible: false,
            user: {
                name: "",
                phone: "",
                id: "",
                idcard: ""
            },

            roomType: {
                typeName: "",
                typeId: "",
                price: ""
            },
            orderDateRange: null,
            expireTimeOption: {
                disabledDate: time => {
                    return time.getTime() < Date.now() - 24 * 60 * 60 * 1000;
                },
            },
            orderDate: null,
            orderDays: 0,
            orderCost: 0


        },
        methods: {
            yuding(roomtype) {
                const user = localStorage.getItem("customerLoginName")
                if (user == "" || user == null) {
                    alert("请登录！")
                } else {
                    // alert("可以预定！")
                    console.log(roomtype)
                    this.roomType.typeName = roomtype.typeName
                    this.roomType.typeId = roomtype.typeId
                    this.roomType.price = roomtype.price
                    this.user.name = localStorage.getItem("customerName")
                    this.user.phone = localStorage.getItem("customerPhone")
                    this.user.id = localStorage.getItem("customerId")
                    this.user.idcard = localStorage.getItem("customerCardNumber")
                    this.dialogFormVisible = true

                    console.log(this.user)
                    console.log(this.roomType)

                }


            },

            calcDays() {
                this.orderDate = this.orderDateRange[0]
                var days = this.orderDateRange[1].getTime() - this.orderDateRange[0].getTime();
                this.orderDays = days / (24 * 60 * 60 * 1000);

                this.orderCost = this.roomType.price * this.orderDays
            },

            cancelYuDing() {
                this.orderDateRange = null
                this.orderDate = null
                this.orderDays = 0
                this.orderCost = 0
                this.dialogFormVisible = false
            },
            confirmYuDing() {
                $.ajax({
                    type: "POST",
                    url: "/orderinfo/save",
                    dateType: "json",
                    data: {
                        name: this.user.name,
                        phone: this.user.phone,
                        userId: this.user.id,
                        idcard: this.user.idcard,
                        roomTypeId: this.roomType.typeId,
                        roomType: this.roomType.typeName,
                        orderDate: this.orderDate,
                        orderDays: this.orderDays,
                        orderCost: this.orderCost,
                    },
                    success: (res) => {


                        if (res.ret) {
                            this.$message({
                                message: '预定成功！',
                                type: 'success'
                            });
                            this.orderDateRange = null
                            this.orderDate = null
                            this.orderDays = 0
                            this.orderCost = 0
                            this.dialogFormVisible = false
                        } else {
                            this.$message.error(res.msg);
                            this.orderDateRange = null
                            this.orderDate = null
                            this.orderDays = 0
                            this.orderCost = 0
                            this.dialogFormVisible = false
                        }
                    }
                });
            }
        },
        mounted() {

            $.ajax({
                type: "get",
                url: "/roomtype/listAll",
                dateType: "json",
                success: (res) => {
                    console.log(res.data)
                    if (res.ret) {
                        this.roomTypeList = res.data

                    }
                    console.log(this.roomTypeList)
                }
            });


        }


    })
</script>

</body>
</html>