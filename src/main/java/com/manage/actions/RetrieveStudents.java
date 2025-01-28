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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/retrieveStud")
public class RetrieveStudents extends HttpServlet {
    int count = 0;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String code = req.getParameter("classCode");
        String teacherId = (String) session.getAttribute("teacherId");
        String institute = code + "_" + teacherId;


        try {


            PrintWriter out = resp.getWriter();
            resp.setContentType("text / html");

            /*DB connection*/

            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/classmanagementsystem";
            String user = "root";
            String password = "Abhi73022@";

            Connection connection = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM users WHERE institute = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, institute);
            ResultSet resultSet = preparedStatement.executeQuery();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Attendance Page</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 0; padding: 0; }");
            out.println("h1 { text-align: center; color: #333; margin-top: 20px; }");
            out.println("table { width: 80%; margin: 20px auto; border-collapse: collapse; background: #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }");
            out.println("th, td { padding: 10px; text-align: center; border: 1px solid #ddd; }");
            out.println("th { background-color: #f4f4f4; color: #555; }");
            out.println("tr:hover { background-color: #f1f1f1; }");
            out.println("input[type='submit'] { display: block; margin: 20px auto; padding: 10px 20px; background-color: rgb(162, 107, 244); color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; }");
            out.println("input[type='submit']:hover { background-color: rgb(123, 69, 203); }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Attendance Page</h1>");
            out.println("<form method='post' action='SubmitAttendanceServlet'>");
            out.println("<table border='1'>");
            out.println("<tr><th>Name</th><th>Present</th><th>Absent</th></tr>");
            while (resultSet.next()) {
                out.println("<tr>");
                out.println("<td>" + resultSet.getString("name") + "</td>");
                out.println("<td><input type='radio' name='attendance" + count + "' value='present" + resultSet.getString("userid") + "'></td>");
                out.println("<td><input type='radio' name='attendance" + count + "' value='absent_" + resultSet.getString("userid") + "'></td>");
                out.println("</tr>");
                count++;
            }
            out.println("<td><input type='hidden' name='count' value='" + count + "'></td>");

            out.println("</table>");
            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            resp.sendRedirect("error_message.jsp");
        }


    }
}
