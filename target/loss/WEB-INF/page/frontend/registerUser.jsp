<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>注册</title>
</head>
<body>

<form:form action="${pageContext.request.contextPath}/user/confirm" modelAttribute="userForm" id="userForm" method="post">
    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-title"><span>注册</span></div>
            <div class="line-dashed"></div>
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-2 col-md-offset-2 control-label text-left">用户类型 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:select path="type" id="type" class="form-control field-input">
                                        <option value="N" selected>普通用户</option>
                                    </form:select>
                                    <span class="text-error hide" name="sexMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-2 col-md-offset-2 control-label text-left">用户名 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="username" class="form-control field-input" id="username" maxlength="20"/>
                                    <span class="text-error hide" name="usernameMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-2 col-md-offset-2 control-label text-left">密码 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="password" class="form-control field-input" id="password" maxlength="20" />
                                    <span class="text-error hide" name="passwordMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-2 col-md-offset-2 control-label text-left">性别 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:select path="sex" id="sex" class="form-control field-input">
                                        <option value="保密">- 保密 -</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </form:select>
                                    <span class="text-error hide" name="sexMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-md-offset-2 control-label text-left">年龄 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="age" class="form-control field-input" id="age" />
                                    <span class="text-error hide" name="ageMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-md-offset-2 control-label text-left">邮箱 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="email" class="form-control field-input" id="email" maxlength="200" />
                                    <span class="text-error hide" name="emailMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-md-offset-2 control-label text-left">联系电话 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="phone" class="form-control field-input" id="phone" maxlength="11" />
                                    <span class="text-error hide" name="phoneMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-md-offset-2 control-label text-left">简介 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="description" class="form-control field-input" id="description" maxlength="200" />
                                    <span class="text-error hide" name="descriptionMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form:form>

<div class="action-btn-group">
    <button type="button" class="btn btn-primary" id="btnSubmit">提交</button>
    <button type="button" class="btn btn-default" onclick="window.location.href='<%= request.getContextPath()%>/user/list'">取消</button>
</div>

<script>
    $(function () {
        initValidation();
    });

    $("#btnSubmit").on("click", function () {
        var validation = $("#userForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            var form = document.getElementById("userForm");
            form.submit();
        }
    });

    function initValidation() {
        $("#userForm").formValidation({
            excluded: [':disabled'],
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            err: {
                container: function($field, validator) {
                    var messageName = $($field).attr("name")+"Message";
                    var messageNode  = $('#userForm').find($("span[name='"+messageName+"']"));
                    messageNode.addClass("has-error");
                    messageNode.removeClass("hide");
                    return messageNode;
                }
            },
            row: {
                valid: 'has-success',
                invalid: 'has-error',
                feedback: 'has-feedback'
            },
            icon: {
                valid: null,
                invalid: null,
                validating: null
            },
            fields: {
                type:{
                    message: '请选择用户类型。',
                    validators: {
                        notEmpty: {
                            message: '请选择用户类型。'
                        }
                    }
                },
                username:{
                    message: '请输入用户名。',
                    validators: {
                        notEmpty: {
                            message: '请输入用户名。'
                        }
                    }
                },
                password:{
                    message: '请输入密码。',
                    validators: {
                        notEmpty: {
                            message: '请输入密码。'
                        }
                    }
                },
                sex:{
                    message: '请选择性别。',
                    validators: {
                        notEmpty: {
                            message: '请选择性别。'
                        }
                    }
                },
                age:{
                    message: '请填写年龄。',
                    validators: {
                        notEmpty: {
                            message: '请填写年龄。'
                        },
                        callback: {
                            message: '请输入合理的年龄',
                            callback: function (value) {
                                if (value && value.trim()) {
                                    var age = parseInt(value);
                                    if (age<150) {
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }
                                return true;
                            }
                        }
                    }
                },
                email:{
                    message: '请输入邮箱。',
                    validators: {
                        notEmpty: {
                            message: '请输入邮箱。'
                        }
                    }
                },
                phone:{},
                description:{}
            }
        }).on('err.field.fv', function(e, data) {
            $("#userForm").find("i.form-control-feedback").remove();

            if($(data.element).is('select')) {
                $(data.element).next().addClass("has-error");
                $(data.element).next().removeClass("has-success");
            }
            else if($(data.element).is('textarea')) {
                $(data.element).parent().addClass("has-error");
                $(data.element).parent().removeClass("has-success");
            }
            else {
                $(data.element).addClass("has-error");
                $(data.element).removeClass("has-success");
            }
        }).on('success.field.fv', function(e, data) {
//            $("#btnUserSubmit").removeAttr("disabled");
            if($(data.element).is('select')) {
                $(data.element).next().removeClass("has-error");
                $(data.element).next().addClass("has-success");
            }
            else if($(data.element).is('textarea')) {
                $(data.element).parent().removeClass("has-error");
                $(data.element).parent().addClass("has-success");
            }
            else {
                $(data.element).removeClass("has-error");
                $(data.element).addClass("has-success");
            }
            $("#userForm").find("."+data.field+"Message").css("display","none");
            $("#userForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#userForm").find("i.form-control-feedback").remove();
        });
    }
</script>

</body>
</html>
