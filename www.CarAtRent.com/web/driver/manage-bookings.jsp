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
   else{                         
%>

<jsp:include page="includes/head.jsp" />

<body>
	<jsp:include page="includes/header.jsp" />

	<div class="ts-main-content">
		<jsp:include page="includes/leftbar.jsp" />
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">

						<h2 class="page-title">Manage Bookings</h2>

						<!-- Zero Configuration Table -->
						<div class="panel panel-default">
							<div class="panel-heading">Bookings Info</div>
							<div class="panel-body">
								<%//if (flag<=0) {%><div class="errorWrap"><strong>ERROR</strong>:<%//out.print("Something went wrong. Please try again");%> </div><%// } %>
                        <%//if (flag>0) {%>  <div class="succWrap"><strong>SUCCESS</strong>:<%//out.print("Testimonial Successfully (Active/Inactive)");%> </div>
                          <%// } %>
								<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
										<th>#</th>
											<th>Name</th>
											<th>Vehicle</th>
											<th>From Date</th>
											<th>To Date</th>
											<th>Message</th>
											<th>Status</th>
											<th>Posting date</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
										<th>#</th>
										<th>Name</th>
											<th>Vehicle</th>
											<th>From Date</th>
											<th>To Date</th>
											<th>Message</th>
											<th>Status</th>
											<th>Posting date</th>
											<th>Action</th>
										</tr>
									</tfoot>
									<tbody>

									<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT tblusers.FullName,tblbrands.BrandName,tblvehicles.VehiclesTitle,tblbooking.FromDate,tblbooking.ToDate,tblbooking.message,tblbooking.VehicleId as vid,tblbooking.Status,tblbooking.PostingDate,tblbooking.id  from tblbooking join tblvehicles on tblvehicles.id=tblbooking.VehicleId join tblusers on tblusers.EmailId=tblbooking.userEmail join tblbrands on tblvehicles.VehiclesBrand=tblbrands.id ");
        ResultSet rs1 = ps1.executeQuery();  
int i=1;                          
         while(rs1.next())
                    {                     
%>	
                                                                           
										<tr>
											<td><%=i++%></td>
											<td><%= rs1.getString("FullName") %></td>
											<td><a href="edit-vehicle.jsp?id=<%= rs1.getInt("vid") %>"><%= rs1.getString("BrandName") %> , <%= rs1.getString("VehiclesTitle") %></td>
											<td><%= rs1.getString("FromDate") %></td>
											<td><%= rs1.getString("ToDate") %></td>
											<td><%= rs1.getString("message") %></td>
											<td><% 
if(rs1.getString("Status").equals("0"))
{
out.print("Not Confirmed yet");
} else if (rs1.getString("Status").equals("1")) {
out.print("Confirmed");
}
 else{
 	out.print("Cancelled");
 }
%>    </td>
											<td><%= rs1.getString("PostingDate") %></td>
										<td><a href="confirmbooking.jsp?id=<%= rs1.getInt("id") %>" onclick="return confirm('Do you really want to Confirm this booking')"> Confirm</a> /


<a href="cancelbooking.jsp?id=<%= rs1.getInt("id") %>" onclick="return confirm('Do you really want to Cancel this Booking')"> Cancel</a>
</td>

										</tr>
										<% } %>
										
									</tbody>
								</table>

						

							</div>
						</div>

					

					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Loading Scripts -->
	<jsp:include page="includes/script.jsp" />
</body>
</html>
<% } %>
