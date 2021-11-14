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

						<h2 class="page-title">Dashboard</h2>
						
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body bk-primary text-light">
												<div class="stat-panel text-center">
<%  
        PreparedStatement ps = con.prepareStatement("SELECT count(*) as cnt from tblusers");
        ResultSet rs = ps.executeQuery();                    
                             
%>
													<div class="stat-panel-number h1 "><% if(rs.next())
                    {     
          out.print(rs.getString("cnt"));
     }  %></div>
													<div class="stat-panel-title text-uppercase">Reg Users</div>
												</div>
											</div>
											<a href="reg-users.jsp" class="block-anchor panel-footer">Full Detail <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body bk-success text-light">
												<div class="stat-panel text-center">
<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT count(*) as cnt from tblvehicles");
        ResultSet rs1 = ps1.executeQuery();                    
                             
%>
                                                                                                    
													<div class="stat-panel-number h1 "><% if(rs1.next())
                    {     
          out.print(rs1.getString("cnt"));
     }  %></div>
													<div class="stat-panel-title text-uppercase">Listed Vehicles</div>
												</div>
											</div>
											<a href="manage-vehicles.jsp" class="block-anchor panel-footer text-center">Full Detail &nbsp; <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body bk-info text-light">
												<div class="stat-panel text-center">
<%  
        PreparedStatement ps2 = con.prepareStatement("SELECT count(*) as cnt from tblbooking");
        ResultSet rs2 = ps2.executeQuery();                    
                             
%>
                                                                                                    
													<div class="stat-panel-number h1 "><% if(rs2.next())
                    {     
          out.print(rs2.getString("cnt"));
     }  %></div>
												<div class="stat-panel-title text-uppercase">Total Bookings</div>
												</div>
											</div>
											<a href="manage-bookings.jsp" class="block-anchor panel-footer text-center">Full Detail &nbsp; <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body bk-warning text-light">
												<div class="stat-panel text-center">
<%  
        PreparedStatement ps3 = con.prepareStatement("SELECT count(*) as cnt from tblbrands");
        ResultSet rs3 = ps3.executeQuery();                    
                             
%>
											
													<div class="stat-panel-number h1 "><% if(rs3.next())
                    {     
          out.print(rs3.getString("cnt"));
     }  %></div>
													<div class="stat-panel-title text-uppercase">Listed Brands</div>
												</div>
											</div>
											<a href="manage-brands.jsp" class="block-anchor panel-footer text-center">Full Detail &nbsp; <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>



<div class="row">
					<div class="col-md-12">

						
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body bk-primary text-light">
												<div class="stat-panel text-center">
<%  
        PreparedStatement ps4 = con.prepareStatement("SELECT count(*) as cnt from tblsubscribers");
        ResultSet rs4 = ps4.executeQuery();                    
                             
%>
                                                                                                    
													<div class="stat-panel-number h1 "><% if(rs4.next())
                    {     
          out.print(rs4.getString("cnt"));
     }  %></div>
													<div class="stat-panel-title text-uppercase">Subscibers</div>
												</div>
											</div>
											<a href="manage-subscribers.jsp" class="block-anchor panel-footer">Full Detail <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body bk-success text-light">
												<div class="stat-panel text-center">
												
                                                                                                    <%  
        PreparedStatement ps5 = con.prepareStatement("SELECT count(*) as cnt from tblcontactusquery");
        ResultSet rs5 = ps5.executeQuery();                    
                             
%>
													<div class="stat-panel-number h1 "><% if(rs5.next())
                    {     
          out.print(rs5.getString("cnt"));
     }  %></div>
													<div class="stat-panel-title text-uppercase">Queries</div>
												</div>
											</div>
											<a href="manage-conactusquery.jsp" class="block-anchor panel-footer text-center">Full Detail &nbsp; <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body bk-info text-light">
												<div class="stat-panel text-center">
<%  
        PreparedStatement ps6 = con.prepareStatement("SELECT count(*) as cnt from tbltestimonial");
        ResultSet rs6 = ps6.executeQuery();                    
                             
%>
                                                                                                   

													<div class="stat-panel-number h1 "><% if(rs6.next())
                    {     
          out.print(rs6.getString("cnt"));
     }  %></div>
													<div class="stat-panel-title text-uppercase">Testimonials</div>
												</div>
											</div>
											<a href="testimonials.jsp" class="block-anchor panel-footer text-center">Full Detail &nbsp; <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
								
								</div>
							</div>
						</div>
					</div>
				</div>









			</div>
		</div>
	</div>

	<!-- Loading Scripts -->
	<jsp:include page="includes/script.jsp" />
	
	<script>
		
	window.onload = function(){
    
		// Line chart from swirlData for dashReport
		var ctx = document.getElementById("dashReport").getContext("2d");
		window.myLine = new Chart(ctx).Line(swirlData, {
			responsive: true,
			scaleShowVerticalLines: false,
			scaleBeginAtZero : true,
			multiTooltipTemplate: ""
		}); 
		
		// Pie Chart from doughutData
		var doctx = document.getElementById("chart-area3").getContext("2d");
		window.myDoughnut = new Chart(doctx).Pie(doughnutData, {responsive : true});

		// Dougnut Chart from doughnutData
		var doctx = document.getElementById("chart-area4").getContext("2d");
		window.myDoughnut = new Chart(doctx).Doughnut(doughnutData, {responsive : true});

	}
	</script>
</body>
</html>
<% } %>