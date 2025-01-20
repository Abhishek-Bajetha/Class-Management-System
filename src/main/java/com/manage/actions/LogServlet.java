package com.manage.actions;

import com.manage.db.DB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Objects;

@WebServlet("/login")
public class LogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println(email + "\n" + password);

        try {
            PrintWriter printWriter = resp.getWriter();
            resp.setContentType("text / html");
            String query = "SELECT * FROM users WHERE email=? AND password=?;";
            Connection connection = DB.createConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            System.out.println(resultSet.getString("name"));
            System.out.println(resultSet.getString("role"));

            if (Objects.equals(resultSet.getString("role"), "teacher")) {
                HttpSession session = req.getSession();
                session.setAttribute("userName", resultSet.getString("name"));
                RequestDispatcher rs = req.getRequestDispatcher("teacher_Dashboard.jsp");
                rs.forward(req, resp);
            } else if (Objects.equals(resultSet.getString("role"), "student")) {
                HttpSession session = req.getSession();
                session.setAttribute("userName", resultSet.getString("name"));
                RequestDispatcher rs = req.getRequestDispatcher("student_Dashboard.jsp");
                rs.forward(req, resp);
            } else {
                printWriter.println("wrong information....");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}