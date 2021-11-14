<%@page import="java.sql.*;"%>
<%@page import="myConnect.dbConn"%>
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
String vehicletitle=request.getParameter("vehicletitle");
String brand=request.getParameter("brandname");
String vehicleoverview=request.getParameter("vehicaloverview");
String priceperday=request.getParameter("priceperday");
String fueltype=request.getParameter("fueltype");
String modelyear=request.getParameter("modelyear");
String seatingcapacity=request.getParameter("seatingcapacity");
//$vimage1=$_FILES["img1"]["name"];
//$vimage2=$_FILES["img2"]["name"];
//$vimage3=$_FILES["img3"]["name"];
//$vimage4=$_FILES["img4"]["name"];
//$vimage5=$_FILES["img5"]["name"];
String airconditioner=request.getParameter("airconditioner");
String powerdoorlocks=request.getParameter("powerdoorlocks");
String antilockbrakingsys=request.getParameter("antilockbrakingsys");
String brakeassist=request.getParameter("brakeassist");
String powersteering=request.getParameter("powersteering");
String driverairbag=request.getParameter("driverairbag");
String passengerairbag=request.getParameter("passengerairbag");
String powerwindow=request.getParameter("powerwindow");
String cdplayer=request.getParameter("cdplayer");
String centrallocking=request.getParameter("centrallocking");
String crashcensor=request.getParameter("crashcensor");
String leatherseats=request.getParameter("leatherseats");
//move_uploaded_file($_FILES["img1"]["tmp_name"],"img/vehicleimages/".$_FILES["img1"]["name"]);
//move_uploaded_file($_FILES["img2"]["tmp_name"],"img/vehicleimages/".$_FILES["img2"]["name"]);
//move_uploaded_file($_FILES["img3"]["tmp_name"],"img/vehicleimages/".$_FILES["img3"]["name"]);
//move_uploaded_file($_FILES["img4"]["tmp_name"],"img/vehicleimages/".$_FILES["img4"]["name"]);
//move_uploaded_file($_FILES["img5"]["tmp_name"],"img/vehicleimages/".$_FILES["img5"]["name"]);

PreparedStatement ps = con.prepareStatement("INSERT INTO tblvehicles(VehiclesTitle,VehiclesBrand,VehiclesOverview,PricePerDay,FuelType,ModelYear,SeatingCapacity,AirConditioner,PowerDoorLocks,AntiLockBrakingSystem,BrakeAssist,PowerSteering,DriverAirbag,PassengerAirbag,PowerWindows,CDPlayer,CentralLocking,CrashSensor,LeatherSeats) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
//Vimage1,Vimage2,Vimage3,Vimage4,Vimage5, :vimage1,:vimage2,:vimage3,:vimage4,:vimage5  
    ps.setString(1, vehicletitle);
    ps.setString(2, brand);
    ps.setString(3, vehicleoverview);
    ps.setString(4, priceperday);
    ps.setString(5, fueltype);
    ps.setString(6, modelyear);
    ps.setString(7, seatingcapacity);
    ps.setString(8, airconditioner);
    ps.setString(9, powerdoorlocks);
    ps.setString(10, antilockbrakingsys);
    ps.setString(11, brakeassist);
    ps.setString(12, powersteering);
    ps.setString(13, driverairbag);
    ps.setString(14, passengerairbag);
    ps.setString(15, powerwindow);
    ps.setString(16, cdplayer);
    ps.setString(17, centrallocking);
    ps.setString(18, crashcensor);
    ps.setString(19, leatherseats);
    int flag = ps.executeUpdate();                           
    if(flag>0)
    {  
        out.print("<script>alert('Vehicle posted successfully.');</script>");
        response.sendRedirect("post-avehical.jsp");    
    } 
    else
     {
        out.print("<script>alert('Something went wrong. Please try again.');</script>");
         response.sendRedirect("post-avehical.jsp");    
    }
}                    
%>