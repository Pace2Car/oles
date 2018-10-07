<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>模板-在线考试后台管理系统</title>

    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">

</head>

<body>

<div id="wrapper">
    <%@include file="navigation.jsp"%>

    <div id="page-wrapper" class="gray-bg">
        <!-- header 顶部包装区域 -->
        <%@include file="header.jsp"%>
        <!-- 顶部导航 -->
        <div class="row wrapper border-bottom white-bg page-heading" style="text-align: center">
            <div class="col-lg-10">
                <h2>试卷维护</h2>
                <ol class="breadcrumb">
                    <li style="color:red">
                        (编号:XXXXXXXXXXXXX)
                    </li>
                </ol>
            </div>
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content" style="display: block">
                        <div style="float: right">
                            <button class="btn btn-primary active" type="button" id="addRadio">增加单选题</button>
                            <button class="btn btn-primary active" type="button" id="addMulti-select">增加多选题</button>
                            <button class="btn btn-primary active" type="button" id="addJudge">增加判断题</button>
                            <button class="btn btn-primary active" type="button" id="addShortAnswer">增加简答题</button>
                            <button class="btn btn-primary active" type="button" id="addProgramming">增加编程题</button>
                            <button class="btn btn-primary active" type="button" id="refresh">刷新</button>
                            <button class="btn btn-primary active" type="button" id="return">返回</button>
                        </div>
                        <table class="table table-hover no-margins">
                            <thead>
                            <tr>
                                <th style="font-size: 16px"><strong><i>(一) 简答题 每题5分</i></strong></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>&nbsp;&nbsp;1.&nbsp;&nbsp;<span style="color: blue">请说明&与&&的区别？</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="well" style="font-size: 15px">
                                        &nbsp;&nbsp;参考答案：单&与双&的区别：&&具有中断功能，而&没有
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><a class="btn btn-danger btn-rounded btn-outline" href="#">移除本题</a></td>
                            </tr>
                            </tbody>
                            <tr>
                                <td style="text-align: center">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-w-m btn-info">完成出卷</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- main 主体区域 -->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <!-- main 在此显示内容 -->
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
        <!-- footer 底部包装区域 -->
        <%@include file="footer.jsp"%>
    </div>

</div>


<!-- Mainly scripts -->
<script src="js/jquery-2.2.4.js"></script>
<script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="vendor/js/inspinia.js"></script>
<script src="vendor/js/plugins/pace/pace.min.js"></script>

<!-- DROPZONE -->
<script src="vendor/js/plugins/dropzone/dropzone.js"></script>


<script>
    $(document).ready(function () {

        Dropzone.options.myAwesomeDropzone = {

            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            maxFiles: 100,

            // Dropzone settings
            init: function () {
                var myDropzone = this;

                this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function () {

                });
                this.on("successmultiple", function (files, response) {
                    console.log("successmultiple>>>>>" + response);
                });
                this.on("errormultiple", function (files, response) {
                    console.log(response);
                });
            }
        }

    });

    $(function () {
        $("#refresh").click(function () {
            window.location.reload();
        })
    })
</script>

</body>

</html>
