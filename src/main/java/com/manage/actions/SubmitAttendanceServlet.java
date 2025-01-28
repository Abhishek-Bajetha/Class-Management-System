package com.manage.actions;

import com.manage.db.DB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/SubmitAttendanceServlet")
public class SubmitAttendanceServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Connection connection = DB.createConnection();

            int count = Integer.parseInt(req.getParameter("count"));
            for (int i = 0; i < count; i++) {
                String attendance = req.getParameter("attendance" + i);
                String userid = attendance.substring(7);
                String present = attendance.substring(0, 7);
                System.out.println(userid);
                PreparedStatement preparedStatement;
                if (present.equals("present")) {
                    preparedStatement = connection.prepareStatement("update users set attendance = attendance + 1, totalclass = totalclass + 1 where userid = ?");
                } else {
                    preparedStatement = connection.prepareStatement("update users set totalclass = totalclass + 1 where userid = ?");
                }
                preparedStatement.setString(1, userid);
                preparedStatement.executeUpdate();
            }
            resp.sendRedirect("success.jsp");
        } catch (Exception e) {
            resp.sendRedirect("error_message.jsp");
        }
    }
}

