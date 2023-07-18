<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		.student {
			margin-top: 150px;
		}

		a {
			display: inline-block;
			text-decoration: none;
			border-radius: 5px;
			margin: 10px 20px;
			width: 100px;
			height: 30px;
			line-height: 30px;
			background-color: skyblue;
			color: #fff;
		}
	</style>
</head>

<body>

<body style="text-align: center;">
<div class="student">
	<c:choose>
		<c:when test="${sessionScope.user==null }">
			<a href="${pageContext.request.contextPath }/Login.jsp">用户登录</a>
		</c:when>
		<c:otherwise>
			<c:if test="${sessionScope.user.getIdentity() == 'student' }">
				<h2>学生操作界面</h2>
				欢迎 ${sessionScope.user.username }!
				<div>
					<a href="${pageContext.request.contextPath }/FindScore.jsp">查询  &nbsp; 成绩</a>
				</div>
				<br/>
				<a href="${pageContext.request.contextPath }/LogoutServlet">注销</a>
			</c:if>
			<c:if test="${sessionScope.user.identity == 'admin'}">
				<div>你无权访问！！！</div>
				<a href="${pageContext.request.contextPath }/Login.jsp">用户登录</a>
			</c:if>
		</c:otherwise>
	</c:choose>
</div>
</body>
</body>

</html>