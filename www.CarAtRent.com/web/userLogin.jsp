<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
 
    Connection con=dbConn.myConn();
 
    String uid=request.getParameter("email");
    String pass=request.getParameter("password");
    
    System.out.println(uid+pass);   
    
    try
    {
        PreparedStatement ps = con.prepareStatement("SELECT EmailId,Password,FullName FROM tblusers WHERE EmailId=? and Password=?");
        ps.setString(1, uid);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();                    
        System.out.println(uid+pass);        
        while(rs.next())
        {
            String dbuid=rs.getString("EmailId");
            String dbpass=rs.getString("Password");
            System.out.println(dbuid+dbpass);                          
            if(uid.equals(dbuid) && pass.equals(dbpass))
            {                                
                HttpSession hs=request.getSession(true);
                hs.setAttribute("uid", uid);
                hs.setAttribute("name",rs.getString("FullName"));
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);                                   
            }
            else
            {
                //out.print("<script>alert('<font color=red> Userid , Password didn't match</font>');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);       
                //response.sendRedirect("index.jsp");
            }
        }  
        ps.close();
        con.close();
    }
   catch(Exception e)
   {
        e.printStackTrace();
   }                      
%>
