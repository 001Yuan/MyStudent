<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
						"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生成绩管理系统</title>
    <style>
        body {
            background: url(dist/images/background.png);
            background-size: cover;
        }

        .login {
            position: relative;
            height: 300px;
            width: 500px;
            text-align: center;
            margin: 150px auto;
            background: rgba(0, 0, 0, .3);
        }

        h3 {
            display: inline-block;
            margin-top: 30px;
        }

        table {
            border-color: transparent;
        }

        table tr:last-of-type input {
            outline: none;
            border: none;
            border-radius: 5px;
            width: 50px;
            height: 30px;
            margin: 10px 20px;
            background-color: skyblue;
            color: #fff;
            cursor: pointer;
        }

        table tr:last-of-type input:hover{
            background-color: rgb(104, 101, 101);
        }
        span {
            position: absolute;
            top: 95px;
            right: 30px;
        }
        input {
            outline: none;
        }
    </style>
    <script src="dist/js/common.js"></script>
</head>


<body>0
<div class="login">
    <h3>用户登录</h3>
    <form action="${pageContext.request.contextPath }/LoginServlet" method="post">
        <table border="1" cellpadding="0" cellspacing="15px" align="center">
            <tr>
                <td height="30" align="center">用户名</td>
                <td>
                    <input type="text" name="username" /></td>
                    <span>${errerMsg }</span>

            </tr>
            <tr>
                <td height="30" align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
                <td>
                    <input type="password" name="password" /></td>
            </tr>

            <tr>
                <td colspan="2"><input type="radio" name="identity" value="admin" />管理员(老师)
                    <input type="radio" name="identity" value="student" />学生
                </td>
            </tr>

            <tr>
                <td height="30" colspan="2" align="center">
                    <input type="submit" value="登陆"> &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="重置" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>

</html>