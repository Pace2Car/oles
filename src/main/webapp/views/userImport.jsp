<%--<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>--%>
<%--<%--%>
<%--String path = request.getContextPath();--%>
<%--String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--%>--%>
<%--<html>--%>
<%--<head>--%>
<%--<base href="<%=basePath%>">--%>
<%--<script type="text/javascript" src="../js/jquery-2.2.4.min.js"></script>--%>
<%--<script type="text/javascript" src="../js/jquery-form.js"></script>--%>
<%--<title>My JSP 'index.jsp' starting page</title>--%>
<%--<script type="text/javascript">--%>
<%--//ajax 方式上传文件操作--%>
<%--$(document).ready(function(){--%>
<%--$('#btn').click(function(){--%>
<%--if(checkData()){--%>
<%--$('#form1').ajaxSubmit({--%>
<%--url:'user/ajaxUpload.do',--%>
<%--dataType: 'text',--%>
<%--success: resutlMsg,--%>
<%--error: errorMsg--%>
<%--});--%>
<%--function resutlMsg(msg){--%>
<%--alert(msg);--%>
<%--$("#upfile").val("");--%>
<%--}--%>
<%--function errorMsg(){--%>
<%--alert("导入excel出错！");--%>
<%--}--%>
<%--}--%>
<%--});--%>
<%--});--%>

<%--//JS校验form表单信息--%>
<%--function checkData(){--%>
<%--var fileDir = $("#upfile").val();--%>
<%--var suffix = fileDir.substr(fileDir.lastIndexOf("."));--%>
<%--if("" == fileDir){--%>
<%--alert("选择需要导入的Excel文件！");--%>
<%--return false;--%>
<%--}--%>
<%--if(".xls" != suffix && ".xlsx" != suffix ){--%>
<%--alert("选择Excel格式的文件导入！");--%>
<%--return false;--%>
<%--}--%>
<%--return true;--%>
<%--}--%>
<%--</script>--%>
<%--</head>--%>

<%--<body>--%>
<%--<div>1.通过简单的form表单提交方式，进行文件的上</br> 2.通过jquery.form.js插件提供的form表单一步提交功能 </div></br>--%>
<%--<form method="POST"  enctype="multipart/form-data" id="form1" action="user/ajaxUpload.do">--%>
<%--<table>--%>
<%--<tr>--%>
<%--<td>上传文件: </td>--%>
<%--<td> <input id="upfile" type="file" name="upfile"></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td><input type="submit" value="提交" onclick="checkData()"></td>--%>
<%--<td><input type="button" value="ajax方式提交" id="btn" name="btn" ></td>--%>
<%--</tr>--%>
<%--</table>--%>
<%--</form>--%>

<%--</body>--%>
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

    <script type="text/javascript">
        //ajax 方式上传文件操作
        $(document).ready(function(){
            $('#btn').click(function(){
                if(checkData()){
                    $('#form1').ajaxSubmit({
                        url:'user/import',
                        dataType: 'text',
                        success: resutlMsg,
                        error: errorMsg
                    });
                    function resutlMsg(msg){
                        alert(msg);
                        $("#upfile").val("");
                    }
                    function errorMsg(){
                        alert("导入excel出错！");
                    }
                }
            });
        });
    </script>
</head>

<body>

<div id="wrapper">
    <%@include file="navigation.jsp" %>

    <div id="page-wrapper" class="gray-bg">
        <!-- header 顶部包装区域 -->
        <%@include file="header.jsp" %>
        <!-- 顶部导航 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>主页</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <!-- main 主体区域 -->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div><span style="color: red">说明：Excel格式如下图所示：</span></br><span style="color: red">学生信息必须从第二行开始，姓名必须在第二列，身份证号在第三列，身份证号不能出现重复</span>
                        <img src="images/excel.png" alt="">
                    </div>
                    </br>
                    <form method="POST" enctype="multipart/form-data" id="form1" action="user/import">
                        <table>
                            <tr>
                                <td>上传文件:</td>
                                <td><input id="upfile" type="file" name="upfile"></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="导入" id="btn" name="btn" class="btn btn-info btn-sm"></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
        <!-- footer 底部包装区域 -->
        <%@include file="footer.jsp" %>
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
