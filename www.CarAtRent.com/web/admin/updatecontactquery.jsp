<%-- 
    Document   : updatecontactquery
    Created on : 6 Mar, 2018, 11:49:37 AM
    Author     : KULDEEP
--%>
<%@page import="java.sql.*;" %>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession(false); 
    
    Connection con=dbConn.myConn(); 

    String sn=(String)hs.getAttribute("uid");
    System.out.println(sn);
    if(hs.getAttribute("uid")==null || hs.getAttribute("uid").equals(""))         
       {
       response.sendRedirect("index.jsp");  
       }    
   else{                              


   String id=request.getParameter("eid");
    int status=1;
   PreparedStatement ps = con.prepareStatement("UPDATE tblcontactusquery SET status=? WHERE  id=?");
    ps.setInt(1,status);
    ps.setString(2,id);
    int flag = ps.executeUpdate();  
    if(flag>0)        
    {                     	
        out.print("<script> alert('Query Successfully Read');</script>");
        response.sendRedirect("manage-conactusquery.jsp"); 
    }
}  
%>       