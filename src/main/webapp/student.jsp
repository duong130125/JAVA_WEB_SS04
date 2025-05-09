<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh Sách Sinh Viên</title>
</head>
<body>
    <h2>Danh Sách Sinh Viên</h2>

    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Tuổi</th>
            <th>Điểm TB</th>
        </tr>
        <c:set var="count" value="0" />
        <c:forEach var="sv" items="${studentList}">
            <tr>
                <td>${sv.id}</td>
                <td>${sv.name}</td>
                <td>${sv.age}</td>
                <td>${sv.avg}</td>
            </tr>
            <c:if test="${sv.avg > 7.0}">
                <c:set var="count" value="${count + 1}" />
            </c:if>
        </c:forEach>
    </table>

    <h3>Số sinh viên có điểm TB > 7.0: ${count}</h3>
</body>
</html>