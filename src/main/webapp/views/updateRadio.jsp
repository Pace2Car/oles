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
    <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
</div>
<div class="modal-body" id="update-modal-body">
    <!-- body -->
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <%--<div class="col-md-1 column"></div>--%>
                    <div class="col-md-12 column text-center">

                        <form class="form-horizontal" role="form" id="updateForm" action="ques/updateRadio" method="post">
                            <input type="hidden" id="id" name="id" value="${ques.id}">
                            <div class="form-group">
                            </div>
                            <div class="form-group">
                                <label for="userName" class="col-sm-2 control-label">题干</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="userName" name="userName"
                                           value="${ques.question}"
                                           placeholder="请输入用户名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="idCardNo" class="col-sm-2 control-label">身份证号码</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="idCardNo" name="idCardNo"
                                           value="${user.idCardNo}"
                                           placeholder="请输入工作">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mobile" class="col-sm-2 control-label">手机</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="mobile" name="mobile"
                                           value="${user.mobile}"
                                           placeholder="请输入经理">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="homeTel" class="col-sm-2 control-label">家庭电话</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="homeTel" name="homeTel"
                                           value="${user.homeTel}"
                                           placeholder="请输入奖金">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="homeAddr" class="col-sm-2 control-label">家庭地址</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="homeAddr" name="homeAddr"
                                           value="${user.homeAddr}"
                                           placeholder="请输入工资">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="schAddr" class="col-sm-2 control-label">学校地址</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="schAddr" name="schAddr"
                                           value="${user.schAddr}"
                                           placeholder="请输入奖金">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="qq" class="col-sm-2 control-label">QQ</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="qq" name="qq" value="${user.qq}"
                                           placeholder="请输入奖金">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">电子邮箱</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="email" name="email"
                                           value="${user.email}"
                                           placeholder="请输入奖金">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="gender" class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="gender" name="gender"
                                           value="${user.gender}"
                                           placeholder="请输入奖金">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthday" class="col-sm-2 control-label">出生日期</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="birthday" name="birthday"
                                           value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"
                                    >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nationPlace" class="col-sm-2 control-label">籍贯</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="nationPlace" name="nationPlace"
                                           value="${user.nationPlace}"
                                           placeholder="请输入奖金">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="marjor" class="col-sm-2 control-label">专业</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="marjor" name="marjor"
                                           value="${user.marjor}"
                                           placeholder="请输入奖金">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="eduBackground" class="col-sm-2 control-label">最高学历</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="eduBackground" name="eduBackground"
                                           value="${user.eduBackground}"
                                           placeholder="请输入奖金">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="graduateSchool" class="col-sm-2 control-label">毕业院校</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="graduateSchool" name="graduateSchool"
                                           value="${user.graduateSchool}"
                                           placeholder="请输入奖金">
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

            $.post('user/update', data, function (json) {
                $('#tr_' + $('#id').val() + ' td:eq(1)').text($('#userName').val());
                $('#tr_' + $('#id').val() + ' td:eq(2)').text($('#idCardNo').val());
                $('#tr_' + $('#id').val() + ' td:eq(3)').text($('#marjor').val());
                $('#tr_' + $('#id').val() + ' td:eq(4)').text($('#eduBackground').val());
                $('#tr_' + $('#id').val() + ' td:eq(5)').text($('#mobile').val());
                $('#tr_' + $('#id').val() + ' td:eq(6)').text($('#qq').val());
                $('#tr_' + $('#id').val() + ' td:eq(7)').text($('#graduateSchool').val());

                if (json.actionFlag) {
                    $('#myModal').modal('hide');
                }
            }, 'json');
            // }
        });
    })
</script>