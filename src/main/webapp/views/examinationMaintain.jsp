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
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <h2>${examination.descrpt}</h2>
                <ol class="breadcrumb">
                    <li style="color:red">
                        <input type="hidden" id="examNo" name="examNo" value="${examination.examNo}">
                        (编号:${examination.examNo})
                    </li>
                </ol>
            </div>

            <div class="col-lg-12">
                    <div style="float: right">
                        <button class="btn btn-primary active" type="button" data-toggle="modal" data-target="#myModal1">增加单选题</button>
                        <button class="btn btn-primary active" type="button" data-toggle="modal" data-target="#myModal2">增加多选题</button>
                        <button class="btn btn-primary active" type="button" data-toggle="modal" data-target="#myModal3">增加判断题</button>
                        <button class="btn btn-primary active" type="button" data-toggle="modal" data-target="#myModal4">增加简答题</button>
                        <button class="btn btn-primary active" type="button" data-toggle="modal" data-target="#myModal5">增加编程题</button>
                        <button class="btn btn-primary active" type="button" id="refresh">刷新</button>
                        <button class="btn btn-primary active" type="button" id="return">返回</button>
                    </div>
                    <c:forEach items="${sq}" var="sq" varStatus="s">
                        <div class="ibox float-e-margins border-bottom">
                            <div class="ibox-content">
                                <table class="table table-hover no-margins">
                                    <thead>
                                    <tr>
                                        <c:if test="${sq.questionType==1}">
                                            <td>
                                                <strong><i>(一)单选题 每题2分</i></strong>
                                            </td>
                                        </c:if>
                                        <c:if test="${sq.questionType==2}">
                                            <td>
                                                <strong><i>(二)多选题 每题2分</i></strong>
                                            </td>
                                        </c:if>
                                        <c:if test="${sq.questionType==3}">
                                            <td>
                                                <strong><i>(三)判断题 每题2分</i></strong>
                                            </td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <th style="font-size: 16px" ><strong ><i>${s.count}.${sq.question}<input
                                                type="hidden" value="${sq.id}"></i></strong>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${sq.questionType==1 || sq.questionType==0}">
                                            <tr>
                                                <td>
                                            <span style="width: 38px;height: 34px">
                                            <input type="radio" name="s_${sq.id}" id="s_${sq.id}"
                                                   quesNo="s_${sq.id}" onchange="saveToLocal(this)"
                                                   currentAns="${sq.correct}" value="A">&nbsp;&nbsp;A.&nbsp;&nbsp;<span
                                                    style="color: blue">${op.get(sq.id).optionA}</span>
                                            </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span style="width: 38px;height: 34px">
                                            <input type="radio" name="s_${sq.id}" id="s_${sq.id}"
                                                   quesNo="s_${sq.id}" onchange="saveToLocal(this)" value="B">&nbsp;&nbsp;B.&nbsp;&nbsp;<span
                                                        style="color: blue">${op.get(sq.id).optionB}</span>
                                            </span></td>
                                            </tr>
                                            <tr>
                                                <td><span style="width: 38px;height: 34px">
                                            <input type="radio" name="s_${sq.id}" id="s_${sq.id}"
                                                   quesNo="s_${sq.id}" onchange="saveToLocal(this)" value="C">&nbsp;&nbsp;C.&nbsp;&nbsp;<span
                                                        style="color: blue">${op.get(sq.id).optionC}</span>
                                            </span></td>
                                            </tr>
                                            <tr>
                                                <td><span style="width: 38px;height: 34px">
                                            <input type="radio" name="s_${sq.id}" id="s_${sq.id}"
                                                   quesNo="s_${sq.id}" onchange="saveToLocal(this)" value="D">&nbsp;&nbsp;D.&nbsp;&nbsp;<span
                                                        style="color: blue">${op.get(sq.id).optionD}</span>
                                            </span></td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${sq.questionType==2 || sq.questionType==-1}">
                                            <tr>
                                                <td>
                                            <span style="width: 38px;height: 34px">
                                            <input type="checkbox" name="m_${sq.id}"
                                                   quesNo="m_${sq.id}" onchange="saveToLocal(this)" value="A">&nbsp;&nbsp;A.&nbsp;&nbsp;<span
                                                    style="color: blue">${op.get(sq.id).optionA}</span>
                                            </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span style="width: 38px;height: 34px">
                                            <input type="checkbox" name="m_${sq.id}"
                                                   quesNo="m_${sq.id}" onchange="saveToLocal(this)" value="B">&nbsp;&nbsp;B.&nbsp;&nbsp;<span
                                                        style="color: blue">${op.get(sq.id).optionB}</span>
                                            </span></td>
                                            </tr>
                                            <tr>
                                                <td><span style="width: 38px;height: 34px">
                                            <input type="checkbox" name="m_${sq.id}"
                                                   quesNo="m_${sq.id}" onchange="saveToLocal(this)" value="C">&nbsp;&nbsp;C.&nbsp;&nbsp;<span
                                                        style="color: blue">${op.get(sq.id).optionC}</span>
                                            </span></td>
                                            </tr>
                                            <tr>
                                                <td><span style="width: 38px;height: 34px">
                                            <input type="checkbox" name="m_${sq.id}"
                                                   quesNo="m_${sq.id}" onchange="saveToLocal(this)" value="D">&nbsp;&nbsp;D.&nbsp;&nbsp;<span
                                                        style="color: blue">${op.get(sq.id).optionD}</span>
                                            </span></td>
                                            </tr>
                                            <c:if test="${op.get(sq.id).optionE != null}">
                                                <tr>
                                                    <td>
                                                    <span style="width: 38px;height: 34px">
                                                    <input type="checkbox" name="m_${sq.id}"
                                                           quesNo="m_${sq.id}" onchange="saveToLocal(this)" value="E">&nbsp;&nbsp;E.&nbsp;&nbsp;
                                                    <span style="color: blue">${op.get(sq.id).optionE}</span>
                                                    </span>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:when>

                                        <c:when test="${sq.questionType==3 || sq.questionType==-2}">
                                            <tr>
                                                <td>
                                                    <div class="col-lg-8">
                                                        <label> <input type="radio" currentAns="${sq.id}${sq.correct}" value="对"
                                                                       quesNo="j_${sq.id}" onchange="saveToLocal(this)"
                                                                       name="j_${sq.id}"> 对 </label>
                                                        <label> <input type="radio" value="错"
                                                                       quesNo="j_${sq.id}" onchange="saveToLocal(this)"
                                                                       name="j_${sq.id}"> 错 </label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:when>
                                    </c:choose>
                                    <tr>
                                        <td>
                                            <button type="button" onclick="toDelete(this)" smdId="${sq.id}" queType="${sq.questionType}"
                                                    class="btn btn-outline btn-warning"
                                                    data-toggle="modal"
                                                    data-target="#deleteModal" data-backdrop="static">移除本题</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach items="${fq}" var="fq" varStatus="s">
                        <div class="ibox float-e-margins border-bottom">
                            <div class="ibox-content">
                                <table class="table table-hover no-margins">
                                    <thead>
                                    <tr>
                                        <c:if test="${fq.questionType==5}">
                                            <td>
                                                <strong><i>(四)简答题 每题5分</i></strong>
                                            </td>
                                        </c:if>
                                        <c:if test="${fq.questionType==6}">
                                            <td>
                                                <strong><i>(五)编程题 每题10分</i></strong>
                                            </td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <th style="font-size: 16px">
                                            <strong><i>${s.count}.${fq.question}</i></strong>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${fq.questionType==5||fq.questionType==-3}">
                                            <tr>
                                                <td>
                                                    <div>
                                                        <textarea class="form-control" rows="5"
                                                                  id="sa_${fq.id}" quesNo="sa_${fq.id}" onchange="saveToLocal(this)"
                                                                  name="stdAnswer" ></textarea>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${fq.questionType==6 || fq.questionType==-4}">
                                            <tr>
                                                <td>
                                                    <textarea class="form-control" rows="14"
                                                              id="p_${fq.id}" quesNo="p_${fq.id}"
                                                              name="stdAnswer" onchange="saveToLocal(this)"></textarea>
                                                </td>
                                            </tr>
                                        </c:when>
                                    </c:choose>
                                    <tr>
                                        <td>
                                            <button type="button" onclick="toDelete2(this)" fspId="${fq.id}" queType2="${fq.questionType}"
                                                    class="btn btn-outline btn-warning"
                                                    data-toggle="modal"
                                                    data-target="#deleteModal" data-backdrop="static">移除本题</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:forEach>
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
    <!-- 选择模态框 -->
    <div class="modal inmodal fade" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h1 class="modal-title">请选择新增的单选试题编号</h1>
                </div>
                <c:forEach items="${s}" var="sId">
                    <div class="modal-body" style="text-align: center">
                        <a onclick="addSingle()" data-dismiss="modal" id="sId">${sId}</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 选择模态框 -->
    <div class="modal inmodal fade" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h1 class="modal-title">请选择新增的多选试题编号</h1>
                </div>
                <c:forEach items="${m}" var="mId">
                    <div class="modal-body" style="text-align: center">
                        <a onclick="addMultiple()" data-dismiss="modal" id="mId">${mId}</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 选择模态框 -->
    <div class="modal inmodal fade" id="myModal3" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h1 class="modal-title">请选择新增的判断试题编号</h1>
                </div>
                <c:forEach items="${t}" var="tId">
                    <div class="modal-body" style="text-align: center">
                        <a onclick="addTrueFalse()" id="tId" data-dismiss="modal">${tId}</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 选择模态框 -->
    <div class="modal inmodal fade" id="myModal4" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h1 class="modal-title">请选择新增的简答题编号</h1>
                </div>
                <c:forEach items="${san}" var="sAnswerId">
                    <div class="modal-body" style="text-align: center">
                        <a onclick="addSimpleAnswert()" id="sanId" data-dismiss="modal">${sAnswerId}</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 选择模态框 -->
    <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h1 class="modal-title">请选择新增的编程题编号</h1>
                </div>
                <c:forEach items="${p}" var="pId">
                    <div class="modal-body" style="text-align: center">
                        <a onclick="addProgram()" id="pId" data-dismiss="modal">${pId}</a>
                    </div>
                </c:forEach>
            </div>
        </div>
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
                您确定要删除编号为：<span id="smId"></span> 的试题吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="deleteConfirmBtn" type="button" class="btn btn-primary">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
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
    $(function () {
        $('#successAlert').hide();
        $('#failAlert').hide();
    });

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

    $(function () {
        $("#refresh").click(function () {
            window.location.reload();
        })
    })

    $(function () {
        $("#return").click(function () {
            window.location.replace("examManage/maintain");;
        })
    })

    function addSingle(){
        var examNo = $('#examNo').val();
        var sId = $('#sId').html();
        var s = sId.substring(0,sId.indexOf("、"));
        $.post("ques/toAdd?examNo="+examNo+"&singleId="+s,function (json) {
            if (json.actionFlag) {
                $('#successAlert').show();
                setTimeout("$('#successAlert').hide()", 1000);
                window.location.reload();
            } else {
                $('#failAlert').show();
                setTimeout("$('#failAlert').hide()", 3000);
            }
        },"json")
    }

    function addMultiple(){
        var examNo = $('#examNo').val();
        var mId = $('#mId').html();
        var m = mId.substring(0,mId.indexOf("、"));
        $.post("ques/toAdd?examNo="+examNo+"&multipleId="+m,function (json) {
            if (json.actionFlag) {
                $('#successAlert').show();
                setTimeout("$('#successAlert').hide()", 1000);
                window.location.reload();
            } else {
                $('#failAlert').show();
                setTimeout("$('#failAlert').hide()", 3000);
            }
        },"json")
    }

    function addTrueFalse(){
        var examNo = $('#examNo').val();
        var tId = $('#tId').html();
        var t = tId.substring(0,tId.indexOf("、"));
        $.post("ques/toAdd?examNo="+examNo+"&trueFalseId="+t,function (json) {
            if (json.actionFlag) {
                $('#successAlert').show();
                setTimeout("$('#successAlert').hide()", 1000);
                window.location.reload();
            } else {
                $('#failAlert').show();
                setTimeout("$('#failAlert').hide()", 3000);
            }
        },"json")
    }

    function addSimpleAnswert(){
        var examNo = $('#examNo').val();
        var sanId = $('#sanId').html();
        var san = sanId.substring(0,sanId.indexOf("、"));
        $.post("ques/toAdd?examNo="+examNo+"&simpleAnwserId="+san,function (json) {
            if (json.actionFlag) {
                $('#successAlert').show();
                setTimeout("$('#successAlert').hide()", 1000);
                window.location.reload();
            } else {
                $('#failAlert').show();
                setTimeout("$('#failAlert').hide()", 3000);
            }
        },"json")
    }

    function addProgram(){
        var examNo = $('#examNo').val();
        var pId = $('#pId').html();
        var p = pId.substring(0,pId.indexOf("、"));
        $.post("ques/toAdd?examNo="+examNo+"&programId="+p,function (json) {
            if (json.actionFlag) {
                $('#successAlert').show();
                setTimeout("$('#successAlert').hide()", 1000);
                window.location.reload();
            } else {
                $('#failAlert').show();
                setTimeout("$('#failAlert').hide()", 3000);
            }
        },"json")
    }

    function toDelete(e) {
        var smdId = $(e).attr("smdId");
        var queType = $(e).attr("queType");
        console.dirxml(queType);
        var examNo = $('#examNo').val();
        $("#smId").text(smdId);
        if (queType == 1  || queType==0) {
            $("#deleteConfirmBtn").click(function () {
                $.get("examManage/deleteExam?examNo=" + examNo+"&singleId="+smdId+"&questionType="+queType, function (json) {
                    if (json.actionFlag) {
                        $('#successAlert').show();
                        setTimeout("$('#successAlert').hide()", 1000);
                    } else {
                        $('#failAlert').show();
                        setTimeout("$('#failAlert').hide()", 3000);
                    }
                    $('#deleteModal').modal('hide');
                    window.location.reload();
                }, "json");
            });
        }

        if (queType == 2  || queType== -1) {
            $("#deleteConfirmBtn").click(function () {
                $.get("examManage/deleteExam?examNo=" + examNo+"&multipleId="+smdId+"&questionType="+queType, function (json) {
                    if (json.actionFlag) {
                        $('#successAlert').show();
                        setTimeout("$('#successAlert').hide()", 1000);
                    } else {
                        $('#failAlert').show();
                        setTimeout("$('#failAlert').hide()", 3000);
                    }
                    $('#deleteModal').modal('hide');
                    window.location.reload();
                }, "json");
            });
        }

        if (queType == 3  || queType== -2) {
            $("#deleteConfirmBtn").click(function () {
                $.get("examManage/deleteExam?examNo=" + examNo+"&trueFalseId="+smdId+"&questionType="+queType, function (json) {
                    if (json.actionFlag) {
                        $('#successAlert').show();
                        setTimeout("$('#successAlert').hide()", 1000);
                    } else {
                        $('#failAlert').show();
                        setTimeout("$('#failAlert').hide()", 3000);
                    }
                    $('#deleteModal').modal('hide');
                    window.location.reload();
                }, "json");
            });
        }
    }

    function toDelete2(e) {
        var fspId = $(e).attr("fspId");
        var queType2 = $(e).attr("queType2");
        console.dirxml(queType2);
        console.dirxml(fspId);
        var examNo = $('#examNo').val();
        $("#smId").text(fspId);
        if (queType2 == 5  || queType2==-3) {
            $("#deleteConfirmBtn").click(function () {
                $.get("examManage/deleteExam?examNo=" + examNo+"&simpleAnwserId="+fspId+"&questionType="+queType2, function (json) {
                    if (json.actionFlag) {
                        $('#successAlert').show();
                        setTimeout("$('#successAlert').hide()", 1000);
                    } else {
                        $('#failAlert').show();
                        setTimeout("$('#failAlert').hide()", 3000);
                    }
                    $('#deleteModal').modal('hide');
                    window.location.reload();
                }, "json");
            });
        }

        if (queType2 == 6  || queType2== -4) {
            $("#deleteConfirmBtn").click(function () {
                $.get("examManage/deleteExam?examNo=" + examNo+"&programId="+fspId+"&questionType="+queType2, function (json) {
                    if (json.actionFlag) {
                        $('#successAlert').show();
                        setTimeout("$('#successAlert').hide()", 1000);
                    } else {
                        $('#failAlert').show();
                        setTimeout("$('#failAlert').hide()", 3000);
                    }
                    $('#deleteModal').modal('hide');
                    window.location.reload();
                }, "json");
            });
        }

        if (queType == 3  || queType== -2) {
            $("#deleteConfirmBtn").click(function () {
                $.get("examManage/deleteExam?examNo=" + examNo+"&trueFalseId="+smdId+"&questionType="+queType, function (json) {
                    if (json.actionFlag) {
                        $('#successAlert').show();
                        setTimeout("$('#successAlert').hide()", 1000);
                    } else {
                        $('#failAlert').show();
                        setTimeout("$('#failAlert').hide()", 3000);
                    }
                    $('#deleteModal').modal('hide');
                    window.location.reload();
                }, "json");
            });
        }
    }

</script>

</body>

</html>
