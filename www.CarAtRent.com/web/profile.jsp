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
        
%>
<% String flag="1"; %>
 <jsp:include page="includes/head.jsp" />
<body>
        
<!--Header-->
<jsp:include page="includes/header.jsp" />
<!-- /Header --> 
<!--Page Header-->
<section class="page-header profile_page">
  <div class="container">
    <div class="page-header_wrap">
      <div class="page-heading">
        <h1>Your Profile</h1>
      </div>
      <ul class="coustom-breadcrumb">
        <li><a href="#">Home</a></li>
        <li>Profile</li>
      </ul>
    </div>
  </div>
  <!-- Dark Overlay-->
  <div class="dark-overlay"></div>
</section>
<!-- /Page Header--> 

<%  
        PreparedStatement ps = con.prepareStatement("SELECT * from  tblusers where EmailId=?");
          ps.setString(1, sn);
        ResultSet rs = ps.executeQuery();                          
         while(rs.next())
                    {                     
%>	

<section class="user_profile inner_pages">
  <div class="container">
    <div class="user_profile_info gray-bg padding_4x4_40">
      <div class="upload_user_logo"> <img src="assets/images/dealer-logo.jpg" alt="image">
      </div>

      <div class="dealer_info">
        <h5><%= rs.getString("FullName") %></h5>
        <p><%= rs.getString("Address") %><br>
          <%= rs.getString("City") %>&nbsp;<%= rs.getString("Country") %></p>
      </div>
    </div>
  
    <div class="row">
      <div class="col-md-3 col-sm-3">
          <jsp:include page="includes/sidebar.jsp"/>
      <div class="col-md-6 col-sm-8">
        <div class="profile_wrap">
          <h5 class="uppercase underline">General Settings</h5>
       
          <% if (!flag.equals("0")) { 
          if (flag.equals("2")) {%><div class="errorWrap"><strong>ERROR</strong>:<%out.print("Something went wrong. Please try again");%> </div><% } %>
                        <%if (flag.equals("1")) {%>  <div class="succWrap"><strong>SUCCESS</strong>:<%out.print("Profile Updated Successfully");%> </div>
                          <% } } %>
		
         <form  method="post" action="updateprofile.jsp">
           <div class="form-group">
              <label class="control-label">Reg Date -</label>
             <%= rs.getString("RegDate") %>
            </div>
            <% if(rs.getString("UpdationDate")!=null) {%>
            <div class="form-group">
              <label class="control-label">Last Update at  -</label>
             <%= rs.getString("UpdationDate") %>
            </div>
            <% } %>
            <div class="form-group">
              <label class="control-label">Full Name</label>
              <input class="form-control white_bg" name="fullname" value="<%= rs.getString("FullName") %>" id="fullname" type="text"  required>
            </div>
            <div class="form-group">
              <label class="control-label">Email Address</label>
              <input class="form-control white_bg" value="<%= rs.getString("EmailId") %>" name="email" id="email" type="email" required readonly>
            </div>
            <div class="form-group">
              <label class="control-label">Phone Number</label>
              <input class="form-control white_bg" name="mobileno" value="<%= rs.getString("ContactNo") %>" id="phone-number" type="number" required>
            </div>
            <div class="form-group">
              <label class="control-label">Date of Birth&nbsp;(dd/mm/yyyy)</label>
              <input class="form-control white_bg" value="<%= rs.getString("dob") %>" name="dob" placeholder="dd/mm/yyyy" id="birth-date" type="date" >
            </div>
            <div class="form-group">
              <label class="control-label">Your Address</label>
              <textarea class="form-control white_bg" name="address" rows="4" ><%= rs.getString("Address") %></textarea>
            </div>
            <div class="form-group">
              <label class="control-label">Country</label>
              <input class="form-control white_bg"  id="country" name="country" value="<%= rs.getString("Country") %>" type="text">
            </div>
            <div class="form-group">
              <label class="control-label">City</label>
              <input class="form-control white_bg" id="city" name="city" value="<%= rs.getString("City") %>" type="text">
            </div>
            <% } %>
           
            <div class="form-group">
              <button type="submit" name="updateprofile" class="btn">Save Changes <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/Profile-setting--> 

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
   <% } %>