<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Healer
  Date: 2018/10/5
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
    </button>
    <h4 class="modal-title" id="myModalLabel">修改多选题信息</h4>
</div>
<div class="modal-body" id="update-modal-body">
    <!-- body -->
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <%--<div class="col-md-1 column"></div>--%>
                    <div class="col-md-12 column text-center">

                        <form class="form-horizontal" role="form" id="updateForm" action="ques/update" method="post">
                            <input type="hidden" id="id" name="id" value="${quesId.id}">
                            <div class="form-group">
                                <label for="question" class="col-sm-2 control-label">单选题题干</label>
                                <div class="col-sm-5">
                                    <textarea class="form-control" rows="8" name="question" id="question">${quesId.question}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="descrpt" class="col-sm-2 control-label">问题描述</label>
                                <div class="col-sm-5">
                                    <textarea class="form-control" rows="8" name="descrpt" id="descrpt">${quesId.descrpt}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="optionA" class="col-sm-2 control-label">选项A</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="optionA" name="optionA"
                                           value="${optId.optionA}"
                                           placeholder="请输入选项A">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="optionB" class="col-sm-2 control-label">选项B</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="optionB" name="optionB"
                                           value="${optId.optionB}"
                                           placeholder="请输入选项B">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="optionC" class="col-sm-2 control-label">选项C</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="optionC" name="optionC"
                                           value="${optId.optionC}"
                                           placeholder="请输入选项C">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="optionD" class="col-sm-2 control-label">选项D</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="optionD" name="optionD"
                                           value="${optId.optionD}"
                                           placeholder="请输入选项D">
                                </div>
                            </div><div class="form-group">
                                <label for="optionD" class="col-sm-2 control-label">选项E</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="optionE" name="optionE"
                                           value="${optId.optionE}"
                                           placeholder="请输入选项E">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="correct" class="col-sm-2 control-label">正确答案</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="correct" name="correct"
                                           value="${quesId.correct}"
                                           placeholder="请输入正确答案">
                                    <span class="help-block m-b-none">（以逗号分隔）</span>
                                </div>
                            </div>

                            <%--<div class="form-group">--%>
                            <%--<label for="new_deptno" class="col-sm-2 control-label">部门</label>--%>
                            <%--<div class="col-sm-5">--%>
                            <%--&lt;%&ndash; <input type="text" class="form-control" id="deptno" name="deptno" value="${e.deptno}" placeholder="请输入部门">&ndash;%&gt;--%>
                            <%--<select name="deptno" id="new_deptno" class="form-control">--%>


                            <%--</select>--%>
                            <%--</div>--%>
                            <%--</div>--%>

                        </form>
                    </div>
                    <%--<div class="col-md-1 column"> </div>--%>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="modal-footer">
    <!-- data-dismiss="modal" 该属性让模态框关闭 -->
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary" id="updateBtn" >保存</button>
</div>
<script>
    $(function () {
        $('#updateBtn').click(function () {
            var updateForm = document.getElementById('updateForm');
//检查表单原生验证是否通过
//             if (updateForm.checkValidity()) {
            var data = $('#updateForm').serialize();

            $.post('ques/updateSmd', data, function (json) {
                $('#ques_' + $('#id').val()).text($('#question').val());
                $('#trA_' + $('#id').val() + ' span').text($('#optionA').val());
                $('#trB_' + $('#id').val() + ' span').text($('#optionB').val());
                $('#trC_' + $('#id').val() + ' span').text($('#optionC').val());
                $('#trD_' + $('#id').val() + ' span').text($('#optionD').val());
                $('#trE_' + $('#id').val() + ' span').text($('#optionE').val());
                $('#trR_' + $('#id').val() + ' span').text($('#correct').val());
                if (json.actionFlag) {
                    $('#myModal').modal('hide');
                }
            }, 'json');
            // }
        });
    })
</script>