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
    String brand=request.getParameter("brand");
    
    PreparedStatement ps = con.prepareStatement("update tblbrands set BrandName=? where id=?");
    ps.setString(1, brand);
    ps.setString(2, id);
  
    int flag = ps.executeUpdate();      
  System.out.println(brand + id + ps);                        
    if(flag>0)
    {  
        out.print("<script>alert('Brand Updated successfully.');</script>");
            response.sendRedirect("manage-brands.jsp");  
        
    }      
}            
%>