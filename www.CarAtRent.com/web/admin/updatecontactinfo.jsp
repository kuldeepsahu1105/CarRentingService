<%-- 
    Document   : updatecontactinfo
    Created on : 6 Mar, 2018, 12:01:19 PM
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
        PreparedStatement ps = con.prepareStatement("SELECT * from  tblcontactusinfo");
        ResultSet rs = ps.executeQuery(); 
        int i=1;
     while(rs.next())
    { 
    String address=request.getParameter("address"+i);             
    String email=request.getParameter("email"+i); 
    String contactno=request.getParameter("contactno"+i);
    PreparedStatement ps1 = con.prepareStatement("update tblcontactusinfo set Address=?,EmailId=?,ContactNo=?");
    ps1.setString(1, address);
    ps1.setString(2, email);
    ps1.setString(3, contactno);
    ps1.executeUpdate();  
        System.out.println(i);
    i++;
    }
     int flag=1;
        /*
    String address=request.getParameter("address");
    String email=request.getParameter("email");
    String contactno=request.getParameter("contactno");
    PreparedStatement ps = con.prepareStatement("update tblcontactusinfo set Address=?,EmailId=?,ContactNo=?");
    ps.setString(1, address);
    ps.setString(2, email);
    ps.setString(3, contactno);
    int flag = ps.executeUpdate();   
                */
    if(flag>0)
    {  
        out.print("<script>alert('Information Updated successfully.');</script>");
        response.sendRedirect("manage-contactinfo.jsp"); 
        
    }   
}                   
%>