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
<body>
        
<!--Header-->
<jsp:include page="includes/header.jsp" />
<!--Page Header-->
<!-- /Header --> 

<!--Page Header-->
<section class="page-header profile_page">
  <div class="container">
    <div class="page-header_wrap">
      <div class="page-heading">
        <h1>My Booking</h1>
      </div>
      <ul class="coustom-breadcrumb">
        <li><a href="#">Home</a></li>
        <li>My Booking</li>
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
          <%= rs.getString("City") %>&nbsp;<%= rs.getString("Country") %><% } %></p>
      </div>
    </div>
    <div class="row">
      <div class="col-md-3 col-sm-3">
    <jsp:include page="includes/sidebar.jsp"/>
   
      <div class="col-md-6 col-sm-8">
        <div class="profile_wrap">
          <h5 class="uppercase underline">My Bookings </h5>
          <div class="my_vehicles_list">
            <ul class="vehicle_listing">
<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT tblvehicles.Vimage1 as Vimage1,tblvehicles.VehiclesTitle,tblvehicles.id as vid,tblbrands.BrandName,tblbooking.FromDate,tblbooking.ToDate,tblbooking.message,tblbooking.Status  from tblbooking join tblvehicles on tblbooking.VehicleId=tblvehicles.id join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblbooking.userEmail=?");
        ps1.setString(1, sn);
        ResultSet rs1 = ps1.executeQuery();                           
        while(rs1.next())
        {           System.out.println("hello"); 
%> 
            

<li>
                <div class="vehicle_img"> <a href="vehical-details.jsp?vhid=<%= rs1.getString("vid") %>"><img src="admin/img/vehicleimages/<%= rs1.getString("Vimage1") %>" alt="image"></a> </div>
                <div class="vehicle_title">
                  <h6><a href="vehical-details.jsp?vhid=<%= rs1.getString("vid") %>"> <%= rs1.getString("BrandName") %> , <%= rs1.getString("VehiclesTitle") %></a></h6>
                  <p><b>From Date:</b> <%= rs1.getString("FromDate") %><br /> <b>To Date:</b> <%= rs1.getString("ToDate") %></p>
                </div>
                <% if(rs1.getInt("Status")==1)
                { %>
                <div class="vehicle_status"> <a href="#" class="btn outline btn-xs active-btn">Confirmed</a>
                           <div class="clearfix"></div>
        </div>

              <% } else if(rs1.getInt("Status")==2) { %>
 <div class="vehicle_status"> <a href="#" class="btn outline btn-xs">Cancelled</a>
            <div class="clearfix"></div>
        </div>
             


                <% } else { %>
 <div class="vehicle_status"> <a href="#" class="btn outline btn-xs">Not Confirm yet</a>
            <div class="clearfix"></div>
 </div>
 <div class="vehicle_status"> <a href="cancel-booking.jsp?vhid=<%= rs1.getString("vid")%>" class="btn btn-success">Cancel Booking</a>
            <div class="clearfix"></div>
 
               <% } %>
       <div style="float: left"><p><b>Message:</b> <%= rs1.getString("message") %> </p></div>
              </li>
              <% } %>
             
         
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/my-vehicles--> 
<jsp:include page="includes/footer.jsp"/>

<!-- Scripts --> 
<jsp:include page="includes/script.jsp"/>
</body>
</html>
<% } %>