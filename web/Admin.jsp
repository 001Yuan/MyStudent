<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.User"%>
<%--<%@ page isELIgnored="false"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
						"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>学生成绩管理系统</title>
	<style>
		body {
			background: url(dist/images/in_bg.png);
			background-size: cover;
		}
		a {
			text-decoration: none;
			display: inline-block;
			width: 150px;
			height: 30px;
			line-height: 30px;
			border-radius: 8px;
			margin: 5px;
			color: #fff;
			background-color: skyblue;
		}
		a:hover {
			background-color: rgb(104, 101, 101);
		}

		span {
			display: inline-block;
			margin-bottom: 30px;
		}

		h2 {
			margin-bottom: 50px;
		}

		.admin {
			margin-top: 150px;
		}
	</style>
</head>

<body style="text-align: center;">
<div class="admin">
	<c:choose>
		<c:when test="${sessionScope.user==null }">
			<a href="${pageContext.request.contextPath }/Login.jsp">用户登录</a>
		</c:when>
		<c:otherwise>
			<c:if test="${sessionScope.user.identity == 'admin'}">
				<h2>管理员操作界面</h2>
				<span>欢迎 ${sessionScope.user.username }!</span>
				<div>
					<a href="${pageContext.request.contextPath }/FindScore.jsp">查询成绩</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath }/AddScore.jsp">录入成绩</a>
				</div>
				<div>
<%--						${sessionScope.user.username}--%>
					<a href="${pageContext.request.contextPath }/UpdDelScore.jsp">修改删除成绩</a>
<%--					<form action="${pageContext.request.contextPath }/UpdDelScore.jsp" method="post">--%>
<%--						<input type="hidden" name="tcId" value="${sessionScope.user.username}">--%>
<%--						<input type="submit" value="修改删除成绩">--%>
<%--					</form>--%>
				</div>
				<br/>
				<a href="${pageContext.request.contextPath }/LogoutServlet">注销</a>
			</c:if>
			<c:if test="${sessionScope.user.identity == 'student'}">
				<div>你无权访问！！！</div>
				<a href="${pageContext.request.contextPath }/Login.jsp">用户登录</a>
			</c:if>
		</c:otherwise>
	</c:choose>
</div>
</body>

</html>