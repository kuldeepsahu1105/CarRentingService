<%@page import="java.sql.*;"%>
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
    String pagetype=request.getParameter("type");
    String pagedetails=request.getParameter("pagedetails");
    
    PreparedStatement ps = con.prepareStatement("UPDATE tblpages SET detail=? WHERE type=?");
    ps.setString(1, pagedetails);
    ps.setString(2, pagetype);
    int flag =ps.executeUpdate();
    if(flag>0)
         {
        out.print("<script>alert('Page data updated  successfully.');</script>"); 
        response.sendRedirect("manage-pages.jsp");
         }  
     else
     {
        out.print("<script>alert('Something went wrong. Please try again.');</script>");
         response.sendRedirect("manage-pages.jsp");    
      }  
   }                 
%>	