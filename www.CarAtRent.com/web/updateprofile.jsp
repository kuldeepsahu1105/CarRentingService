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
        
        String fname=request.getParameter("fullname");
    String mob=request.getParameter("mobileno");
    
    String uid=request.getParameter("email");
   String dob=request.getParameter("dob");
    String address=request.getParameter("address");
    String city=request.getParameter("city");
    String country=request.getParameter("country");
    System.out.println(uid+dob+address+city);
    try
    {
        PreparedStatement ps = con.prepareStatement("update tblusers set FullName=?,ContactNo=?,dob=?,Address=?,City=?,Country=? where EmailId=?");
        ps.setString(1, fname);
        ps.setString(2, mob);
        ps.setString(3, dob);
        ps.setString(4, address);
        ps.setString(5, city);
        ps.setString(6, country);
         ps.setString(7, uid);
        boolean flag = ps.execute();                           
        if(flag)
        {
                out.print("<script>alert('Profile Updated Successfully');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("profile.jsp?flag=1");
                rd.forward(request, response);                                   
        }
        else
        {
                out.print("<script>alert('Something Went Wrong, Try Again');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("profile.jsp?flag=2");
                rd.forward(request, response);                              
        } 
        ps.close();
        con.close();
    }
   catch(Exception e)
   {
        e.printStackTrace();
   }                      
} %>