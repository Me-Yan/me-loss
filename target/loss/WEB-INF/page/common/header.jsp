<%@ page import="com.me.outer.entity.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="web-header">
    <div class="header-content">
        <div class="system-name">失物招领管理系统</div>
        <div class="user-action">

            <%
                Object object = session.getAttribute("user");
                if (object==null) {
            %>

            <a href="${pageContext.request.contextPath}/user/register">注册</a>

            <%
                } else {
                    String authority = ((UserDTO) session.getAttribute("user")).getType();
                    if (Constant.USER_AUTHORITY.SUPER.equals(authority)) {
            %>

                        <div class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user fa-fw"></i>&nbsp;&nbsp;<%=((UserDTO)session.getAttribute("user")).getUsername()%>
                            </a>
                            <a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i>退出</a>
                        </div>

            <%
                    }
                }

            %>

        </div>
        <div class="clearfix"></div>
    </div>
</div>