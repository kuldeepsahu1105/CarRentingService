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

						<h2 class="page-title">Manage Testimonials</h2>

						<!-- Zero Configuration Table -->
						<div class="panel panel-default">
							<div class="panel-heading">User Testimonials</div>
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
											<th>Testimonials</th>
											<th>Posting date</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
										<th>#</th>
											<th>Name</th>
											<th>Email</th>
											<th>Testimonials</th>
											<th>Posting date</th>
											<th>Action</th>
										</tr>
									</tfoot>
									<tbody>

									<%  
        PreparedStatement ps1 = con.prepareStatement("SELECT tblusers.FullName,tbltestimonial.UserEmail,tbltestimonial.Testimonial,tbltestimonial.PostingDate,tbltestimonial.status,tbltestimonial.id from tbltestimonial join tblusers on tblusers.Emailid=tbltestimonial.UserEmail");
        ResultSet rs1 = ps1.executeQuery();  
        int i=1;                          
         while(rs1.next())
                    {                     
%>		
										<tr>
											<td><%=i++%></td>
											<td><%= rs1.getString("FullName") %></td>
											<td><%= rs1.getString("UserEmail") %></td>
											<td><%= rs1.getString("Testimonial") %></td>
											<td><%= rs1.getString("PostingDate") %></td>
                                                                                        <% int s=rs1.getInt("status"); %>
                                                                                        <td><% //if(s=="" || s==0) { %>
                                                                                            <a href="testimonActive.jsp?aeid=<%= rs1.getInt("id") %>" onclick="return confirm('Do you really want to Active')">Active</a>
                                                                                            <%// } else { %>
                                                                                            <a href="testimonInactive.jsp?eid=<%= rs1.getInt("id") %>" onclick="return confirm('Do you really want to Inactive')">InActive</a>
                                                                                            <%// } %>
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