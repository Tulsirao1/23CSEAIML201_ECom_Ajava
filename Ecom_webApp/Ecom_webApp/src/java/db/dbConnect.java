package db;

import java.sql.*;

public class dbConnect {
    public static final String url = "jdbc:mysql://localhost:3306/ecomweb";
    public static final String user = "root";
    public static final String password = "root";
    public static Connection getConnection(){
        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        }
        catch(Exception e){
            System.out.println("Error: " + e);
        }
        return con;
    }
}
