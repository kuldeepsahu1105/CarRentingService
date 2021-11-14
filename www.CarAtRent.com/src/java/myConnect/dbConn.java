package myConnect;
import java.sql.*;

public class dbConn 
{
    static Connection con=null;
    static String driver="com.mysql.jdbc.Driver";
    static String url="jdbc:mysql://localhost:3306/caratrent_db";
    static String host="localhost";
    static String username="root";
    static String password="root";
    
    static
    {
         try
         {
             Class.forName(driver);
             System.out.println("Driver Loaded.");
         }
         catch(Exception e)
         {
             System.out.println(e);
         }
    }
    public static Connection myConn()    
    {
            try
            {
               con=DriverManager.getConnection(url, username, password);
               System.out.println("Database Connected.");
            }
            catch(Exception e)
         {
             System.out.println(e);
         }
         return con;   
     }
}
