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
                <h2>试卷</h2>
                <ol class="breadcrumb">
                    <li style="color:red">
                        (编号:${exam})
                    </li>
                </ol>
            </div>

            <div class="col-lg-12">
                <form action="">
                <c:forEach items="${sq}" var="sq">
                <div class="ibox float-e-margins border-bottom">
                    <div class="ibox-content">
                        <table class="table table-hover no-margins">
                            <thead>
                            <tr>
                                <td>
                                    <c:if test="${sq.questionType==1}"><strong><i>(一)单选题</i></strong></c:if>
                                </td>
                            </tr>
                            <tr>
                                <th style="font-size: 16px"><strong><i>${sq.question}</i></strong></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${sq.questionType==1}">
                                    <tr>
                                        <td>
                                            <span class="input-group-addon" style="width: 38px;height: 34px">
                                            <input type="radio" name="correct_${sq.id}" value="A">&nbsp;&nbsp;A.&nbsp;&nbsp;<span style="color: blue">${sm.get(sq.id).optionA}</span>
                                            </span>
                                            </td>
                                        <td><span class="input-group-addon" style="width: 38px;height: 34px">
                                            <input type="radio" name="correct_${sq.id}" value="A">&nbsp;&nbsp;B.&nbsp;&nbsp;<span style="color: blue">${sm.get(sq.id).optionB}</span>
                                            </span></td>
                                        <td><span class="input-group-addon" style="width: 38px;height: 34px">
                                            <input type="radio" name="correct_${sq.id}" value="A">&nbsp;&nbsp;C.&nbsp;&nbsp;<span style="color: blue">${sm.get(sq.id).optionC}</span>
                                            </span></td>
                                        <td><span class="input-group-addon" style="width: 38px;height: 34px">
                                            <input type="radio" name="correct_${sq.id}" value="A">&nbsp;&nbsp;D.&nbsp;&nbsp;<span style="color: blue">${sm.get(sq.id).optionD}</span>
                                            </span></td>
                                    </tr>
                                </c:when>
                                <c:when test="${sq.questionType==2}">
                                    <label class="col-sm-1 control-label">A</label>
                                    <div class="input-group m-b"><span class="input-group-addon"> <input type="checkbox" name="correct" value="A" >${sm.get(sq.id).optionA}</span>
                                        <input type="text" class="form-control" name="optionA"></div>
                                    <label class="col-sm-1 control-label">B</label>
                                    <div class="input-group m-b"><span class="input-group-addon"> <input type="checkbox" name="correct" value="B">${sm.get(sq.id).optionB}</span>
                                        <input type="text" class="form-control" name="optionB"></div>
                                    <label class="col-sm-1 control-label">C</label>
                                    <div class="input-group m-b"><span class="input-group-addon"> <input type="checkbox" name="correct" value="C">${sm.get(sq.id).optionC}</span>
                                        <input type="text" class="form-control" name="optionC"></div>
                                    <label class="col-sm-1 control-label">D</label>
                                    <div class="input-group m-b"><span class="input-group-addon"> <input type="checkbox" name="correct" value="D">${sm.get(sq.id).optionD}</span>
                                        <input type="text" class="form-control" name="optionD"></div>
                                </c:when>
                            </c:choose>
                            <%--<tr>--%>
                                <%--<td>--%>
                                    <%--<div class="well" style="font-size: 15px">--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
                </c:forEach>
                </form>
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
