<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession(true);
    
    
    Connection con=dbConn.myConn();
  
    String email=request.getParameter("subscriberemail");
        PreparedStatement ps = con.prepareStatement("SELECT SubscriberEmail FROM tblsubscribers WHERE SubscriberEmail=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();                    
     if(rs.next())
     {  
         out.print("<script>alert('Already Subscribed.');</script>");
         response.sendRedirect("index.jsp");  
     } 
else
{
        PreparedStatement ps1 = con.prepareStatement("INSERT INTO  tblsubscribers(SubscriberEmail) VALUES(?)");
        ps1.setString(1, email);
        boolean flag = ps.execute();                    
     if(flag)
     {    
         out.print("<script>alert('Subscribed successfully.');</script>");
         response.sendRedirect("index.jsp");  
     }
        else 
    {
            out.print("<script>alert('Something went wrong. Please try again');</script>");
       response.sendRedirect("index.jsp");  
            }
}            
%>