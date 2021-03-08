<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>认领</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>认领</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">标题 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${applicationForm.title}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">物品类型 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${applicationForm.type}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">遗失位置 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${applicationForm.address}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-3 col-md-offset-2 control-label text-left">描述 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${applicationForm.content}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-3 col-md-offset-2 control-label text-left">状态 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">
                                    <c:choose>
                                        <c:when test="${applicationForm.applicationStatus.status eq 'Pending'}">待认领</c:when>
                                        <c:when test="${applicationForm.applicationStatus.status eq 'Processing'}">待审核</c:when>
                                        <c:when test="${applicationForm.applicationStatus.status eq 'Finished'}">已认领</c:when>
                                    </c:choose>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-content-section">
        <div class="page-section-title"><span>说明</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <form:form action="${pageContext.request.contextPath}/front/application/confirmClaim" id="applicationForm" method="post" modelAttribute="applicationForm">
                <form:hidden path="applicationId"/>
                <form:hidden path="statusRef" />

                <div class="row">
                    <div class="col-xs-12 form-group-field">
                        <label class="col-sm-3 col-md-3 col-md-offset-2 control-label text-left">说明 <span class="colon-label">:</span><span class="field-star">*</span></label>
                        <div class="col-sm-8 col-md-6">
                            <div class="display-table">
                                <div class="display-cell colon-cell">:</div>
                                <div class="display-cell">
                                    <form:textarea path="applicationStatus.description" class="form-control field-input" cssStyle="height: 100px;resize: none" id="description" maxlength="250"/>
                                    <span class="text-error hide" name="applicationStatus.descriptionMessage"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<div class="action-btn-group">
    <button type="button" class="btn btn-primary" id="btnSubmit">确认</button>
    <button type="button" class="btn btn-default" onclick="window.location.href='<%= request.getContextPath()%>/front/application/listClaim'">返回</button>
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
                'applicationStatus.description':{
                    message: '请填写理由。',
                    validators: {
                        notEmpty: {
                            message: '请填写理由。'
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
