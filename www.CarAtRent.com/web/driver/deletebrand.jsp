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

    String id=request.getParameter("id");
    PreparedStatement ps = con.prepareStatement("delete from tblbrands  WHERE id=?");
    ps.setString(1, id);
    System.out.println(id);
    int flag = ps.executeUpdate();                           
    if(flag>0)
    {  
        out.print("<script>alert('Brand Deleted successfully.');</script>");
        response.sendRedirect("manage-brands.jsp");
    }  
    else
     {
        out.print("<script>alert('Something went wrong. Please try again.');</script>");
         response.sendRedirect("manage-brands.jsp");    
      }              
}            
%>
