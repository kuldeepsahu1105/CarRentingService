<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession(false);
 
    Connection con=dbConn.myConn();
 
    String name=request.getParameter("fullname");
    String email=request.getParameter("email");
    String contactno=request.getParameter("contactno");
    String message=request.getParameter("message");
        PreparedStatement ps = con.prepareStatement("INSERT INTO  tblcontactusquery(name,EmailId,ContactNumber,Message) VALUES(?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, contactno);
        ps.setString(4, message);
        int flag = ps.executeUpdate();                        
     if(flag>0)
     {               
out.print("<script>alert('Query Sent. We will contact you shortly.');</script>");
 response.sendRedirect("index.jsp?flag=1");  
}
else 
{
out.print("<script>alert('Something went wrong. Please try again');</script>");
 response.sendRedirect("contact-us.jsp?flag=2");  
}
%>