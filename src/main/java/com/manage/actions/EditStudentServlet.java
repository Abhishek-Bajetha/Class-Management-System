package com.manage.actions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddStudentServlet")
public class EditStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("studentEmail");
        String name = req.getParameter("studentName");

        try {
            PrintWriter out = resp.getWriter();
            out.println("<h1>Hello this Page is add to new Student</h1>");
            out.println("<p>"+email+"</p>");
            out.println("<p>"+name+"</p>");
        } catch (IOException e) {
            System.out.println("************************************");
            System.out.println(e);
            System.out.println("************************************");
        }

    }
}
