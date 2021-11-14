<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
    
    HttpSession hs=request.getSession(true);
    
        Connection con=dbConn.myConn();   

    String sn=(String)hs.getAttribute("uid");
    System.out.println(sn);
%>
<jsp:include page="includes/head.jsp" />
<body>  

<!--Header-->
<jsp:include page="includes/header.jsp" />
<!-- /Header --> 

<!--Page Header-->
<section class="page-header listing_page">
  <div class="container">
    <div class="page-header_wrap">
      <div class="page-heading">
        <h1>Car Listing</h1>
      </div>
      <ul class="coustom-breadcrumb">
        <li><a href="#">Home</a></li>
        <li>Car Listing</li>
      </ul>
    </div>
  </div>
  <!-- Dark Overlay-->
  <div class="dark-overlay"></div>
</section>
<!-- /Page Header--> 

<!--Listing-->
<section class="listing-page">
  <div class="container">
    <div class="row">
      <div class="col-md-9 col-md-push-3">
        <div class="result-sorting-wrapper">
          <div class="sorting-count">

<%
        PreparedStatement ps = con.prepareStatement("SELECT count(*) as cnt from tblvehicles");
        ResultSet rs = ps.executeQuery();                    
     if(rs.next())
                    {System.out.println(rs.getInt("cnt"));    }                         
%>

<p><span><%= rs.getInt("cnt") %> Listings</span></p>
</div>
</div>
<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand");
        ResultSet rs1 = ps1.executeQuery();                    
     while(rs1.next())
                    {                               
%>

        <div class="product-listing-m gray-bg">
          <div class="product-listing-img"><img src="admin/img/vehicleimages/<%= rs1.getString("Vimage1") %>" class="img-responsive" alt="Image" /> </a> 
          </div>
          <div class="product-listing-content">
            <h5><a href="vehical-details.jsp?vhid=<%= rs1.getInt("id") %>"><%= rs1.getString("BrandName") %> , <%= rs1.getString("VehiclesTitle") %></a></h5>
            <p class="list-price"><img src="assets/images/rupees.jpg" height="20px" width="20px"><%= rs1.getString("PricePerDay") %> Per Day</p>
            <ul>
              <li><i class="fa fa-user" aria-hidden="true"></i><%= rs1.getInt("SeatingCapacity") %> seats</li>
              <li><i class="fa fa-calendar" aria-hidden="true"></i><%= rs1.getInt("ModelYear") %> model</li>
              <li><i class="fa fa-car" aria-hidden="true"></i><%= rs1.getString("FuelType") %></li>
            </ul>
            <a href="vehical-details.jsp?vhid=<%= rs1.getInt("id") %>" class="btn">View Details <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
          </div>
        </div>
      <% } %>
         </div>
      
      <!--Side-Bar-->
      <aside class="col-md-3 col-md-pull-9">
        <div class="sidebar_widget">
          <div class="widget_heading">
            <h5><i class="fa fa-filter" aria-hidden="true"></i> Find Your  Car </h5>
          </div>
          <div class="sidebar_filter">
            <form action="search-carresult.jsp" method="post">
              <div class="form-group select">
                <select class="form-control" name="brand">
                  <option>Select Brand</option>
<%  
        PreparedStatement ps2 = con.prepareStatement("SELECT * from  tblbrands");
        ResultSet rs2 = ps2.executeQuery();                    
     while(rs2.next())
                    {                               
%>

<option value="<%= rs2.getInt("id") %>"><%= rs2.getString("BrandName") %></option>
<% } %>
                 
                </select>
              </div>
              <div class="form-group select">
                <select class="form-control" name="fueltype">
                  <option>Select Fuel Type</option>
<option value="Petrol">Petrol</option>
<option value="Diesel">Diesel</option>
<option value="CNG">CNG</option>
                </select>
              </div>
             
              <div class="form-group">
                <button type="submit" class="btn btn-block"><i class="fa fa-search" aria-hidden="true"></i> Search Car</button>
              </div>
            </form>
          </div>
        </div>

        <div class="sidebar_widget">
          <div class="widget_heading">
            <h5><i class="fa fa-car" aria-hidden="true"></i> Recently Listed Cars</h5>
          </div>
          <div class="recent_addedcars">
            <ul>
    <%  
        PreparedStatement ps3 = con.prepareStatement("SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand order by id desc limit 4");
        ResultSet rs3 = ps3.executeQuery();                    
     while(rs3.next())
                    {                               
%>
              <li class="gray-bg">
                <div class="recent_post_img"> <a href="vehical-details.jsp?vhid=<%= rs3.getInt("id") %>"><img src="admin/img/vehicleimages/<%= rs3.getString("Vimage1") %>" alt="image"></a> </div>
                <div class="recent_post_title"> <a href="vehical-details.jsp?vhid=<%= rs3.getInt("id") %>"><%= rs3.getString("BrandName") %> , <%= rs3.getString("VehiclesTitle") %></a>
                  <p class="widget_price"><img src="assets/images/rupees.jpg" height="20px" width="20px"><%= rs3.getInt("PricePerDay") %> Per Day</p>
                </div>
              </li>
             <% } %>
              
            </ul>
          </div>
        </div>
      </aside>
      <!--/Side-Bar--> 
    </div>
  </div>
</section>
<!-- /Listing--> 

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
<jsp:include page="includes/forgotpassword.jsp" />

<!-- Scripts --> 
<jsp:include page="includes/script.jsp" />

</body>
</html>
