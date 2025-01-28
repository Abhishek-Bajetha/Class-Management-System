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
        String iName = req.getParameter("instituteName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");


        String instituteName = iName.replaceAll("\\s", "_");
        String userid = role + "_" + email;
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
            PrintWriter out = resp.getWriter();
            out.println("<html>");
            out.println("<head>");
            out.println("<style>");
            out.println("body {");
            out.println("    font-family: Arial, sans-serif;");
            out.println("    display: flex;");
            out.println("    justify-content: center;");
            out.println("    align-items: center;");
            out.println("    height: 100vh;");
            out.println("    margin: 0;");
            out.println("    background: #f0f8ff;");
            out.println("}");
            out.println(".registration-container {");
            out.println("    text-align: center;");
            out.println("    background: #fff;");
            out.println("    padding: 2rem;");
            out.println("    border-radius: 10px;");
            out.println("    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);");
            out.println("    max-width: 400px;");
            out.println("    width: 100%;");
            out.println("}");
            out.println(".registration-container h3 {");
            out.println("    color: #28a745;");
            out.println("    font-size: 1.8rem;");
            out.println("    margin-bottom: 1rem;");
            out.println("}");
            out.println(".registration-container a {");
            out.println("    display: inline-block;");
            out.println("    margin-top: 1rem;");
            out.println("    padding: 0.75rem 1.5rem;");
            out.println("    font-size: 1rem;");
            out.println("    color: #fff;");
            out.println("    background-color: #007bff;");
            out.println("    text-decoration: none;");
            out.println("    border-radius: 5px;");
            out.println("    transition: background-color 0.3s ease;");
            out.println("}");
            out.println(".registration-container a:hover {");
            out.println("    background-color: #0056b3;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='registration-container'>");
            out.println("<h3>Registration is done!!!</h3>");
            out.println("<a href='login.jsp'>Click here to login</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
