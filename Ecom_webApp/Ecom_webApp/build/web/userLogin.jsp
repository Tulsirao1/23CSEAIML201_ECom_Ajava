<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@page import="db.dbConnect" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <center>
            <h1>User login</h1>
            <form action="userLogin.jsp" method="post">
                <br><label>Email:</label>
                <input type="email" placeholder="john@hotmail.com" name="email" required>
                <br><label>Password:</label>
                <input type="password" placeholder="********" name="password" required>
                <br>
                <input type="submit" value="Login">
            </form>
            <br>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            if(email!="" && email!=null){
                Connection con = dbConnect.getConnection();
                String query = "SELECT * FROM user WHERE email=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    String vPass = rs.getString("password");
                    if(vPass.equals("password")){
                    %><h1>Login Successful</h1><%
                    }else{
                    %><h1>Wrong password</h1><%
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
