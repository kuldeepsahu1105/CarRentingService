<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession(true);
    
    Connection con=dbConn.myConn();
	
%>
<% String flag="1"; %>
<jsp:include page="includes/head.jsp" />
<body>
        
<!--Header-->
<jsp:include page="includes/header.jsp" />
<!-- /Header --> 

<!--Page Header-->
<section class="page-header contactus_page">
  <div class="container">
    <div class="page-header_wrap">
      <div class="page-heading">
        <h1>Contact Us</h1>
      </div>
      <ul class="coustom-breadcrumb">
        <li><a href="#">Home</a></li>
        <li>Contact Us</li>
      </ul>
    </div>
  </div>
  <!-- Dark Overlay-->
  <div class="dark-overlay"></div>
</section>
<!-- /Page Header--> 

<!--Contact-us-->
<section class="contact_us section-padding">
  <div class="container">
    <div  class="row">
      <div class="col-md-6">
        <h3>Get in touch using the form below</h3>
        <% if (!flag.equals("0")) { 
          if (flag.equals("2")) {%><div class="errorWrap"><strong>ERROR</strong>:<%out.print("Something went wrong. Please try again");%> </div><% } %>
                        <%if (flag.equals("1")) {%>  <div class="succWrap"><strong>SUCCESS</strong>:<%out.print("Query Submitted Successfully");%> </div>
                          <% } } %>
         	
        <div class="contact_form gray-bg">
            <form  method="post" action="docontact.jsp">
            <div class="form-group">
              <label class="control-label">Full Name <span>*</span></label>
              <input type="text" name="fullname" class="form-control white_bg" id="fullname" required>
            </div>
            <div class="form-group">
              <label class="control-label">Email Address <span>*</span></label>
              <input type="email" name="email" class="form-control white_bg" id="emailaddress" required>
            </div>
            <div class="form-group">
              <label class="control-label">Phone Number <span>*</span></label>
              <input type="text" name="contactno" class="form-control white_bg" id="phonenumber" required>
            </div>
            <div class="form-group">
              <label class="control-label">Message <span>*</span></label>
              <textarea class="form-control white_bg" name="message" rows="4" required></textarea>
            </div>
            <div class="form-group">
              <button class="btn" type="submit" name="send" type="submit">Send Message <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></button>
            </div>
          </form>
        </div>
      </div>
      <div class="col-md-6">
        <h3>Contact Info</h3>
        <div class="contact_detail">
            <%  
    String pagetype=request.getParameter("type");
    
        PreparedStatement ps1 = con.prepareStatement("SELECT Address,EmailId,ContactNo from tblcontactusinfo");
        ResultSet rs1 = ps1.executeQuery();                    
     while(rs1.next())
     {               
%>  
          <ul>
            <li>
              <div class="icon_wrap"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
              <div class="contact_info_m"><%= rs1.getString("Address") %></div>
            </li>
            <li>
              <div class="icon_wrap"><i class="fa fa-phone" aria-hidden="true"></i></div>
              <div class="contact_info_m"><a href="tel:61-1234-567-90"><%= rs1.getString("ContactNo") %></a></div>
            </li>
            <li>
              <div class="icon_wrap"><i class="fa fa-envelope-o" aria-hidden="true"></i></div>
              <div class="contact_info_m"><a href="mailto:contact@exampleurl.com"><%= rs1.getString("EmailId") %></a></div>
            </li>
          </ul>
        <%} %>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /Contact-us--> 


<!--Footer -->
<jsp:include page="includes/footer.jsp" />
<!-- /Footer--> 

<!--Back to top-->
<div id="back-top" class="back-top"> <a href="#top"><i class="fa fa-angle-up" aria-hidden="true"></i> </a> </div>
<!--/Back to top--> 

<!--Login-Form -->
<jsp:include page="includes/login.jsp" />
<!--/Login-Form --> 

<!--Register-Form -->
<jsp:include page="includes/registration.jsp" />

<!--/Register-Form --> 

<!--Forgot-password-Form -->
<jsp:include page="includes/forgotpassword.jsp"/>
<!--/Forgot-password-Form --> 

<!-- Scripts --> 
<jsp:include page="includes/script.jsp"/>

</body>
</html>
