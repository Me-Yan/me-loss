<%@ page import="com.me.outer.constants.Constant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>失物招领列表</title>
</head>
<body>

<div class="page-content">
    <div class="page-content-section">
        <div class="page-section-title"><span>失物招领列表</span></div>
        <div class="line-dashed"></div>
        <div class="page-section-body">
            <div class="row">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table id="applicationTable" class="table table-hover table-striped table-condensed"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../commonModal.jsp"/>

<%-- 删除信息 --%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>确认删除该失物招领信息？</p>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <button type="button" class="btn btn-primary" id="btnDelete">确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script>
    var deleteId;
    $(function () {
        initTable();
    });

    function initTable() {
        $("#applicationTable").bootstrapTable({
            url: '${pageContext.request.contextPath}/back/application/listClaimData',
            method: 'POST',
            dataType: 'json',
            cache: false,
            contentType: "application/x-www-form-urlencoded",
            queryParams: {},
            pagination: true,
            pageNumber: 1,
            pageSize: 10,
            pageList: [10],
            sidePagination: 'client',
            uniqueId: 'applicationId',
            columns: [
                {
                    field: 'serialNo',
                    title: '#',
                    align: 'center',
                    valign: 'middle',
                    width:'10%'
                },
                {
                    field: 'title',
                    title: '标题',
                    align: 'center',
                    valign: 'middle',
                    width:'35%'
                },
                {
                    field: 'applicationStatus.status',
                    title: '状态',
                    align: 'center',
                    valign: 'middle',
                    width:'40%',
                    formatter: function (value, row, index) {
                        if ("<%=Constant.APPLICATION_STATUS.PENDING%>" === value) {
                            return "待认领";
                        } else if ("<%=Constant.APPLICATION_STATUS.PROCESSING%>" === value){
                            return "待审核";
                        } else if ("<%=Constant.APPLICATION_STATUS.FINISHED%>" === value) {
                            return "已认领";
                        }
                    }
                },
                {
                    field: '',
                    title: '操作',
                    align: 'center',
                    valign: 'middle',
                    width:'15%',
                    formatter: function (value, row, index) {
                        return '<div class="btn-group"><a class="btn btn-primary" href="${pageContext.request.contextPath}/back/application/detail/'+row.applicationId+'">详情</a><button type="button" class="btn btn-danger" onclick="deleteModal('+row.applicationId+')">删除</button></div>';
                    }
                }
            ]
        });
    }

    // 删除发布的信息
    function deleteModal(applicationId) {
        deleteId = applicationId;
        $("#deleteModal").modal("show");
    }
    $("#btnDelete").on("click", function () {
        $("#deleteModal").modal("hide");
        $("body").loading("请稍等。。。");
        $.ajax({
            url: "${pageContext.request.contextPath}/back/application/delete",
            type: "post",
            data: {
                applicationId: deleteId
            },
            success: function (result) {
                $("body").loading("hide");
                if (result.success) {
                    $("#tipContent").html("删除成功。");
                    $("#applicationTable").bootstrapTable("refresh");
                } else {
                    $("#tipContent").html("删除失败，请重新操作。");
                }
                $("#outcomeModal").modal("show");
            }
        });
    });

    var message = "${message}";
    if (message!=null && message != "") {
        $("#tipContent").html(message);
        $("#outcomeModal").modal("show");
    }
</script>

</body>
</html>
