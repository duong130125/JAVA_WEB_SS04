<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>Đặt vé xem phim</title>
  <style>
    .seat {
      width: 40px;
      height: 40px;
      margin: 3px;
      background-color: #e0e0e0;
      border: 1px solid #ccc;
      text-align: center;
      cursor: pointer;
    }

    .booked {
      background-color: black;
      color: white;
      cursor: not-allowed;
    }

    .selected {
      background-color: blue;
      color: white;
    }

    .seat-container {
      display: flex;
      flex-wrap: wrap;
      max-width: 500px;
    }

    .seat-wrapper {
      display: inline-block;
    }
  </style>
</head>
<body>
<h2>Danh sách ghế phòng chiếu số 10</h2>

<form method="get">
  <div class="seat-container">
    <c:forEach var="seat" items="${seats}">
      <c:choose>
        <c:when test="${seat.booked}">
          <div class="seat booked seat-wrapper">${seat.name}</div>
        </c:when>
        <c:otherwise>
          <div class="seat-wrapper">
            <input type="checkbox" name="selectedSeats" value="${seat.code}" hidden />
            <button type="button" class="seat" onclick="toggleSeat(this)">${seat.name}</button>
          </div>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </div>
  <br/>
  <input type="submit" value="Thanh toán" />
</form>

<script>
  function toggleSeat(button) {
    const wrapper = button.parentElement;
    const checkbox = wrapper.querySelector('input[type="checkbox"]');
    checkbox.checked = !checkbox.checked;
    button.classList.toggle("selected", checkbox.checked);
  }
</script>

<c:if test="${not empty param.selectedSeats}">
  <%
    String[] selectedSeats = request.getParameterValues("selectedSeats");
    double total = 0;
    if (selectedSeats != null && selectedSeats.length > 0) {
      total = selectedSeats.length * 50000;
  %>
  <p>Tổng số tiền phải thanh toán của bạn là : <strong><%= total %></strong></p>
  <%
  } else {
  %>
  <p style="color:red;">Vui lòng chọn ghế trước khi thanh toán.</p>
  <%
    }
  %>
</c:if>
</body>
</html>
