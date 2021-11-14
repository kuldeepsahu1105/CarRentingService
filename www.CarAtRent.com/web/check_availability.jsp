<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession();
    
        Connection con=dbConn.myConn();   

    String sn=(String)hs.getAttribute("uid");
    System.out.println(sn);         
            String email=request.getParameter("emailid");
                PreparedStatement ps = con.prepareStatement("SELECT EmailId FROM tblusers WHERE EmailId=?");
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();                             
            if(rs.next())
            {                        
        out.print("<span style='color:red'> Email already exists .</span>");
        out.print("<script>$('#submit').prop('disabled',true);</script>");
        } 
            else{
                out.print("<span style='color:green'> Email available for Registration .</span>");
        out.print("<script>$('#submit').prop('disabled',false);</script>");
        }
%>