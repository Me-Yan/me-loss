<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>失物招领详情</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>失物招领详情</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">标题 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${application.title}</span>
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
                                <span class="free-text">${application.type}</span>
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
                                <span class="free-text">${application.address}</span>
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
                                <span class="free-text">${application.content}</span>
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
                                        <c:when test="${application.applicationStatus.status eq 'Pending'}">待认领</c:when>
                                        <c:when test="${application.applicationStatus.status eq 'Processing'}">待审核</c:when>
                                        <c:when test="${application.applicationStatus.status eq 'Finished'}">已认领</c:when>
                                    </c:choose>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="action-btn-group">
    <button type="button" class="btn btn-default" onclick="window.location.href='<%= request.getContextPath()%>/front/application/listAllClaim'">返回</button>
</div>

</body>
</html>
