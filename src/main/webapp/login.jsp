<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Đăng Nhập</title>
</head>
<body>
    <h1>Đăng Nhập</h1>
    <form method="post">
        Username: <input type="text" name="username" value="${param.username}" /><br/><br/>
        Password: <input type="password" name="password" /><br/><br/>
        <input type="submit" value="Đăng Nhập" />
    </form>

    <c:if test="${not empty param.username}">
        <c:choose>
            <c:when test="${param.username == 'admin' && param.password == '123456'}">
                <h2>Đăng nhập thành công</h2>
                <p>Xin chào <strong>${param.username}</strong>!</p>
            </c:when>
            <c:otherwise>
                <h2>Đăng nhập thất bại</h2>
                <p>username hoặc mật khẩu sai</p>
            </c:otherwise>
        </c:choose>
    </c:if>
</body>
</html>
