package com.manage.actions;

import com.manage.db.DB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/NextClass")
public class ScheduleClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String className = req.getParameter("classStandard");
        String classCode = req.getParameter("classCode");
        String teacherId = (String) session.getAttribute("teacherId");

        try {
            String query = "INSERT INTO classes (classname ,classcode ,detail ,teacherid) VALUES (?,?,?,?);";
            Connection connection = DB.createConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, className);
            preparedStatement.setString(2, classCode);
            preparedStatement.setString(4, teacherId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("************************************");
            System.out.println(e);
            System.out.println("************************************");
        }
    }
}
