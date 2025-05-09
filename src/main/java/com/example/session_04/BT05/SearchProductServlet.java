package com.example.session_04.BT05;

import com.example.session_04.BT04.Product;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "SearchProductServlet", value = "/search")
public class SearchProductServlet extends HttpServlet {
    private List<Product> productList;

    public void init() throws ServletException {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Máy bay quân sự", 100000.0, "Máy bay chiến lực quân sự"));
        productList.add(new Product(2, "Tên lửa đạn đạo", 30000.0, "Tên lửa xuyên lục địa sức mạnh hủy diệt"));
        productList.add(new Product(3, "Súng trường Ak47", 5000.0, "Khẩu súng với sức mạnh uy lực"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        Product found = null;

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                for (Product p : productList) {
                    if (p.getId() == id) {
                        found = p;
                        break;
                    }
                }
            } catch (NumberFormatException e) {
                // Ignore invalid input
            }
        }

        request.setAttribute("product", found);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request, response);
    }
}