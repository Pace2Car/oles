<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户信息-在线考试后台管理系统</title>

    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <link href="vendor/css/plugins/footable/footable.core.css" rel="stylesheet">

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
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">用户信息</font></font>
                                    </h5>

                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-wrench"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user">
                                            <li><a href="#"><font style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">配置选项1</font></font></a>
                                            </li>
                                            <li><a href="#"><font style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">配置选项2</font></font></a>
                                            </li>
                                        </ul>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <input type="text" class="form-control input-sm m-b-xs" id="filter"
                                           placeholder="Search in table">

                                    <table class="footable table table-stripped default footable-loaded"
                                           data-page-size="8" data-filter="#filter">
                                        <thead>
                                        <tr>
                                            <th class="footable-visible footable-first-column footable-sortable"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">序号</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                            <th class="footable-visible footable-sortable"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">姓名</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet" class="footable-visible footable-sortable">
                                                <font style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">身份证号码</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet"
                                                class="footable-visible footable-sortable footable-sortable"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">专业</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet"
                                                class="footable-visible footable-last-column footable-sortable"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">最高学历</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet"
                                                class="footable-visible footable-last-column footable-sortable"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">手机号码</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet"
                                                class="footable-visible footable-last-column footable-sortable"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">QQ号码</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet"
                                                class="footable-visible footable-last-column footable-sortable"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">授课院校</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet"
                                                class="footable-visible footable-last-column footable-sortable"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">操作</font></font><span
                                                    class="footable-sort-indicator"></span></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="users" items="${page.getResult()}" varStatus="status">
                                            <tr id="tr_${users.id}" class="gradeC footable-odd" style="display: table-row;">
                                                <td class="footable-visible footable-first-column"><span
                                                        class="footable-toggle"></span><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">${users.id}</font></font>
                                                </td>
                                                <td class="footable-visible"><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">${users.userName}</font></font>
                                                </td>
                                                <td class="footable-visible"><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">${users.idCardNo}</font></font>
                                                </td>
                                                <td class="center footable-visible"><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">${users.marjor}</font></font>
                                                </td>
                                                <td class="center footable-visible"><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">${users.eduBackground}</font></font>
                                                </td>
                                                <td class="center footable-visible"><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">${users.mobile}</font></font>
                                                </td>
                                                <td class="center footable-visible"><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">${users.qq}</font></font></td>
                                                <td class="center footable-visible"><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;">${users.graduateSchool}
                                                </font></font>
                                                </td>
                                                <td class="center footable-visible footable-last-column"><font
                                                        style="vertical-align: inherit;"><font
                                                        style="vertical-align: inherit;"><a id="toUpdateBtn" onclick="toUpdate(this)" href="#" no="${users.id}"
                                                                                            class="btn btn-info btn-sm"
                                                                                            data-toggle="modal"
                                                                                            data-target="#myModal"
                                                                                            data-backdrop="static">
                                                    <span class="glyphicon glyphicon-refresh"></span> 更新
                                                </a></font></font></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <%--<tr>--%>
                                        <%--<td colspan="5" class="footable-visible">--%>
                                        <%--<ul class="pagination pull-right">--%>
                                        <%--<li class="footable-page-arrow disabled">--%>
                                        <%--<a data-page="first" href="#first"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">«</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--<li class="footable-page-arrow disabled">--%>
                                        <%--<a data-page="prev" href="#prev"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">&lt;</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--<li class="footable-page active">--%>
                                        <%--<a data-page="0" href="user/list?pageNum=1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--<li class="footable-page">--%>
                                        <%--<a data-page="1" href="user/list?pageNum=2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--<li class="footable-page">--%>
                                        <%--<a data-page="2" href="user/list?pageNum=3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">3</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--<li class="footable-page">--%>
                                        <%--<a data-page="3" href="user/list?pageNum=4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">4</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--<li class="footable-page">--%>
                                        <%--<a data-page="4" href="user/list?pageNum=5"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">5</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--<li class="footable-page-arrow">--%>
                                        <%--<a data-page="next" href="#next"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">&gt;</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--<li class="footable-page-arrow">--%>
                                        <%--<a data-page="last" href="#last"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">»</font></font></a>--%>
                                        <%--</li>--%>
                                        <%--</ul>--%>
                                        <%--</td>--%>
                                        <%--</tr>--%>
                                        <tr class="page-nav" style="text-align: right">
                                            <td colspan='5'>
                                                总记录：${page.getTotal()} &nbsp;&nbsp;
                                                第${page.getPageNum()}页/共${page.getPages()}页
                                                &nbsp;&nbsp; &nbsp;&nbsp;
                                                <c:if test="${page.getPageNum() gt 1}">
                                                    <a href="user/list?pageNum=1">第一页</a> &nbsp;
                                                </c:if>
                                                <c:if test="${page.getPageNum() gt 1}">
                                                    <a href="user/list?pageNum=${page.getPageNum()-1}">上一页</a>&nbsp;
                                                </c:if>
                                                <c:if test="${page.getPageNum() lt page.getPages()}">
                                                    <a href="user/list?pageNum=${page.getPageNum()+1}">下一页</a>&nbsp;
                                                </c:if>
                                                <c:if test="${page.getPageNum() lt page.getPages()}">
                                                    <a href="user/list?pageNum=${page.getPages()}">末页</a>&nbsp;
                                                </c:if>
                                            </td>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div><!-- main 在此显示内容 -->
                </div>
            </div>
        </div>
        <!-- footer 底部包装区域 -->
        <%@include file="footer.jsp" %>
    </div>

</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="myModal-content">
        </div>
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

<!-- FooTable -->
<script src="vendor/js/plugins/footable/footable.all.min.js"></script>
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

    function toUpdate(e) {
        $('#myModal-content').empty();
        //console.log($(e).attr('empno'));

        var no = $(e).attr('no');
        //加载更新员工的信息表单，并加入到模态框的content部分
        $.get('user/toUpdate/' + no, function (html) {
            //console.dirxml(html)
            $('#myModal-content').append(html);
        }, 'html');
    }

</script>

</body>

</html>
