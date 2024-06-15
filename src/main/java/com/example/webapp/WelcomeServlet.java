package com.example.webapp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WelcomeServlet extends HttpServlet {

    private final List<Student> students = getStudentList(); // Hardcoded student data

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = (String) request.getSession().getAttribute("userId");

        if (userId != null) {
            request.setAttribute("students", students);
            request.getRequestDispatcher("/welcome.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        }
    }

    private List<Student> getStudentList() {
        List<Student> students = new ArrayList<>();
        students.add(new Student("Dep 1", "S1", 35));
        students.add(new Student("Dep 1", "S2", 70));
        students.add(new Student("Dep 1", "S3", 60));
        students.add(new Student("Dep 1", "S4", 90));
        students.add(new Student("Dep 2", "S5", 30));
        students.add(new Student("Dep 3", "S6", 32));
        students.add(new Student("Dep 3", "S7", 70));
        students.add(new Student("Dep 3", "S8", 20));
        return students;
    }
}
