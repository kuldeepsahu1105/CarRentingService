<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession(true);
    
    Connection con=dbConn.myConn();
 
    String fname=request.getParameter("fullname");
    String uid=request.getParameter("emailid");
    String mob=request.getParameter("mobileno");
    String pass=request.getParameter("password");
    
    System.out.println(fname+mob+uid+pass);   
    
    try
    {
        PreparedStatement ps = con.prepareStatement("INSERT INTO  tblusers(FullName,EmailId,ContactNo,Password) VALUES (?,?,?,?)");
        ps.setString(1, fname);
        ps.setString(2, uid);
        ps.setString(3, mob);
        ps.setString(4, pass);
        
        boolean flag = ps.execute();                    
        System.out.println(uid+pass);        
        if(flag)
        {
                out.print("<script>alert('Registration successfull. Now you can login');</script>");
               response.sendRedirect("index.jsp");                                    
        }
        else
        {
               out.print("<script>alert('Something went wrong. Please try again</font>');</script>");
             response.sendRedirect("index.jsp");                                
        } 
    }
   catch(Exception e)
   {
        e.printStackTrace();
   }                     
%>