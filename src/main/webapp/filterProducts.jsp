<%@ page import="com.example.session_04.BT07.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    java.util.List<Product> products = new java.util.ArrayList<>();
    products.add(new Product(1, "Áo sơ mi", 150000));
    products.add(new Product(2, "Quần jeans", 300000));
    products.add(new Product(3, "Giày thể thao", 500000));
    products.add(new Product(4, "Balo", 200000));

    request.setAttribute("products", products);

    String minStr = request.getParameter("min");
    String maxStr = request.getParameter("max");

    Double min = null, max = null;
    try {
        if (minStr != null && !minStr.isEmpty()) min = Double.parseDouble(minStr);
        if (maxStr != null && !maxStr.isEmpty()) max = Double.parseDouble(maxStr);
    } catch (NumberFormatException e) {
        // Ignore invalid input
    }

    request.setAttribute("min", min);
    request.setAttribute("max", max);
%>

<html>
<head>
    <title>Lọc Sản Phẩm Theo Giá</title>
</head>
<body>
    <h2>Lọc sản phẩm theo khoảng giá</h2>
    <form method="get">
        Giá từ: <input type="text" name="min" value="${param.min}" />
        đến: <input type="text" name="max" value="${param.max}" />
        <button type="submit">Lọc</button>
    </form>

    <h3>Kết quả:</h3>
    <c:set var="found" value="false" />

    <ul>
        <c:forEach var="product" items="${products}">
            <c:if test="${(min == null || product.price >= min) && (max == null || product.price <= max)}">
                <li>
                        ${product.name} - ${product.price} VND
                    <c:set var="found" value="true" />
                </li>
            </c:if>
        </c:forEach>
    </ul>

    <c:if test="${!found}">
        <p><strong>Không có sản phẩm nào trong khoảng giá này.</strong></p>
    </c:if>
</body>
</html>