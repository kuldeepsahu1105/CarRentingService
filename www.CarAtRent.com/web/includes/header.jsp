<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession(false);
    
    Connection con=dbConn.myConn();   
%>
<style>
    .default-header>div
    {
        padding-top: 0px;
        margin-top: 0px;
    }
</style>
<header>
  <div class="default-header">
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-2">
            <div class="logo"> <a href="index.jsp"><img height="70" width="140"  src="assets/images/mainlogo.gif" alt="CarAtRent.com" title="Welcome to CarAtRent.com" /></a> </div>
        </div>
        <div class="col-sm-9 col-md-10">
          <div class="header_info">
            <div class="header_widgets">
              <div class="circle_icon"> <i class="fa fa-envelope" aria-hidden="true"></i> </div>
              <p class="uppercase_text"><font color="violet">For Support Mail us : </font></p>
              <a href="mailto:info@CarAtRent.com">info@CarAtRent.com</a> </div>
            <div class="header_widgets">
              <div class="circle_icon"> <i class="fa fa-phone" aria-hidden="true"></i> </div>
              <p class="uppercase_text"><font color="violet">For Helpline Call Us: </font></p>
              <a href="tel:91-9179-432-213">+91-9179-432-213</a> </div>
            <div class="social-follow">
              
            </div>
              <%

   String uid=(String)hs.getAttribute("uid");
   String sn=(String)hs.getAttribute("name");
    System.out.println(sn);
     if(hs.getAttribute("uid")==null || hs.getAttribute("uid").equals(""))               
       {
   %>
 <div class="login_btn"> <a href="#loginform" class="btn btn-xs uppercase" data-toggle="modal" data-dismiss="modal">Login / Register</a> </div>
<% }
else{ 
out.print("Welcome To CarAtRent.com");
 } %>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Navigation -->
  <nav id="navigation_bar" class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button id="menu_slide" data-target="#navigation" aria-expanded="false" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div class="header_wrap">
        <div class="user_login">
          <ul>
            <li class="dropdown"> <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"></i> 
<%  
        PreparedStatement ps = con.prepareStatement("SELECT FullName FROM tblusers WHERE EmailId=?");
        ps.setString(1, uid);
        ResultSet rs = ps.executeQuery();                    
     while(rs.next())
                    {                               
out.print(rs.getString("FullName"));
        }
        %>
        <%if(uid!=null) {%> <i class="fa fa-angle-down" aria-hidden="true"></i><% } %></a>
        <%  if(uid!=null)   {%>
              <ul class="dropdown-menu">
            <li><a href="profile.jsp">Profile Settings</a></li>
              <li><a href="update-password.jsp">Update Password</a></li>
            <li><a href="my-booking.jsp">My Booking</a></li>
            <li><a href="post-testimonial.jsp">Post a Testimonial</a></li>
          <li><a href="my-testimonials.jsp">My Testimonial</a></li>
            <li><a href="logout.jsp">Sign Out</a></li>
            <% }  %> 
          </ul>
            </li>
          </ul>
        </div>
      </div>
      <div class="collapse navbar-collapse" id="navigation">
        <ul class="nav navbar-nav">
          <li><a href="index.jsp">Home</a>    </li>
          	 
          <li><a href="page.jsp?type=aboutus">About Us</a></li>
          <li><a href="car-listing.jsp">Car Listing</a>
          <li><a href="page.jsp?type=faqs">FAQs</a></li>
          <li><a href="contact-us.jsp">Contact Us</a></li>

        </ul>
      </div>
    </div>
  </nav>
  <!-- Navigation end --> 
  
</header>