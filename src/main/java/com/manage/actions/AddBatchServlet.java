package com.manage.actions;

import com.manage.db.DB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/AddBatch")
public class AddBatchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ;
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

            PrintWriter out = resp.getWriter();
            out.println("<h1>New Batch is created</h1>");
            out.println(className);
            out.println(classCode);
        } catch (IOException | SQLException e) {
            System.out.println("************************************");
            System.out.println(e);
            System.out.println("************************************");
        }
    }
}
