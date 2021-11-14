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

<jsp:include page="includes/head.jsp" />
<script type="text/javascript">
function valid()
{
if(document.chngpwd.newpassword.value!= document.chngpwd.confirmpassword.value)
{
alert("New Password and Confirm Password Field do not match  !!");
document.chngpwd.confirmpassword.focus();
return false;
}
return true;
}
</script>
<body>
        
<!--Header-->
<jsp:include page="includes/header.jsp" />
<!-- /Header --> 

<!--Page Header-->
<section class="page-header profile_page">
  <div class="container">
    <div class="page-header_wrap">
      <div class="page-heading">
        <h1>Update Password</h1>
      </div>
      <ul class="coustom-breadcrumb">
        <li><a href="#">Home</a></li>
        <li>Update Password</li>
      </ul>
    </div>
  </div>
  <!-- Dark Overlay-->
  <div class="dark-overlay"></div>
</section>
<!-- /Page Header--> 
<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT * from tblusers where EmailId=?");
        ps1.setString(1, sn);       
        ResultSet rs1 = ps1.executeQuery();                         
        while(rs1.next())
        {             
%>		
<section class="user_profile inner_pages">
  <div class="container">
    <div class="user_profile_info gray-bg padding_4x4_40">
      <div class="upload_user_logo"> <img src="assets/images/dealer-logo.jpg" alt="image">
      </div>

      <div class="dealer_info">
        <h5><%= rs1.getString("FullName") %></h5>
        <p><%= rs1.getString("Address") %><br>
          <%= rs1.getString("City") %>&nbsp;<%= rs1.getString("Country") %>
          <% } %></p>
      </div>
    </div>
    <div class="row">
      <div class="col-md-3 col-sm-3">
          <jsp:include page="includes/sidebar.jsp" />
      <div class="col-md-6 col-sm-8">
        <div class="profile_wrap">
            <form name="chngpwd" method="post" onSubmit="return valid();" action="doupdatepass.jsp">
        
            <div class="gray-bg field-title">
              <h6>Update password</h6>
            </div>
             <%//if (flag<=0) {%><div class="errorWrap"><strong>ERROR</strong>:<%//out.print("Your current password is not valid.");%> </div><%// } %>
                        <%//if (flag>0) {%>  <div class="succWrap"><strong>SUCCESS</strong>:<%//out.print("Testimonial Successfully (Active/Inactive)");%> </div>
                          <%// } %>
            <div class="form-group">
              <label class="control-label">Current Password</label>
              <input class="form-control white_bg" id="password" name="password"  type="password" required>
            </div>
            <div class="form-group">
              <label class="control-label">New Password</label>
              <input class="form-control white_bg" id="newpassword" type="password" name="newpassword" required>
            </div>
            <div class="form-group">
              <label class="control-label">Confirm Password</label>
              <input class="form-control white_bg" id="confirmpassword" type="password" name="confirmpassword"  required>
            </div>
          
            <div class="form-group">
               <input type="submit" value="Update" name="update" id="submit" class="btn btn-block">
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