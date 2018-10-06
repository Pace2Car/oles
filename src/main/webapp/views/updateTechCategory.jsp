<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        更新课程信息
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 96px;">知识点ID：</div>
                    <input style="width: 300px" type="text" class="form-control" id="TechCategoryId" value="${oldTechCategory.id}"
                           name="id" placeholder="请输入课程名" disabled>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">课程名称：</div>
                    <select name="courseId" id="updateCourseId"
                            style="width: 300px"
                            class="form-control" placeholder="请选择课程名"
                            aria-controls="editable"
                            disabled>
                        <option value="${oldTechCategory.courseId}">${oldTechCategory.course.courseName}</option>
                    </select>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">知识点名称：</div>
                    <input style="width: 300px" type="text" class="form-control" id="newName" value="${oldTechCategory.techCtgr}"
                           name="techCtgr" placeholder="请输入知识点">
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
            var TechCategory = $("#updateForm").serialize();
            $.post("category/updateTechCategory", TechCategory, function (json) {
                $("#tr_" + $("#TechCategoryId").val() + " td:eq(1)").text($("#newName").val());

               // console.dirxml("#tr_" + $("#TechCategoryId").val() + " td:eq(1)");

                console.dirxml($("#tr_" + $("#TechCategoryId").val())[0]);

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
