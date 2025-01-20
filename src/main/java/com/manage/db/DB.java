package com.manage.db;

import java.sql.*;

public class DB {

    public static Connection con;

    public static Connection createConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/classmanagementsystem";
            String user = "root";
            String password = "Abhi73022@";

            con = DriverManager.getConnection(url, user, password);


        } catch (Exception e) {
            System.out.println("*********************************\n");
            System.out.println(e);
            System.out.println("*********************************\n");
        }
        return con;
    }
}
