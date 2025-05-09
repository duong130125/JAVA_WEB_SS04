<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.util.Map" %>

<%
    // Tạo danh sách tĩnh doanh thu
    List<Map<String, Object>> revenues = new ArrayList<>();

    Map<String, Object> r1 = new HashMap<>();
    r1.put("month", "Tháng 1");
    r1.put("amount", 3000);
    revenues.add(r1);

    Map<String, Object> r2 = new HashMap<>();
    r2.put("month", "Tháng 2");
    r2.put("amount", 5000);
    revenues.add(r2);

    Map<String, Object> r3 = new HashMap<>();
    r3.put("month", "Tháng 3");
    r3.put("amount", 2500);
    revenues.add(r3);

    request.setAttribute("revenues", revenues);
%>

<html>
<head>
    <title>Thống kê Doanh thu theo Tháng</title>
</head>
<body>
<h2>Danh sách doanh thu</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>Tháng</th>
        <th>Doanh thu ($)</th>
    </tr>

    <c:set var="total" value="0" />
    <c:forEach var="r" items="${revenues}">
        <tr>
            <td>${r.month}</td>
            <td>${r.amount} $</td>
        </tr>
        <c:set var="total" value="${total + r.amount}" />
    </c:forEach>

    <tr>
        <th>Tổng</th>
        <th>${total} $</th>
    </tr>
</table>

<br/>

<c:choose>
    <c:when test="${total > 10000}">
        <p style="color: green;">Tổng doanh thu vượt mục tiêu!</p>
    </c:when>
    <c:otherwise>
        <p style="color: red;">Tổng doanh thu chưa đạt mục tiêu.</p>
    </c:otherwise>
</c:choose>
</body>
</html>
