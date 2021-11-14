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

						<h2 class="page-title">Manage Contact Us Queries</h2>

						<!-- Zero Configuration Table -->
						<div class="panel panel-default">
							<div class="panel-heading">User queries</div>
							<div class="panel-body">
							<%//if (flag<=0) {%><div class="errorWrap"><strong>ERROR</strong>:<%//out.print("Something went wrong. Please try again");%> </div><%// } %>
                        <%//if (flag>0) {%>  <div class="succWrap"><strong>SUCCESS</strong>:<%//out.print("Testimonial Successfully (Active/Inactive)");%> </div>
                          <%// } %>
								<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
										<th>#</th>
											<th>Name</th>
											<th>Email</th>
											<th>Contact No</th>
											<th>Message</th>
											<th>Posting date</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
										<th>#</th>
											<th>Name</th>
											<th>Email</th>
											<th>Contact No</th>
											<th>Message</th>
											<th>Posting date</th>
											<th>Action</th>
										</tr>
										</tr>
									</tfoot>
									<tbody>

									<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT * from  tblcontactusquery");
        ResultSet rs1 = ps1.executeQuery();  
int i=1;                          
         while(rs1.next())
                    {                     
%>	
                                                                            	
										<tr>
											<td><%=i++%></td>
											<td><%= rs1.getString("name") %></td>
											<td><%= rs1.getString("EmailId") %></td>
											<td><%= rs1.getString("ContactNumber") %></td>
											<td><%= rs1.getString("Message") %></td>
											<td><%= rs1.getString("PostingDate") %></td>
																<% if(rs1.getInt("Status")==1)
{
	%><td>Read</td>
<% } else {%>

<td><a href="updatecontactquery.jsp?eid=<%= rs1.getInt("id") %>" onclick="return confirm('Do you really want to read?')" >Pending</a>
</td>
<% } %>
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
