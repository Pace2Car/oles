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
                                    class="font-bold">Pace2Car</strong>
                             </span> <span class="text-muted text-xs block">超级管理员<b
                                    class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="javascript:void(0)">Profile</a></li>
                        <li><a href="javascript:void(0)">Contacts</a></li>
                        <li><a href="javascript:void(0)">Mailbox</a></li>
                        <li class="divider"></li>
                        <li><a href="admin/cheakOut.do">Logout</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    GM+
                </div>
            </li>
            <li>
                <a href="index.jsp">
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
                    <li><a href="admin/userList.do">用户信息</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-file-text"></i>
                    <span class="nav-label">订单管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="trade/tradeList.do">订单信息</a></li>
                    <li><a href="trade/showChart.do">交易量统计</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-bars"></i> <span class="nav-label">商品分类</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="goodsTypes/view.do"><i class="fa fa-cubes"></i>查看分类</a></li>
                    <li><a href="goodsTypes/show.do"><i class="fa fa-plus-square-o"></i>新增分类</a></li>
                </ul>

            </li>
            <li >
                <a href="index.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">商品管理</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="product/home.do">添加商品</a></li>
                    <li><a href="product/list.do">商品列表</a></li>
                    <li><a href="product/sale.do">在售商品管理</a></li>
                </ul>
            </li>
        </ul>

    </div>
</nav>
</body>
</html>
