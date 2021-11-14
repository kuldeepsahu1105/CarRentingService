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
	<jsp:include page="includes/header.jsp" />
	<div class="ts-main-content">
	<jsp:include page="includes/leftbar.jsp" />
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">
					
						<h2 class="page-title">Update Contact Info</h2>

						<div class="row">
							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-heading">Form fields</div>
									<div class="panel-body">
                                                                            <form method="post" name="chngpwd" class="form-horizontal" onSubmit="return valid(); " action="updatecontactinfo.jsp">
										
											
  	        	  <%//if (flag<=0) {%><div class="errorWrap"><strong>ERROR</strong>:<%//out.print("Something went wrong. Please try again");%> </div><%// } %>
                          
                        <%//if (flag>0) {%>  <div class="succWrap"><strong>SUCCESS</strong>:<%//out.print("Info Updated successfully");%> </div>
                          <% //} %>
				<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT * from  tblcontactusinfo");
        ResultSet rs1 = ps1.executeQuery(); 
        int i=1;
     while(rs1.next())
                    {                               
%>	

				<div class="form-group">
												<label class="col-sm-4 control-label"> Address</label>
												<div class="col-sm-8">
													<textarea class="form-control" name="address<%= i %>" id="address" required><%= rs1.getString("Address") %></textarea>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 control-label"> Email id</label>
												<div class="col-sm-8">
													<input type="email" class="form-control" name="email<%= i %>" id="email" value="<%= rs1.getString("EmailId") %>" required>
												</div>
											</div>
<div class="form-group">
												<label class="col-sm-4 control-label"> Contact Number </label>
												<div class="col-sm-8">
													<input type="text" class="form-control" value="<%= rs1.getString("ContactNo") %>" name="contactno<%= i %>" id="contactno" required>
												</div>
											</div> <% i++; %>
<% } %>
											<div class="hr-dashed"></div>
											
										
								
											
											<div class="form-group">
												<div class="col-sm-8 col-sm-offset-4">
								
													<button class="btn btn-primary" name="submit" type="submit">Update</button>
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