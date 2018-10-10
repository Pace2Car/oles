<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>考试-在线考试</title>

    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <SCRIPT LANGUAGE="JavaScript">
        var i=0;
        function auto_submit (){
            i++;
            var choose = confirm("你试图离开当前窗口,警告第"+i+"次，三次后系统将自动提交试卷!("+i+"/3)");
            if(i==3 && choose){
                window.location.href="http://www.mps.gov.cn/";
            }
        }
            window.onblur=auto_submit;
    </SCRIPT>
</head>

<body>

<div id="wrapper">
    <%--<%@include file="navigation.jsp"%>--%>

    <div id="page-wrapper" class="gray-bg">
        <!-- header 顶部包装区域 -->
        <%@include file="header.jsp" %>
        <!-- 顶部导航 -->
        <div class="row wrapper border-bottom white-bg page-heading" style="text-align: center">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <h2>${examination.descrpt}</h2>
                <ol class="breadcrumb">
                    <li style="color:red">
                        (编号:${examination.examNo})
                    </li>
                </ol>
            </div>

            <div class="col-lg-12">
                <form action="">
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
                                        <th style="font-size: 16px"><strong ><i>${s.count}.${sq.question}</i></strong>
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:forEach>
                    <a href="#" onclick="countScore()"
                       class="btn btn-w-m btn-info"
                       data-toggle="modal"
                       data-target="" data-backdrop="static">提交试卷</a>
                </form>
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
        <%@include file="footer.jsp" %>
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
                <h4 class="modal-title" id="myModalLabel"> 提交确认 </h4>
            </div>
            <div class="modal-body">
                <span class="fa fa-exclamation fa-2x" style="color:#f15b6c;"></span>
                您确定要提交试卷吗？提交后不可修改
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="commitConfirmBtn" type="button" class="btn btn-primary">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- Mainly scripts -->
<script src="js/jquery-2.2.4.js"></script>
<script src="js/store.js"></script>
<script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
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

        store.forEach(function (key, val) {
            if ("sa" == key.substring(0,2) || "p" == key.substring(0,1)) {
                $("#" + key).val(val);
            } else if ("m" == key.substring(0,1)) {
                var name = "input[name='"+ key + "']";
                var all = $(name);
                for (var i = 0; i < all.length; i++) {
                    var checkVal = all.eq(i).val();
                    var valArr = val.split(",");
                    for (var v in valArr) {
                        if (checkVal == valArr[v]) {
                            all.get(i).checked = true;
                        }
                    }
                }
            } else if ("s" == key.substring(0,1) || "j" == key.substring(0,1)) {
                var name = "input[name='"+ key + "']";
                var allRadio = $(name);
                for (var i = 0; i < allRadio.length; i++) {
                    var radioVal = allRadio.eq(i).val();
                    if (radioVal == val) {
                        allRadio.get(i).checked = true;
                    }
                }
            }
        });
    });

    function saveToLocal(e) {
        var key = $(e).attr("quesNo");
        console.dirxml(store.get(key)[1]);
        if ("m" == key.substring(0,1)) {
            var name = "input[name='" + key + "']:checked";
            var value = new Array();
            $(name).each(function (i) {
                value[i] = $(this).val();
            });
            value = value.join(",");
            console.dirxml("m_value:" + value);
        } else {
            var value = $(e).val();
        }
        store.set(key, value);

        console.dirxml(key + ":" + store.get(key));
        var corr =  $(e).attr("quesCorr");

    }

    function countScore() {
        var score = 0;
        store.forEach(function (key, val) {
            if ("m" == key.substring(0,1)) {
                // var name = "input[name='"+ key + "']";
                // var all = $(name);
                // for (var i = 0; i < all.length; i++) {
                //     var checkVal = all.eq(i).val();
                //     var valArr = val.split(",");
                //     for (var v in valArr) {
                //         if (checkVal == valArr[v]) {
                //         }
                //     }
                // }
                // "s" == key.substring(0,1) ||
            } else if ("j" == key.substring(0,1)) {
                var name = "input[name='"+ key + "']:checked";
                var myRadio = $(name).val();
                console.dirxml($(name).attr("cuurentAns"));
                var ca = $(name).attr("currentAns");
                if (myRadio == ca) {
                    score += 2;
                    console.dirxml(score);
                }
            }
        });
    }
</script>

</body>

</html>
