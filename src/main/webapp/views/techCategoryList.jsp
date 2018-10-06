<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>课程列表-在线考试后台管理系统</title>

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
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>分类管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="views/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">分类管理</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">知识点管理</a>
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
                    <!-- main 在此显示内容 -->
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>知识点信息表</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-TechCategory">
                                    <li><a href="#">Config option 1</a>
                                    </li>
                                    <li><a href="#">Config option 2</a>
                                    </li>
                                </ul>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="">
                            </div>
                            <div id="editable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <a href="#" onclick="toInsert()"
                                           class="btn btn-info btn-sm" data-toggle="modal"
                                           data-target="#insertModal" data-backdrop="static">
                                            <span class="fa fa-plus"></span> 新增知识点</a>
                                    </div>
                                    <%--查询表单--%>
                                    <div class="col-sm-10">
                                        <form action="category/searchTechCategory" method="post" class="text-center">
                                            <input type="hidden" id="courseName" value="${sessionScope.techCategory.courseId}">
                                            <span class="dataTables_filter">
                                                <label class="text-right" style="width: 75px">课程名称:</label>
                                                <select name="courseId" id="courseId"
                                                        style="margin-bottom: 5px"
                                                        class="form-select-button input-md" placeholder="请选择课程名"
                                                        aria-controls="editable">
                                                </select>
                                            </span>
                                            <span class="dataTables_filter">
                                                <label class="text-right" style="width: 95px">知识点名称:</label>
                                                <input name="techCtgr" id="techCtgr" value="${sessionScope.techCategory.techCtgr}" style="margin-bottom: 5px"
                                                       type="text" class="form-control input-sm" placeholder="请输入知识点"
                                                       aria-controls="editable">
                                            </span>
                                            <span>
                                                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> 搜索</button>
                                                <a class="btn btn-default" onclick="resetSelect()"><i class="fa fa-repeat"></i> 重置</a>
                                            </span>
                                        </form>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table class="table table-striped table-bordered table-hover  dataTable"
                                               id="editable" role="grid" aria-describedby="editable_info">
                                            <%--顶部标签--%>
                                            <thead>
                                            <tr role="row">
                                                <th class="sorting" tabindex="0" aria-controls="editable"
                                                    rowspan="1" colspan="1" aria-sort="ascending"
                                                    style="width: 172px;">知识点ID
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="editable" rowspan="1"
                                                    style="width: auto;">课程名称
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="editable" rowspan="1"
                                                    style="width: auto;">知识点名称
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="editable" rowspan="1"
                                                    colspan="1"
                                                    aria-label="CSS grade: activate to sort column ascending"
                                                    style="width: 200px;">操作
                                                </th>
                                            </tr>
                                            </thead>
                                            <%--表单内容--%>
                                            <tbody>
                                            <c:forEach var="TechCategory" items="${page}">
                                                <tr id="tr_${TechCategory.id}" class="gradeA odd" role="row">
                                                    <td class="sorting_1">${TechCategory.id}</td>
                                                    <td>${TechCategory.course.courseName}</td>
                                                    <td>${TechCategory.techCtgr}</td>
                                                    <td class="center">
                                                        <a href="#" TechCategoryId="${TechCategory.id}" onclick="toUpdate(this)"
                                                           class="btn btn-info btn-sm" data-toggle="modal"
                                                           data-target="#updateModal" data-backdrop="static">
                                                            <span class="glyphicon glyphicon-refresh"></span> 更新</a>
                                                        <a href="#" TechCategoryId="${TechCategory.id}" onclick="toDelete(this)"
                                                           class="btn btn-danger btn-sm" data-toggle="modal"
                                                           data-target="#deleteModal" data-backdrop="static">
                                                            <span class="glyphicon glyphicon-trash"></span> 删除</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <%--底部标签--%>
                                            <tfoot>
                                            <%--<tr role="row">--%>
                                                <%--<th class="sorting" tabindex="0" aria-controls="editable"--%>
                                                    <%--rowspan="1" colspan="1" aria-sort="ascending"--%>
                                                    <%--style="width: 172px;">课程ID--%>
                                                <%--</th>--%>
                                                <%--<th class="sorting" tabindex="0" aria-controls="editable" rowspan="1"--%>
                                                    <%--style="width: auto;">课程名--%>
                                                <%--</th>--%>
                                                <%--<th class="sorting" tabindex="0" aria-controls="editable" rowspan="1"--%>
                                                    <%--colspan="1"--%>
                                                    <%--aria-label="CSS grade: activate to sort column ascending"--%>
                                                    <%--style="width: auto;">操作--%>
                                                <%--</th>--%>
                                            <%--</tr>--%>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <%--底部页号操作--%>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <div class="dataTables_info" id="editable_info" role="status" aria-live="polite">共${page.getTotal()}条记录</div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="footable-page-arrow">
                                            &nbsp;&minus;${page.getPageNum()}/${page.getPages()}&minus;&nbsp;
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="dataTables_paginate paging_simple_numbers" id="editable_paginate">
                                            <form action="category/searchTechCategory">
                                                <ul class="pagination pull-right">
                                                    <c:if test="${page.getPageNum() gt 1}">
                                                        <li class="footable-page-arrow">
                                                            <a href="category/searchTechCategory?pageNum=1">首页</a></li>
                                                    </c:if>
                                                    <c:if test="${page.getPageNum() gt 1}">
                                                        <li class="footable-page-arrow">
                                                            <a href="category/searchTechCategory?pageNum=${page.getPageNum()-1}">上一页</a>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${page.getPageNum() lt page.getPages()}">
                                                        <li class="footable-page-arrow">
                                                            <a href="category/searchTechCategory?pageNum=${page.getPageNum()+1}">下一页</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${page.getPageNum() lt page.getPages()}">
                                                        <li class="footable-page-arrow">
                                                            <a href="category/searchTechCategory?pageNum=${page.getPages()}">尾页</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${page.getPages() > 1}">
                                                        <li class="footable-page-arrow">
                                                            &nbsp;&nbsp;<input type="text" name="pageNum" style="width: 80px;border-radius: 5px"
                                                                               placeholder="请输入页号" title="请输入页号">
                                                            <button type="submit">前往</button>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
