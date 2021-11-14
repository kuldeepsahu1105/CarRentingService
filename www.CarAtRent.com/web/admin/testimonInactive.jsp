<%@page import="java.sql.*;" %>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession(false); 
    
    Connection con=dbConn.myConn(); 
             
         int id=Integer.parseInt(request.getParameter("eid"));

    String status="0";
   PreparedStatement ps = con.prepareStatement("UPDATE tbltestimonial SET status=? WHERE  id=?");
    ps.setString(1,status);
    ps.setInt(2,id);
    int flag = ps.executeUpdate();  
    if(flag>0)        
    {                     	
        out.print("<script> alert('Testimonial Successfully Inactive');</script>");
        response.sendRedirect("testimonials.jsp");  
    }
%>