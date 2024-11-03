<%-- 
    Document   : loginsuccess
    Created on : Nov 3, 2024, 9:16:27 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
        <title>Login Success Page</title>
    </head>
    <body>
        <%       
        String user = (String) session.getAttribute("user");
        String userName = null;
        String sessionID = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null){
        for(Cookie cookie : cookies){
                if(cookie.getName().equals("user")) userName = cookie.getValue();
                if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
        }
        }
        %>
        <h3>Hi <%=userName %>, Login successful. Your Session ID=<%=sessionID %></h3>
        <br>
        User=<%=user %>
        <br>
        <a href="checkoutpage.jsp">Checkout Page</a>
        <form action="logout" method="post">
            <input type="submit" value="Logout" >
        </form>
    </body>
</html>
