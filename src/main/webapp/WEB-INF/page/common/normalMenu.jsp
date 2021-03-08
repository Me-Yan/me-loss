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
            <a href="${pageContext.request.contextPath}/front/application/listClaim">待认领列表</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/front/application/listBelong">我的认领</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/front/application/listPublish">我的报失</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/front/application/add">发布</a>
        </li>
    </ul>
</div>