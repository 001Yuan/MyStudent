<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.Grade"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
						"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生成绩管理系统-查询成绩</title>
	<style>
		body {
			background: url(dist/images/in_bg.png);
			background-size: cover;
		}
		.tit {
			position: relative;
			margin: 150px 0 30px;
			display: inline-block;
		}

		table {
			border: none;
		}

		span {
			position: absolute;
			right: -100px;
			bottom: 16px;
		}

		tr{
			background-color: #eee;
		}

		td {
			border: none;
		}

		input {
			outline: none;
		}

		.btn {
			outline: none;
			border: none;
			border-radius: 5px;
			width: 50px;
			height: 30px;
			margin: 10px 20px;
			background-color: skyblue;
			color: #fff;
			cursor: pointer
		}
		.btn:hover {
			background-color: rgb(104, 101, 101);
		}
	</style>
</head>
<body  style="text-align: center;">
	<c:choose>
		<c:when test="${sessionScope.user==null }">
			<a href="${pageContext.request.contextPath }/Login.jsp">用户登录</a>
		</c:when>
		<c:otherwise>
			<div class="tit">
				<form action="${pageContext.request.contextPath }/FindScoreServlet" method = "post">
				   	<input name="func" type="hidden" value="show">成绩查询方式：学号查询<br/>
				   	<c:if test="${sessionScope.user.identity == 'admin'}">
					    <input name="id" type="text">${errerMsg}
				    </c:if>
				    <input type="submit" value="查询" class="btn">
				</form>
			</div><br/>
		     <table align="center" cellpadding="15" cellspacing="0" border="1">
		    <%
		    ArrayList<Grade> list=(ArrayList<Grade>) session.getAttribute("grade"); 
		    if(list!=null&&list.size()!=0){%>
		        <tr>
		     	<td colspan="6" align="center">学号为<%=list.get(0).getStuId() %>的学生成绩如下</td>
		     	</tr>
		    <tr>
		         <td>学生学号</td>
		         <td>学生姓名</td>
		         <td>课程编号</td>
		         <td>教师编号</td>
		         <td>课程分数</td>
		         <td>班级编号</td>
		     </tr>
		    <%
		            for(int j=0;j<list.size();j++){%>
		            <tr>
		            <td><%=list.get(j).getStuId()%></td>
		            <td><%=list.get(j).getStuName()%></td>
		            <td><%=list.get(j).getCourseId()%></td>
		            <td><%=list.get(j).getTcId()%></td>
		            <td><%=list.get(j).getCourseGrade()%></td>
		            <td><%=list.get(j).getClassId()%></td>
		            </tr>
					 <% }}%>
			</table>
		    <%@ include file="Foot.jsp" %>
   		 </c:otherwise>
    </c:choose>
</body>
</html>