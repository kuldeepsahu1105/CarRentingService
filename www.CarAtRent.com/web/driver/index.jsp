<%@page import="java.sql.*;" %>
<%@page import="myConnect.dbConn;"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
    response.setContentType("text/html");
        
    Connection con=dbConn.myConn(); 
    
    String uid=request.getParameter("username");
    String pass=request.getParameter("password");
    
    System.out.println(uid+pass);   
    
        PreparedStatement ps = con.prepareStatement("SELECT * FROM driver WHERE d_email=? and pwd=?");
        ps.setString(1, uid);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();                    
        System.out.println(uid+pass);        
        while(rs.next())
        {
            String dbuid=rs.getString("d_email");
            String dbpass=rs.getString("pwd");
            System.out.println(dbuid+dbpass);                          
            if(uid.equals(dbuid) && pass.equals(dbpass))
            {                                
                HttpSession hs=request.getSession(true);
                hs.setAttribute("uid", uid);
                RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                rd.forward(request, response);                                   
            }
            else
            {
                out.print("<script>alert('<font color=red> Userid , Password didn't match</font>');</script>");
                response.sendRedirect("index.jsp");
                                     
            }
        }  
%>

<!jsp:include page="includes/head.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Effective Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link rel="stylesheet" href="indexfile/css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="indexfile/css/font-awesome.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<!-- //web-fonts -->
<body>
	
    <div class="video-w3l" data-vide-bg="indexfile/video/1">
		<!--header-->
		<div class="header-w3l">
			<h1>
                                <span>C</span>ar
				<span>A</span>t
                                <span>R</span>ent.com				
				<span>D</span>river
				<span>L</span>ogin
			
			</h1>
		</div>
		<!--//header-->
		<div class="main-content-agile">
			<div class="sub-main-w3">
				<h2>Login Here
					<i class="fa fa-hand-o-down" aria-hidden="true"></i>
				</h2>
				<form action="#" method="post">
                                    
					<div class="pom-agile">
						<span class="fa fa-user-o" aria-hidden="true"></span>
						<input placeholder="Username" name="username" class="user" type="text" required="">
					</div>
					<div class="pom-agile">
						<span class="fa fa-key" aria-hidden="true"></span>
						<input placeholder="Password" name="password" class="pass" type="password" required="">
					</div>
					<div class="sub-w3l">
						<div class="sub-agile">
							<input type="checkbox" id="brand1" value="">
							<label for="brand1">
								<span></span>Remember me</label>
						</div>
						<a href="#">Forgot Password?</a>
						<div class="clear"></div>
					</div>
					<div class="right-w3l">
						<input type="submit" value="Login">
					</div>
				</form>
			</div>
		</div>
		<!--//main-->
		<!--footer-->
		<div class="footer">
			<p>&copy; 2018 Effective Login Form. All rights reserved | Design by
				<a href="http://w3layouts.com">W3layouts</a>
			</p>
		</div>
		<!--//footer-->
	</div>

	<!-- js -->
	<script src="indexfile/js/jquery-2.1.4.min.js"></script>
	<script src="indexfile/js/jquery.vide.min.js"></script>
	<!-- //js -->
</body>

</html>

