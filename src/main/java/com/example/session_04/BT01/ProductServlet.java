package com.example.session_04.BT01;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Product> products = new ArrayList<>();
        products.add(new Product(1, "iPhone 16 PROMAX", 999.99, "Sản phẩm mới nhất đến từ thương hiệu Apple"));
        products.add(new Product(2, "Samsung Galaxy S25 Ultra", 899.99, "Sản phẩm có nhiều công nghệ mới của Samsung Galaxy"));
        products.add(new Product(3, "Vivo V200S", 799.99, "Sản phẩm đến từ tương lai"));

        request.setAttribute("productList", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}