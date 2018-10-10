<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  TechCategory: Haoge
  Date: 2018/9/1
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        更新试卷信息
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <div class="form-inline">
            <input type="hidden" name="examNo" value="${oldExamination.examNo}">
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">试卷编号：</div>
                    <input style="width: 300px" type="text" class="form-control" id="newExamNo" value="${oldExamination.examNo}"
                           placeholder="请输入试卷编号" disabled>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">考试日期：</div>
                    <input style="width: 300px" type="date" class="form-control" id="newExamDate" value="<fmt:formatDate value="${oldExamination.examDate}" pattern="yyyy-MM-dd"/>"
                           name="examDate" placeholder="请选择考试日期">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">描述：</div>
                    <input style="width: 300px" type="text" class="form-control" id="newDescrpt" value="${oldExamination.descrpt}"
                           name="descrpt" placeholder="请输入试卷描述">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">
        关闭
    </button>
    <button id="updateBtn" type="button" class="btn btn-primary">
        提交更改
    </button>
</div>

<script>
    $(function () {

        $("#updateBtn").click(function () {
            var examination = $("#updateForm").serialize();
            $.post("examManage/updateExamination", examination, function (json) {
                $("#tr_" + $("#newExamNo").val() + " td:eq(1)").text($("#newExamDate").val());
                $("#tr_" + $("#newExamNo").val() + " td:eq(2)").text($("#newDescrpt").val());
                if (json.actionFlag) {
                    $('#successAlert').show();
                    setTimeout("$('#successAlert').hide()", 3000);
                } else {
                    $('#failAlert').show();
                    setTimeout("$('#failAlert').hide()", 3000);
                }
                $('#updateModal').modal("hide");
            },"json");

        });
    });
</script>
