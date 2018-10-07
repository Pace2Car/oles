<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>模板-在线考试后台管理系统</title>

    <link href="vendor/css/inspiniaen/datatables.min.css" rel="stylesheet">
    <link href="vendor/css/inspiniaen/style.css" rel="stylesheet">
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
                <h2>考试成绩</h2>
                <ol class="breadcrumb">
                    <li style="color:red">
                        (编号:XXXXXXXXXXXXX)
                    </li>
                </ol>
            </div>
            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">

                                <div class="table-responsive">
                                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline dt-bootstrap"><div class="html5buttons"></div><div id="DataTables_Table_0_filter" class="dataTables_filter"></div><div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite"></div><table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" role="grid">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="序号: activate to sort column descending" style="width: 238px;">序号</th>
                                            <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="姓名: activate to sort column ascending" style="width: 117px;">姓名</th>
                                            <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="成绩: activate to sort column ascending" style="width: 277px;">成绩</th>
                                            <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="性别: activate to sort column ascending" style="width: 186px;">性别</th>
                                            <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="毕业院校及其专业: activate to sort column ascending" style="width: 279px;">毕业院校及其专业</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${grade}" var="g">
                                            <tr class="gradeA odd" role="row">
                                                <td class="sorting_1">${g.id}</td>
                                                <td>${g.oltsUsers.userName}</td>
                                                <td>${g.score}</td>
                                                <td class="center">${g.oltsUsers.gender}</td>
                                                <td class="center">${g.oltsUsers.graduateSchool}${g.oltsUsers.marjor}</td>
                                            </tr>
                                        </c:forEach>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        <tr class="gradeA odd" role="row">
                                            <td class="sorting_1">1</td>
                                            <td>卢阳</td>
                                            <td>59.0</td>
                                            <td class="center">男</td>
                                            <td class="center">四川工商学院计算机科学与技术</td>
                                        </tr>
                                        </tbody>
                                        <tfoot>
                                        <tr><th rowspan="1" colspan="1">序号</th>
                                            <th rowspan="1" colspan="1">姓名</th>
                                            <th rowspan="1" colspan="1">成绩</th>
                                            <th rowspan="1" colspan="1">性别</th>
                                            <th rowspan="1" colspan="1">毕业院校及其专业</th></tr>
                                        </tfoot>
                                    </table></div>
                                </div>

                            </div>
                        </div>
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
<script src="vendor/js/datatables.min.js"></script>

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

    $(document).ready(function(){
        $('.dataTables-example').DataTable({
            pageLength: 50,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                { extend: 'copy'},
                {extend: 'csv'},
                {extend: 'excel', title: 'scoreTable'},
                {extend: 'pdf', title: 'scoreTable'},

                {extend: 'print',
                    customize: function (win){
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');

                        $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    }
                }
            ]

        });

    });

</script>

</body>

</html>
