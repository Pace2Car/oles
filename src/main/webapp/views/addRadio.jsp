<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>新增单选题</title>

    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">

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
                <form role="form">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">课程</label>
                        </div>
                        <div class="col-lg-12 m-l-n"><select class="form-control" multiple="">
                            <option>选项 1</option>
                            <option>选项 2</option>
                            <option>选项 3</option>
                            <option>选项 4</option>
                        </select>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">知识点</label>
                        </div>
                        <div class="col-lg-12 m-l-n"><select class="form-control" multiple="">
                            <option>选项 1</option>
                            <option>选项 2</option>
                            <option>选项 3</option>
                            <option>选项 4</option>
                        </select>
                        </div>
                        <div class="col-sm-4 col-sm-offset-2">
                            <br>
                            <br>
                            <button class="btn btn-primary" type="submit">保存更改</button>

                            <button class="btn btn-white" type="submit">取消</button>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label>单选题题干</label>
                            <textarea class="form-control" rows="8"></textarea>
                        </div>
                        <div>
                            <textarea class="form-control" rows="5"
                                      placeholder="此处为格式代码">&lt;pre&gt;&emsp;&lt;/pre&gt;</textarea>
                        </div>
                        <label class="control-label">选项</label>
                        <br>
                        <label class="col-sm-1 control-label">A</label>
                        <div class="input-group"><span class="input-group-addon"> <input type="radio"
                                                                                         name="opt"> </span> <input
                                type="text" class="form-control"></div>
                        <label class="col-sm-1 control-label">B</label>
                        <div class="input-group"><span class="input-group-addon"> <input type="radio"
                                                                                         name="opt"> </span> <input
                                type="text" class="form-control"></div>
                        <label class="col-sm-1 control-label">C</label>
                        <div class="input-group"><span class="input-group-addon"> <input type="radio"
                                                                                         name="opt"> </span> <input
                                type="text" class="form-control"></div>
                        <label class="col-sm-1 control-label">D</label>
                        <div class="input-group"><span class="input-group-addon"> <input type="radio"
                                                                                         name="opt"> </span> <input
                                type="text" class="form-control"></div>
                    </div>

                </form>
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
