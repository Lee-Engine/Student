<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login&registered.css">
</head>
<body>

<script type ="text/javascript">
    function refresh() {
        loginForm.imgValidate.src="${pageContext.request.contextPath}/checkCode?id="+Math.random();
    }
</script >
<header>
    <nav>
        <ul>
            <a href="${pageContext.request.contextPath}/login/signin.jsp"><li>登录</li></a>
            <a href="${pageContext.request.contextPath}/login/Registered.jsp"><li>注册</li></a>
        </ul>
    </nav>
</header>
<main>
    <div class="container">
        <img class="login_bg" src="${pageContext.request.contextPath}/images/login.png">
        <form name="loginForm" class="form" action="${pageContext.request.contextPath}/LoginServlet" method="post">
            <h3>学生信息管理系统</h3>
            <!-- 出错显示的信息框 -->
            <div class="alert alert-warning alert-dismissible" role="alert">
                <strong style="color: red">${login_msg}</strong>
            </div>
            <input type="text" autofocus="autofocus" name="username" value placeholder="用户名" required="required">
            <input type="password" name="password" value placeholder="密码" required="required">
            <input type="text" name="code" size="10"value placeholder="验证码" >
            <img  name="imgValidate" border=0 src="${pageContext.request.contextPath}/checkCode" onclick="refresh()"><br>
            <a id="other" href="${pageContext.request.contextPath}/login/FindPassword.jsp">忘记密码</a>

            <input id="submit" type="submit" onclick="return check()" value="登录" id="Button">
        </form>

    </div>
</main>
</body>
</html>
