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
        String classCode = req.getParameter("classStandard");
        String date = req.getParameter("eventDate");
        String time = req.getParameter("eventTime");
//        System.out.println(date + " " + time);
        try {

            String query = "UPDATE classes SET nextclass = ? WHERE classcode = ?;";
            Connection connection = DB.createConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, date + " " + time);
            preparedStatement.setString(2, classCode);
            preparedStatement.executeUpdate();
            resp.sendRedirect("success.jsp");

        } catch (SQLException e) {
            resp.sendRedirect("error_message.jsp");

        }
    }
}
