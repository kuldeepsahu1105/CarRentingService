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
 
    String email=request.getParameter("email");
    String mob=request.getParameter("mobile");
    String newpass=request.getParameter("newpassword");
    
    PreparedStatement ps = con.prepareStatement("SELECT EmailId FROM tblusers WHERE EmailId=? and ContactNo=?");
    ps.setString(1, email);
    ps.setString(2, mob);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {                           
            PreparedStatement ps1 = con.prepareStatement("update tblusers set Password=? where EmailId=? and ContactNo=?");
            ps1.setString(1, newpass);
            ps1.setString(2, email);
            ps1.setString(3, mob);
            int flag = ps1.executeUpdate();                           
            if(flag>0)
                              { out.print("<script>alert('Your Password succesfully changed.');</script>");
                                response.sendRedirect("index.jsp");  
                                                               }
            }
            else 
                               {
                out.print("<script>alert('Email id or Mobile no is invalid');</script>");    
                response.sendRedirect("index.jsp"); 
                               }
    }                     
%>	