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
    <%@include file="navigation.jsp"%>

    <div id="page-wrapper" class="gray-bg">
        <!-- header 顶部包装区域 -->
        <%@include file="header.jsp"%>
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
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">简单的FooTable，具有分页，排序和过滤功能</font></font></h5>

                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-wrench"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user">
                                            <li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">配置选项1</font></font></a>
                                            </li>
                                            <li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">配置选项2</font></font></a>
                                            </li>
                                        </ul>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="Search in table">

                                    <table class="footable table table-stripped default footable-loaded" data-page-size="8" data-filter="#filter">
                                        <thead>
                                        <tr>
                                            <th class="footable-visible footable-first-column footable-sortable"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">渲染引擎</font></font><span class="footable-sort-indicator"></span></th>
                                            <th class="footable-visible footable-sortable"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">浏览器</font></font><span class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet" class="footable-visible footable-sortable"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">平台（S）</font></font><span class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet" class="footable-visible footable-sortable footable-sorted-desc"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">引擎版本</font></font><span class="footable-sort-indicator"></span></th>
                                            <th data-hide="phone,tablet" class="footable-visible footable-last-column footable-sortable"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">CSS等级</font></font><span class="footable-sort-indicator"></span></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="gradeC footable-even" style="display: table-row;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">三叉戟</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Internet Explorer 5.0
                                            </font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得95+</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">五</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">C</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: table-row;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">任天堂DS浏览器</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">任天堂DS</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">8.5</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">C / A </font></font><sup><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></sup></td>
                                        </tr><tr class="gradeA footable-even" style="display: table-row;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">WebKit的</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Safari 3.0</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">OSX.4 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">522.1</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: table-row;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">三叉戟</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Internet Explorer 5.5
                                            </font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得95+</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">5.5</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-even" style="display: table-row;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">WebKit的</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">iPod Touch / iPhone</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">iPod的</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">420.1</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: table-row;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">WebKit的</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">OmniWeb 5.5</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">OSX.4 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">420</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-even" style="display: table-row;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">WebKit的</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Safari 2.0</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">OSX.4 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">419.3</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: table-row;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">WebKit的</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">S60</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">S60</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">413</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeX footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">三叉戟</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Internet Explorer 4.0
                                            </font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得95+</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">4</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">X</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">WebKit的</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Safari 1.3</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">OSX.3</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">312.8</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">KHTML</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Konqureror 3.5</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">KDE 3.5</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">3.5</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">KHTML</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Konqureror 3.3</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">KDE 3.3</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">3.3</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeC footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">KHTML</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Konqureror 3.1</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">KDE 3.1</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">3.1</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">C</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">壁虎</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Netscape Navigator 9</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得98+ / OSX.2 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1.8</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeC footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">塔斯曼</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Internet Explorer 5.2</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Mac OS 8-X</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">C</font></font></td>
                                        </tr><tr class="gradeC footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">塔斯曼</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Internet Explorer 5.1</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Mac OS 7.6-9</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">C</font></font></td>
                                        </tr><tr class="gradeA footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Opera 9.5</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得88+ / OSX.3 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">诺基亚N800</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">N800</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeU footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">其它浏览器</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">所有其他人</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">ü</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Opera 9.2</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得88+ / OSX.3 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Opera 9.0</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得95+ / OSX.3 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Opera 8.5</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得95+ / OSX.2 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Opera 8.0</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得95+ / OSX.2 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Opera 7.5</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得95+ / OSX.2 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeA footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Opera 7.0</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">赢得95+ / OSX.1 +</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeX footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">塔斯曼</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Internet Explorer 4.5</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Mac OS 8-9</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">X</font></font></td>
                                        </tr><tr class="gradeA footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">杂项</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">NetFront 3.1</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">嵌入式设备</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">C</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">杂项</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">NetFront 3.4</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">嵌入式设备</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr><tr class="gradeX footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">杂项</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Dillo 0.8</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">嵌入式设备</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">X</font></font></td>
                                        </tr><tr class="gradeX footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">杂项</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">链接</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">纯文本</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">X</font></font></td>
                                        </tr><tr class="gradeX footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">杂项</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">山猫</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">纯文本</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">X</font></font></td>
                                        </tr><tr class="gradeC footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">杂项</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">IE Mobile</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Windows Mobile 6</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">C</font></font></td>
                                        </tr><tr class="gradeC footable-even" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">杂项</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">PSP浏览器</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">PSP</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">C</font></font></td>
                                        </tr><tr class="gradeA footable-odd" style="display: none;">
                                            <td class="footable-visible footable-first-column"><span class="footable-toggle"></span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">急板</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Wii的Opera</font></font></td>
                                            <td class="footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Wii游戏机</font></font></td>
                                            <td class="center footable-visible"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">- </font></font></td>
                                            <td class="center footable-visible footable-last-column"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">一个</font></font></td>
                                        </tr></tbody>
                                        <tfoot>
                                        <tr>
                                            <td colspan="5" class="footable-visible">
                                                <ul class="pagination pull-right"><li class="footable-page-arrow disabled"><a data-page="first" href="#first"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">«</font></font></a></li><li class="footable-page-arrow disabled"><a data-page="prev" href="#prev"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">&lt;</font></font></a></li><li class="footable-page active"><a data-page="0" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></a></li><li class="footable-page"><a data-page="1" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2</font></font></a></li><li class="footable-page"><a data-page="2" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">3</font></font></a></li><li class="footable-page"><a data-page="3" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">4</font></font></a></li><li class="footable-page"><a data-page="4" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">五</font></font></a></li><li class="footable-page-arrow"><a data-page="next" href="#next"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">&gt;</font></font></a></li><li class="footable-page-arrow"><a data-page="last" href="#last"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">»</font></font></a></li></ul>
                                            </td>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div><!-- main 在此显示内容 -->
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
</script>

</body>

</html>
