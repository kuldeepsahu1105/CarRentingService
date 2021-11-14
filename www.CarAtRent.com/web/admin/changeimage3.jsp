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
					
						<h2 class="page-title">Vehicle Image 3 </h2>

						<div class="row">
							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-heading">Vehicle Image 3 Details</div>
									<div class="panel-body">
										<form method="post" class="form-horizontal" enctype="multipart/form-data" action="dochimage3.jsp">
										
											
  	        	  <%//if (flag<=0) {%><div class="errorWrap"><strong>ERROR</strong>:<%//out.print("Something went wrong. Please try again");%> </div><%// } %>
                        <%//if (flag>0) {%>  <div class="succWrap"><strong>SUCCESS</strong>:<%//out.print("Testimonial Successfully (Active/Inactive)");%> </div>
                          <%// } %>
				



<div class="form-group">
<%  
        String id=request.getParameter("imgid");		
        PreparedStatement ps1 = con.prepareStatement("SELECT Vimage3 from tblvehicles where tblvehicles.id=?");
        ps1.setString(1, id);
        ResultSet rs1 = ps1.executeQuery();                         
        while(rs1.next())
        {                     
%>												<label class="col-sm-4 control-label">Current Image3</label>


<div class="col-sm-8">
<img src="img/vehicleimages/<%= rs1.getString("Vimage3") %>" width="300" height="200" style="border:solid 1px #000">
</div>
<% } %>
</div>

											<div class="form-group">
												<label class="col-sm-4 control-label">Upload New Image 3<span style="color:red">*</span></label>
												<div class="col-sm-8">
											<input type="file" name="img3" required>
												</div>
											</div>
											<div class="hr-dashed"></div>
											
										
								
											
											<div class="form-group">
												<div class="col-sm-8 col-sm-offset-4">
								
													<button class="btn btn-primary" name="update" type="submit">Update</button>
												</div>
											</div>

										</form>

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

</body>

</html>
<% } %>