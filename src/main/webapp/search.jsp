<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tìm kiếm sản phẩm</title>
</head>
<body>
<h2>Tìm kiếm sản phẩm theo ID</h2>
<form method="get" action="search">
    <label>Nhập ID:</label>
    <input type="number" name="id" required />
    <button type="submit">Tìm kiếm</button>
</form>

<c:choose>
    <c:when test="${not empty product}">
        <h3>Thông tin sản phẩm:</h3>
        <ul>
            <li>ID: ${product.id}</li>
            <li>Tên: ${product.name}</li>
            <li>Giá:
                <c:choose>
                    <c:when test="${product.price == null}">
                        sản phẩm này chưa có thông tin giá
                    </c:when>
                    <c:otherwise>
                        ${product.price}
                    </c:otherwise>
                </c:choose>
            </li>
            <li>Mô tả: ${product.description}</li>
        </ul>
    </c:when>
    <c:when test="${param.id != null}">
        <p style="color: red;">Sản phẩm không tìm thấy</p>
    </c:when>
</c:choose>

</body>
</html>