package com.example.session_04.BT09;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "BookingServlet", value = "/BookingServlet")
public class BookingServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Seat> seats = new ArrayList<>();

        String[] rows = {"A", "B", "C", "D", "E"};
        for (String row : rows) {
            for (int i = 1; i <= 10; i++) {
                Seat seat = new Seat();
                seat.setCode(row + i);
                seat.setName(row + i);
                seat.setPrice(50000);
                seat.setBooked(false); // hoặc logic kiểm tra từ DB
                seats.add(seat);
            }
        }

        request.setAttribute("seats", seats);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }

    public void destroy() {
    }
}