<%--
  Created by IntelliJ IDEA.
  User: Haoge
  Date: 2018/8/31
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
</head>
<body>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element" align="center"> <span>
                            <img alt="image" class="img-circle" src="images/admin.png"/>
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong
                                    class="font-bold">${sessionScope.logUser.userName}</strong>
                             </span> <span class="text-muted text-xs block">超级管理员<b
                                    class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="javascript:void(0)">Profile</a></li>
                        <li><a href="javascript:void(0)">Contacts</a></li>
                        <li><a href="javascript:void(0)">Mailbox</a></li>
                        <li class="divider"></li>
                        <li><a href="user/logOut">Logout</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    OLES
                </div>
            </li>
            <li>
                <a href="views/index.jsp">
                    <i class="fa fa-home"></i>
                    <span class="nav-label">首页</span> <span class="fa arrow"></span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-user"></i>
                    <span class="nav-label">用户管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="user/list">用户信息</a></li>
                    <li><a href="views/userImport.jsp">用户导入</a></li>
                    <li><a href="user/list">用户操作</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-file-text"></i>
                    <span class="nav-label">试卷管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level collapse">
                    <li class="nav-label">
                        <a href="javascript:void(0)">
                            <span class="nav-label">新增试题</span> <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-third-level collapse">
                            <li><a href="views/addRadio.jsp">新增单选题</a></li>
                            <li><a href="views/addCheckBox.jsp">新增多选题</a></li>
                            <li><a href="views/addJudge.jsp">新增判断题</a></li>
                            <li><a href="views/addShort.jsp">新增简答题</a></li>
                            <li><a href="views/addProgram.jsp">新增编程题</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <span class="nav-label">查询试题</span> <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-third-level collapse">
                            <li><a href="examManage/radio">查询单选题</a></li>
                            <li><a href="examManage/checkBox">查询多选题</a></li>
                            <li><a href="examManage/judge">查询判断题</a></li>
                            <li><a href="examManage/shorts">查询简答题</a></li>
                            <li><a href="examManage/program">查询编程题</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-bars"></i>
                    <span class="nav-label">分类管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="category/searchCourse">课程管理</a></li>
                    <li><a href="category/searchTechCategory">知识点管理</a></li>
                </ul>

            </li>
            <li >
                <a href="index.jsp">
                    <i class="fa fa-th-large"></i>
                    <span class="nav-label">考试管理</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="examManage/searchExamination">试卷信息管理</a></li>
                    <li><a href="examManage/maintain">试卷维护</a></li>
                    <li><a href="examManage/subjectiveList">主观题改卷</a></li>
                    <li><a href="gradeTable/list">成绩统计</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
</body>
</html>