<!-- 添加模态框 -->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="insertModal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" > 添加课程 </h4>
            </div>
            <div class="modal-body text-center">
                <form class="form-horizontal" role="form" id="insertForm">
                    <div class="form-inline">
                        <div class="form-group">
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px">课程名称：</div>
                                <select name="courseId" id="newCourseId"
                                        style="width: 300px"
                                        class="form-control" placeholder="请选择课程名"
                                        aria-controls="editable">
                                </select>
                            </div>
                            <br/><br/>
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px;">知识点名称：</div>
                                <input style="width: 300px" type="text" class="form-control" id="techCategoryName"
                                       name="techCtgr" placeholder="请输入知识点">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="insertBtn" type="button" class="btn btn-primary">添加</button>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 更新模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="updateModal-content">

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 删除模态框 -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> 删除确认 </h4>
            </div>
            <div class="modal-body">
                <span class="fa fa-exclamation fa-2x" style="color:#f15b6c;"></span>
                您确定要删除编号为：<span id="TechCategoryMsg"></span> 的知识点吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="deleteConfirmBtn" type="button" class="btn btn-primary">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--成功提示模态框--%>
<div id="successAlert" class="alert alert-success col-md-2"
     style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>成功！</strong>操作成功！
</div>
<div id="failAlert" class="alert alert-warning col-md-2"
     style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong style="color: red">失败！</strong>操作失败！
</div>
</body>

<script>
    $(function () {

        // 加载搜索框课程名下拉列表
        $.get("category/load_courses",function (resp) {
            // console.log(resp);
            $("#courseId").empty();
            $("#courseId").append("<option value=''>不限--</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.courseName, v.id);
                $("#courseId").append(option);
            });
            //重新选中课程名
            var courseName = $('#courseName').val();
            $('#courseId option[value="' + courseName + '"]').prop("selected", true);
        },"json");

    })
</script>
<script>
    $(function () {
        $('#successAlert').hide();
        $('#failAlert').hide();
    });

    function toUpdate(e) {
        $("#updateModal-content").empty();
        var id = $(e).attr('TechCategoryId');
        console.dirxml(id);
        $.get("category/searchTechCategory?id=" + id, function (html) {
            $("#updateModal-content").append(html);
        }, "html");
    }

    function toDelete(e) {
        var id = $(e).attr('TechCategoryId');
        $("#TechCategoryMsg").text(id);
        $("#deleteConfirmBtn").click(function () {
            $("#tr_" + id).remove();
            $.get("category/deleteTechCategory?id=" + id, function (json) {
                if (json.actionFlag) {
                    $('#successAlert').show();
                    setTimeout("$('#successAlert').hide()", 3000);
                } else {
                    $('#failAlert').show();
                    setTimeout("$('#failAlert').hide()", 3000);
                }
                $('#deleteModal').modal('hide');
            }, "json");
        });
    }

    function toInsert() {
        // 加载课程名下拉列表
        $.get("category/load_courses",function (resp) {
            // console.log(resp);
            $("#newCourseId").empty();
            $("#newCourseId").append("<option value=''>不限--</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.courseName, v.id);
                $("#newCourseId").append(option);
            });
        },"json");
        $("#insertBtn").click(function () {
            console.dirxml($("#TechCategoryName").val());
            var TechCategory = $("#insertForm").serialize();
            $.get("category/insertTechCategory", TechCategory, function (json) {
                if (json.actionFlag) {
                    $('#successAlert').show();
                    setTimeout("$('#successAlert').hide()", 3000);
                } else {
                    $('#failAlert').show();
                    setTimeout("$('#failAlert').hide()", 3000);
                }
                $('#insertModal').modal('hide');
            }, "json");
        });
    }

    function resetSelect() {
        $("#courseId").val("");
        $("#techCtgr").val("");
    }
</script>

</html>
