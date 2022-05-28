<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/loading.jsp" %>
<html>
<head>
    <title>统计分析管理</title>
    <%@include file="../../common/head.jsp" %>
    <script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.0.2/echarts.min.js"></script>
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
        统计分析管理
        <small>统计分析管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a><i class="fa fa-dashboard"></i>业务管理</a></li>
        <li class="active">统计分析管理</li>
    </ol>
</section>

<!-- Main content -->
<section class="content container-fluid">
    <div class="row">
        <div class="col-md-6">

            <span>客房住宿率</span>

            <div id="main" style="width: 600px;height:400px;"></div>


        </div>
        <div class="col-md-6">

            <span>订单量</span>

            <div id="order" style="width: 600px;height:400px;"></div>


        </div>
    </div>
</section>
<!-- /.content -->


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'), 'light');

    // 指定图表的配置项和数据
    var option = {

        xAxis: {
            type: 'category',
            data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
            axisLabel: {
                formatter: '{value} 月'
            }
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                formatter: '{value} %'
            }
        },
        series: [{
            data: [50, 68, 55.4, 53.2, 76.6, 80.6, 47.6, 45.7, 67.2, 58.3, 78.4, 94.2],
            type: 'line'
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);


    var myChart1 = echarts.init(document.getElementById('order'), 'light');
    var option1 = {
        itemStyle: {
            color: '#409EFF',
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'line'        // 默认为直线，可选为：'line' | 'shadow'
            },
        },
        xAxis: {
            type: 'category',
            data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
            axisLabel: {
                formatter: '{value} 月'
            }
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                formatter: '{value} 单'
            }
        },
        series: [{
            name: '订单量',
            data: [432, 568, 469, 532, 1200, 469, 2000, 3000, 672, 2000, 784, 942],
            type: 'bar'
        }]
    }
    myChart1.setOption(option1);
</script>
</body>
</html>
