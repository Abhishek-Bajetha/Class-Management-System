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


@WebServlet("/AddBatch")
public class AddBatchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();

        String className = req.getParameter("className");
        String classCode = req.getParameter("classCode");
        String classDetail = req.getParameter("classDescription");
        String teacherId = (String) session.getAttribute("teacherId");

        try {

            String query = "INSERT INTO classes (classname ,classcode ,detail ,teacherid) VALUES (?,?,?,?);";
            Connection connection = DB.createConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, className);
            preparedStatement.setString(2, classCode);
            preparedStatement.setString(3, classDetail);
            preparedStatement.setString(4, teacherId);
            preparedStatement.executeUpdate();

            resp.sendRedirect("success.jsp");

        } catch (Exception e) {
            resp.sendRedirect("error_message.jsp");
        }
    }
}
