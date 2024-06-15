package com.example.webapp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

    private final String username = "admin"; // Hardcoded username
    private final String password = "secret"; // Hardcoded password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String passwordId = request.getParameter("password");

        // Simple validation with hardcoded credentials
        if (username.equals(userId) && password.equals(passwordId)) {
            request.getSession().setAttribute("userId", userId);
            response.sendRedirect("welcome"); // Redirect to WelcomeServlet
        } else {
            response.getWriter().write("Invalid user ID or password.");
        }
    }
}
