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

@WebServlet("/signup")
public class RegServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String name = req.getParameter("name");
        String role = req.getParameter("role");
        String instituteName = req.getParameter("instituteName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        String userid = role + "_" + instituteName;
        System.out.println(name + "\n" + role + "\n");
        System.out.println(instituteName + "\n");
        System.out.println(email + "\n" + password);

        try {
            String query = "INSERT INTO users (userid, name, email, role, institute , password) VALUES (?,?,?,?,?,?);";
            Connection connection = DB.createConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userid);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, role);
            preparedStatement.setString(5, instituteName);
            preparedStatement.setString(6, password);
            preparedStatement.executeUpdate();
            PrintWriter printWriter = resp.getWriter();
            printWriter.println("Registration is done!!!");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
