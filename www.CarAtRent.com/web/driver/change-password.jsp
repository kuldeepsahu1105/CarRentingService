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
<%  
    String pass=request.getParameter("password");
    String newpass=request.getParameter("newpassword");
    
    PreparedStatement ps = con.prepareStatement("SELECT Password,count(*) as cnt FROM admin WHERE UserName=? and Password=?");
    ps.setString(1, sn);
    ps.setString(2, pass);
    ResultSet rs=ps.executeQuery();
    System.out.println(pass);
    if(rs.next())
    {
        int flag = rs.getInt("cnt");   
        System.out.println(flag);                              
        if(flag>0)
        {  
            PreparedStatement ps1 = con.prepareStatement("update admin set Password=? where UserName=?");
            ps1.setString(1, newpass);
            ps1.setString(2, sn);
            int flag1 = ps1.executeUpdate();                           
            if(flag1>0)
            System.out.println(flag1);
            out.print("<script>alert('Your Password succesfully changed.');</script>");

        }     
    }                     
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
					
						<h2 class="page-title">Change Password</h2>

						<div class="row">
							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-heading">Form fields</div>
									<div class="panel-body">
										<form method="post" name="chngpwd" class="form-horizontal" onSubmit="return valid();">
										
											
  	        	  <%//if (flag<=0) {%><div class="errorWrap"><strong>ERROR</strong>:<%//out.print("Your current password is not valid.");%> </div><%// } %>
                        <%//if (flag>0) {%>  <div class="succWrap"><strong>SUCCESS</strong>:<%//out.print("Testimonial Successfully (Active/Inactive)");%> </div>
                          <%// } %>
				
											<div class="form-group">
												<label class="col-sm-4 control-label">Current Password</label>
												<div class="col-sm-8">
													<input type="password" class="form-control" name="password" id="password" required>
												</div>
											</div>
											<div class="hr-dashed"></div>
											
											<div class="form-group">
												<label class="col-sm-4 control-label">New Password</label>
												<div class="col-sm-8">
													<input type="password" class="form-control" name="newpassword" id="newpassword" required>
												</div>
											</div>
											<div class="hr-dashed"></div>

											<div class="form-group">
												<label class="col-sm-4 control-label">Confirm Password</label>
												<div class="col-sm-8">
													<input type="password" class="form-control" name="confirmpassword" id="confirmpassword" required>
												</div>
											</div>
											<div class="hr-dashed"></div>
										
								
											
											<div class="form-group">
												<div class="col-sm-8 col-sm-offset-4">
								
													<button class="btn btn-primary" name="submit" type="submit">Save changes</button>
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