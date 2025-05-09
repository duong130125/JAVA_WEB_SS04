package com.example.session_04.BT06;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "StudentServlet", value = "/StudentServlet")
public class StudentServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> ds = new ArrayList<>();
        ds.add(new Student(1, "An", 20, 8.2));
        ds.add(new Student(2, "Bình", 21, 6.5));
        ds.add(new Student(3, "Chi", 19, 7.5));
        ds.add(new Student(4, "Dũng", 22, 5.8));
        ds.add(new Student(5, "Em", 20, 9.0));

        request.setAttribute("studentList", ds);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}