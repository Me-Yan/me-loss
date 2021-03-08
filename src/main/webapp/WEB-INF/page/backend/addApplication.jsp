<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>进行报失</title>
</head>
<body>

<form:form action="${pageContext.request.contextPath}/back/application/confirm" modelAttribute="applicationForm" id="applicationForm" method="post">
    <div class="page-content">
        <div class="page-content-section">
            <div class="page-section-title"><span>失物报失</span></div>
            <div class="line-dashed"></div>
            <div class="page-section-body">
                <div class="row">
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-2 col-md-offset-2 control-label text-left">标题 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="title" class="form-control field-input" id="title" maxlength="50" />
                                    <span class="text-error hide" name="titleMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-2 col-md-offset-2 control-label text-left">物品类型 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="type" class="form-control field-input" id="type" maxlength="20" />
                                    <span class="text-error hide" name="typeMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-4 col-md-2 col-md-offset-2 control-label text-left">遗失位置 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:input path="address" class="form-control field-input" id="address" maxlength="50" />
                                    <span class="text-error hide" name="addressMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-2 col-md-offset-2 control-label text-left">描述 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:textarea path="content" class="form-control field-input" id="content" maxlength="250" cssStyle="height: 100px;resize: none" />
                                    <span class="text-error hide" name="contentMessage"></span>
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
    <button type="button" class="btn btn-default" onclick="window.location.href='<%= request.getContextPath()%>/home'">取消</button>
</div>

<script>
    $(function () {
        initValidation();
    });

    $("#btnSubmit").on("click", function () {
        var validation = $("#applicationForm").data("formValidation");
        validation.validate();
        if (validation.isValid()) {
            var form = document.getElementById("applicationForm");
            form.submit();
        }
    });

    function initValidation() {
        $("#applicationForm").formValidation({
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
                    var messageNode  = $('#applicationForm').find($("span[name='"+messageName+"']"));
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
                title:{
                    message: '请输入失物招领消息标题。',
                    validators: {
                        notEmpty: {
                            message: '请输入失物招领标题。'
                        }
                    }
                },
                type:{
                    message: '请输入物品类型。',
                    validators: {
                        notEmpty: {
                            message: '请输入物品类型。'
                        }
                    }
                },
                address:{
                    message: '请输入遗失位置。',
                    validators: {
                        notEmpty: {
                            message: '请输入遗失位置。'
                        }
                    }
                },
                content:{
                    message: '请简要描述遗失物品。',
                    validators: {
                        notEmpty: {
                            message: '请简要描述遗失物品。'
                        }
                    }
                }
            }
        }).on('err.field.fv', function(e, data) {
            $("#applicationForm").find("i.form-control-feedback").remove();

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
            $("#applicationForm").find("."+data.field+"Message").css("display","none");
            $("#applicationForm").find("."+data.field+"Message").addClass("hide");

            //remove checkbox feedback icon
            $("#applicationForm").find("i.form-control-feedback").remove();
        });
    }
</script>
</body>
</html>
