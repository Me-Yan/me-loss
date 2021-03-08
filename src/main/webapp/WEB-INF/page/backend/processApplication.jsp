<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>认领审核</title>
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
            </div>
        </div>
    </div>

    <div class="page-content-section">
        <div class="page-section-title"><span>认领用户留言</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">认领用户留言 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${application.applicationStatus.description}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-content-section">
        <div class="page-section-title"><span>认领用户信息</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">用户名 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${user.username}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">性别 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${user.sex}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-4 col-md-3 col-md-offset-2 control-label text-left">年龄 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${user.age}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-3 col-md-offset-2 control-label text-left">邮箱 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${user.email}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-3 col-md-offset-2 control-label text-left">联系电话 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${user.phone}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 form-group-field">
                    <label class="col-sm-3 col-md-3 col-md-offset-2 control-label text-left">简介 <span class="colon-label">:</span><span class="field-star">*</span></label>
                    <div class="col-sm-8 col-md-6">
                        <div class="display-table">
                            <div class="display-cell colon-cell">:</div>
                            <div class="display-cell">
                                <span class="free-text">${user.description}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="action-btn-group">
    <button type="button" class="btn btn-primary" onclick="window.location.href='<%= request.getContextPath()%>/back/application/approve/${application.applicationId}'">同意</button>
    <button type="button" class="btn btn-danger" onclick="window.location.href='<%= request.getContextPath()%>/back/application/reject/${application.applicationId}'">拒绝</button>
    <button type="button" class="btn btn-default" onclick="window.location.href='<%= request.getContextPath()%>/back/application/listProcess'">返回</button>
</div>

<br><br>
</body>
</html>
