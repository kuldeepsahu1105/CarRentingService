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
  
%>
<jsp:include page="includes/head.jsp" />
<body>
<jsp:include page="includes/header.jsp" />
       <!--Header-->
<%  
String pagetype=request.getParameter("type");
        PreparedStatement ps = con.prepareStatement("SELECT type,detail,PageName from tblpages where type=?");
        ps.setString(1, pagetype);
        ResultSet rs = ps.executeQuery();                           
        while(rs.next())
        {             
%>
<section class="page-header aboutus_page">
  <div class="container">
    <div class="page-header_wrap">
      <div class="page-heading">
        <h1><%= rs.getString("PageName") %></h1>
      </div>
      <ul class="coustom-breadcrumb">
        <li><a href="#">Home</a></li>
        <li><%= rs.getString("PageName") %></li>
      </ul>
    </div>
  </div>
  <!-- Dark Overlay-->
  <div class="dark-overlay"></div>
</section>
<section class="about_us section-padding">
  <div class="container">
    <div class="section-header text-center">


      <h2><%= rs.getString("PageName") %></h2>
      <p><%= rs.getString("detail") %></p>
    </div>
   <% } %>
  </div>
</section>
<!-- /About-us--> 

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