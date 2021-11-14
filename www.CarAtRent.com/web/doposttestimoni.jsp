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
    else
    {                                
        String brand=request.getParameter("testimonial");
        PreparedStatement ps = con.prepareStatement("INSERT INTO  tbltestimonial(UserEmail,Testimonial) VALUES(?,?)");
        ps.setString(1, sn);
        ps.setString(2, brand);
        int flag = ps.executeUpdate();                           
        if(flag>0)
        {  
            out.print("<script>alert('Testimonail submitted successfully.');</script>");
             response.sendRedirect("my-testimonials.jsp");  
        }    
        else 
        {
            out.print("<script>alert('Something Went wrong.Please try again');</script>"); 
                response.sendRedirect("post-testimonial.jsp");  
        } 
    }                              
%>