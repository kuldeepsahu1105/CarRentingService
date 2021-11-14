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
    String vhid=request.getParameter("vhid");            
%>
<jsp:include page="includes/head.jsp" />
<!--Header-->
<jsp:include page="includes/header.jsp" />
<!-- /Header --> 

<!--Listing-Image-Slider-->
<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblvehicles.id=?");
        ps1.setString(1, vhid);
        ResultSet rs1 = ps1.executeQuery();                           
        while(rs1.next())
        {  
           hs.setAttribute("bid", rs1.getString("bid"));                
%> 

<section id="listing_img_slider">
    <div><img src="admin/img/vehicleimages/<%= rs1.getString("Vimage1") %>" class="img-responsive" alt="image" width="900" style="max-height: 100;min-height: 100;" height="560" alt="image" ></div>
  <div><img src="admin/img/vehicleimages/<%= rs1.getString("Vimage2") %>"class="img-responsive" alt="image" width="900" height="560" style="max-height: 100;min-height: 100;" alt="image" ></div>
  <div><img src="admin/img/vehicleimages/<%= rs1.getString("Vimage3") %>" class="img-responsive" alt="image" width="900" height="560" style="max-height: 100;min-height: 100;" alt="image" ></div>
  <div><img src="admin/img/vehicleimages/<%= rs1.getString("Vimage4") %>" class="img-responsive" alt="image" width="900" style="max-height: 100;min-height: 100;"  height="560" alt="image" ></div>
  <% if(rs1.getString("Vimage5").equals(""))
    {

    } else { %>
  <div><img src="admin/img/vehicleimages/<%= rs1.getString("Vimage5") %>" class="img-responsive" alt="image" ></div>
  <% } %>
</section>
<!--/Listing-Image-Slider-->


<!--Listing-detail-->
<section class="listing-detail">
  <div class="container">
    <div class="listing_detail_head row">
      <div class="col-md-9">
        <h2><%= rs1.getString("BrandName") %> , <%= rs1.getString("VehiclesTitle") %></h2>
      </div>
      <div class="col-md-3">
        <div class="price_info">
          <p><img src="assets/images/rupees.jpg" height="40px" width="40px"><%= rs1.getString("PricePerDay") %> </p>Per Day
         
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-9">
        <div class="main_features">
          <ul>
          
            <li> <i class="fa fa-calendar" aria-hidden="true"></i>
              <h5><%= rs1.getString("ModelYear") %></h5>
              <p>Reg.Year</p>
            </li>
            <li> <i class="fa fa-cogs" aria-hidden="true"></i>
              <h5><%= rs1.getString("FuelType") %></h5>
              <p>Fuel Type</p>
            </li>
       
            <li> <i class="fa fa-user-plus" aria-hidden="true"></i>
              <h5><%= rs1.getString("SeatingCapacity") %></h5>
              <p>Seats</p>
            </li>
          </ul>
        </div>
        <div class="listing_more_info">
          <div class="listing_detail_wrap"> 
            <!-- Nav tabs -->
            <ul class="nav nav-tabs gray-bg" role="tablist">
              <li role="presentation" class="active"><a href="#vehicle-overview " aria-controls="vehicle-overview" role="tab" data-toggle="tab">Vehicle Overview </a></li>
          
              <li role="presentation"><a href="#accessories" aria-controls="accessories" role="tab" data-toggle="tab">Accessories</a></li>
            </ul>
            
            <!-- Tab panes -->
            <div class="tab-content"> 
              <!-- vehicle-overview -->
              <div role="tabpanel" class="tab-pane active" id="vehicle-overview">
                
                <p><%= rs1.getString("VehiclesOverview") %></p>
              </div>
              
              
              <!-- Accessories -->
              <div role="tabpanel" class="tab-pane" id="accessories"> 
                <!--Accessories-->
                <table>
                  <thead>
                    <tr>
                      <th colspan="2">Accessories</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Air Conditioner</td>
<% if(rs1.getString("AirConditioner").equals("1"))
    { %>
                      <td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
   <td><i class="fa fa-close" aria-hidden="true"></i></td>
   <% } %> </tr>

<tr>
<td>AntiLock Braking System</td>
<% if(rs1.getString("AntiLockBrakingSystem").equals("1"))
    { %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
                    </tr>


<tr>
<td>Power Steering</td>
<% if(rs1.getString("PowerSteering").equals("1"))
    {
            %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
</tr>
                   

<tr>

<td>Power Windows</td>

<% if(rs1.getString("PowerWindows").equals("1"))
    {
    %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
</tr>
                   
 <tr>
<td>CD Player</td>
<% if(rs1.getString("CDPlayer").equals("1"))
    {
    %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
</tr>

<tr>
<td>Leather Seats</td>
 <% if(rs1.getString("LeatherSeats").equals("1"))
    {
    %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
</tr>

<tr>
<td>Central Locking</td>
<% if(rs1.getString("CentralLocking").equals("1"))
    {
    %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
</tr>

<tr>
<td>Power Door Locks</td>
<% if(rs1.getString("PowerDoorLocks").equals("1"))
    { %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
                    </tr>
                    <tr>
<td>Brake Assist</td>
<% if(rs1.getString("BrakeAssist").equals("1"))
    {
            %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<%  } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
</tr>

<tr>
<td>Driver Airbag</td>
<% if(rs1.getString("DriverAirbag").equals("1"))
    {
    %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
 </tr>
 
 <tr>
 <td>Passenger Airbag</td>
 <% if(rs1.getString("PassengerAirbag").equals("1"))
    {
    %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
</tr>

<tr>
<td>Crash Sensor</td>
<% if(rs1.getString("CrashSensor").equals("1"))
    {
    %>
<td><i class="fa fa-check" aria-hidden="true"></i></td>
<% } else { %>
<td><i class="fa fa-close" aria-hidden="true"></i></td>
<% } %>
</tr>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
        </div>
<% } %>
   
      </div>
      
      <!--Side-Bar-->
      <aside class="col-md-3">
      
        <div class="share_vehicle">
          <p>Share: <a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a> <a href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a> <a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a> <a href="#"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a> </p>
        </div>
        <div class="sidebar_widget">
          <div class="widget_heading">
            <h5><i class="fa fa-envelope" aria-hidden="true"></i>Book Now</h5>
          </div>
          <form method="post" action="dobooking.jsp">
            <div class="form-group">
              <input type="date" class="form-control" name="fromdate" placeholder="From Date(dd/mm/yyyy)" required>
            </div>
            <div class="form-group">
              <input type="date" class="form-control" name="todate" placeholder="To Date(dd/mm/yyyy)" required>
            </div><input type="hidden" name="vhid" value="<%= vhid %>">
            <div class="form-group">
              <textarea rows="4" class="form-control" name="message" placeholder="Message" required></textarea>
            </div>
         <% if(hs.getAttribute("uid")==null || hs.getAttribute("uid").equals(""))         
       { %>            
<a href="#loginform" class="btn btn-xs uppercase" data-toggle="modal" data-dismiss="modal">Login For Book</a>

              <% } else { %>
              <div class="form-group">
                <input type="submit" class="btn"  name="submit" value="Book Now">
              </div>
              <% } %>
          </form>
        </div>
      </aside>
      <!--/Side-Bar--> 
    </div>
    
    <div class="space-20"></div>
    <div class="divider"></div>
    
    <!--Similar-Cars-->
    <div class="similar_cars">
      <h3>Similar Cars</h3>
      <div class="row">
<%  
String brand=request.getParameter("brand");
String fueltype=request.getParameter("fueltype");
        PreparedStatement ps2 = con.prepareStatement("SELECT tblvehicles.VehiclesTitle,tblbrands.BrandName,tblvehicles.PricePerDay,tblvehicles.FuelType,tblvehicles.ModelYear,tblvehicles.id,tblvehicles.SeatingCapacity,tblvehicles.VehiclesOverview,tblvehicles.Vimage1 from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblvehicles.VehiclesBrand=?");
        ps2.setString(1, brand);
        ResultSet rs2 = ps2.executeQuery();                           
        while(rs2.next())
        {                    
%>   
        <div class="col-md-3 grid_listing">
          <div class="product-listing-m gray-bg">
            <div class="product-listing-img"> <a href="vehical-details.jsp?vhid=<%= rs2.getInt("id") %>"><img src="admin/img/vehicleimages/<%= rs2.getString("Vimage1") %>" class="img-responsive" style="max-height: 100;min-height: 100;" alt="image" /> </a>
            </div>
            <div class="product-listing-content">
              <h5><a href="vehical-details.jsp?vhid=<%= rs2.getInt("id") %>"><%= rs2.getString("BrandName") %> , <%= rs2.getString("VehiclesTitle") %></a></h5>
              <p class="list-price">$<%= rs2.getString("PricePerDay") %></p>
          
              <ul class="features_list">
                
             <li><i class="fa fa-user" aria-hidden="true"></i><%= rs2.getString("SeatingCapacity") %> seats</li>
                <li><i class="fa fa-calendar" aria-hidden="true"></i><%= rs2.getString("ModelYear") %> model</li>
                <li><i class="fa fa-car" aria-hidden="true"></i><%= rs2.getString("FuelType") %></li>
              </ul>
            </div>
          </div>
        </div>
 <% } %>       

      </div>
    </div>
    <!--/Similar-Cars--> 
    
  </div>
</section>
<!--/Listing-detail--> 

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
