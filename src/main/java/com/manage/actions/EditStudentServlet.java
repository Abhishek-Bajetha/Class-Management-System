package com.manage.actions;

import com.manage.db.DB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddStudentServlet")
public class EditStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        HttpSession session = req.getSession();
        String classCode = req.getParameter("classStandard");
        String email = req.getParameter("studentEmail");
        String name = req.getParameter("studentName");
        String teacherId = (String) session.getAttribute("teacherId");

        try {
            String query = "UPDATE users SET institute = ? WHERE email = ?;";
            Connection connection = DB.createConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, classCode + "_" + teacherId);
            preparedStatement.setString(2, email);
            preparedStatement.executeUpdate();

            PrintWriter out = resp.getWriter();
            out.println("<h1>Hello this Page is add to new Student</h1>");
            out.println("<p>" + classCode + "</p></br>");
            out.println("<p>" + email + "</p></br>");
            out.println("<p>" + name + "</p>");
        } catch (SQLException e) {
            System.out.println("************************************");
            System.out.println(e);
            System.out.println("************************************");
        }
    }
}
