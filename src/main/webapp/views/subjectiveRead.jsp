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
                <h2>主观题阅卷</h2>
                <ol class="breadcrumb">
                    <li style="color:red">
                        (编号:${examNo})
                    </li>
                </ol>
            </div>
            <div class="col-lg-12">
                <c:forEach items="${answer}" var="answer">
                <div class="ibox float-e-margins border-bottom">
                    <div class="ibox-title">
                        <div class="ibox-tools" style="text-align: left">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><strong><i><span style="color:red">${answer.oltsUsers.id}、${answer.oltsUsers.userName}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客观题得分:66.0</i></strong></span>
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <c:if test="${answer.status==0}"><span class="label label-warning" style="margin-top: 1.5px">未修改</span></c:if>
                            <c:if test="${answer.status==1}"><span class="label label-primary" style="margin-top: 1.5px">已修改</span></c:if>
                        </div>
                    </div>
                    <div class="ibox-content" style="display: none">
                        <table class="table table-hover no-margins">
                            <thead>
                            <tr>
                                <th style="font-size: 16px"><strong><i>
                                    <c:if test="${answer.fspQuestions.questionType==5}">
                                        (一) 简答题 每题5分
                                    </c:if>
                                    <c:if test="${answer.fspQuestions.questionType==6}">
                                        (二) 编程题 每题10分
                                    </c:if>
                                </i></strong></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>&nbsp;&nbsp;1.&nbsp;&nbsp;<span style="color: blue">${answer.fspQuestions.question}</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="well" style="font-size: 15px">
                                        &nbsp;&nbsp;${answer.answer}
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;参考答案：${answer.fspQuestions.stdAnswer}</td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;得分：<input type="text" style="width: 50px">&nbsp;&nbsp;分</td>
                            </tr>
                            </tbody>
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-w-m btn-info">提交</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                </c:forEach>
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
</script>

</body>

</html>
