<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/downlist/downlist.css">
<script src="${pageContext.request.contextPath}/resources/scripts/downlist/google.js"></script>
<script>
    $(function () {
        $(".downlist-content").maps();
        $(".venus-menu .showhide .title").html("菜单");
    });
</script>

<div class="downlist-content">
    <ul class="venus-menu">
        <li>
            <a href="javascript:void(0);">失物招领管理</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/back/application/listClaim">失物招领列表</a></li>
                <li><a href="${pageContext.request.contextPath}/back/application/listProcess">审核认领</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0);">失物报失管理</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/back/application/add">发布</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0);">用户信息管理</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/user/list">用户列表</a></li>
                <li><a href="${pageContext.request.contextPath}/user/add">新增用户</a></li>
            </ul>
        </li>
    </ul>
</div>