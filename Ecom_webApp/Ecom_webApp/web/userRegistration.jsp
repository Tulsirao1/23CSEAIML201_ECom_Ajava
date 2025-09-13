<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@page import="db.dbConnect" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
        <center>
            <h1>User registration</h1>
            <form action="userRegistration.jsp" method="post">
                <br><label>Name:</label>
                <input type="text" placeholder="John" name="name" required>
                <br><label>Email:</label>
                <input type="email" placeholder="john@hotmail.com" name="email" required>
                <br><label>Mobile:</label>
                <input type="tel" placeholder="9876543210" name="mobile">
                <br><label>Password:</label>
                <input type="password" placeholder="********" name="password" required>
                <br>
                <input type="submit" value="Register">
            </form>
            <br>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String password = request.getParameter("password");
            if(name!="" && name!=null){
                Connection con = dbConnect.getConnection();
                String addRecord = "INSERT INTO user(name, email, password, mobile) VALUES(?, ?, ?, ?)";
                PreparedStatement psAdd = con.prepareStatement(addRecord);
                psAdd.setString(1, name);
                psAdd.setString(2, email);
                psAdd.setString(3, password);
                psAdd.setString(4, mobile);
                try{
                    int x = psAdd.executeUpdate();
                    if(x>0){
                    %>
                        <h4>Registration successful,</h4>
                        <h4>Please proceed to <a href="userLogin.jsp">Login</a></h4>
                    <%
                    }else{
                    %>
                        <h4>Registration failed,</h4>
                        <h4>Please try again!</h4>
                    <%
                    }
                }
                catch(Exception e){
                    %>
                        <h4>Email already registered,</h4>
                        <h4>Use a different email or <a href="userLogin.jsp">login</a> instead!</h4>
                    <%
                }
            }else{
            %>
                <h4>Already registered? <a href="userLogin.jsp">Login</a></h4>
            <%
            }
        %>
        </center>
    </body>
</html>
