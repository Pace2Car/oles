<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>新增判断题</title>

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
                        <a href="views/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">试题管理</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">新增试题</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">新增判断题</a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <!-- main 主体区域 -->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <form role="form" action="ques/addJudge" method="post">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">课程</label>
                        </div>
                        <div class="col-lg-12 m-l-n">
                            <select class="form-control" multiple="" id="courseId" name="courseId">
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">知识点</label>
                        </div>
                        <div class="col-lg-12 m-l-n">
                            <select class="form-control" multiple="" id="techCateId" name="techCateId">
                        </select>
                        </div>
                        <div class="col-sm-4 col-sm-offset-2">
                            <br>
                            <br>
                            <button class="btn btn-primary" type="submit">新增试题</button>

                            <button class="btn btn-white" type="submit">取消</button>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label>判断题内容</label>
                            <textarea class="form-control" rows="6" name="question"></textarea>
                        </div>

                        <label class="control-label">正确答案</label>
                        <br>
                        <label> <input type="radio" value="对" id="optionsRadios1" name="correct" > 对 </label>
                        <label> <input type="radio" value="错" id="optionsRadios2" name="correct" > 错 </label>
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
<script>
    $(function () {
        // 加载课程名下拉列表
        $.get("ques/load_courses",function (resp) {
            // console.log(resp);
            $("#courseId").empty();
            $.each(resp, function (i,v) {
                var option = new Option(v.courseName, v.id);
                $("#courseId").append(option);
            });
        },"json");

        $("#courseId").change(function () {
            var courseId = this.options[this.selectedIndex].value;
            console.log(courseId);

            $.get("ques/load_tech_by_id",{"courseId": courseId},function (resp) {
                console.log(resp);

                $("#techCateId").empty();

                $.each(resp, function (i,v) {
                    var option = new Option(v.techCtgr, v.id);
                    $("#techCateId").append(option);
                });

            },"json");
        });
    })
</script>
</body>

</html>
