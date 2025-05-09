package com.example.session_04.BT04;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Product_Servlet", value = "/Product_Servlet")
public class Product_Servlet extends HttpServlet {
    public void init() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> productList = new ArrayList<>();
        productList.add(new Product(1, "Sản phẩm 01", null, "Mô tả sp 01")); // giá null
        productList.add(new Product(2, "Sản phẩm 02", 3000.0, "Mô tả sp 02"));
        productList.add(new Product(3, "Sản phẩm 03", 5000.0, "Mô tả sp 03"));

        request.setAttribute("products", productList);
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }

    public void destroy() {
    }
}