<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>Danh sách sản phẩm</title>
  <style>
    table { width: 80%; margin: auto; border-collapse: collapse; font-family: Arial; }
    th, td { border: 1px solid black; padding: 10px; text-align: center; }
    th { background-color: #f2f2f2; }
    h2 { text-align: center; }
  </style>
</head>
<body>
  <h2><b>Danh sách sản phẩm</b></h2>
  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>Product Name</th>
      <th>Price</th>
      <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${products}">
      <tr>
        <td>${p.id}</td>
        <td>${p.name}</td>
        <td>
          <c:choose>
            <c:when test="${empty p.price}">
              sản phẩm này chưa có thông tin giá
            </c:when>
            <c:otherwise>
              ${p.price}
            </c:otherwise>
          </c:choose>
        </td>
        <td>${p.description}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</body>
</html>