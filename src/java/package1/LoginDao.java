package package1;  
  
import static java.lang.System.out;
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException; 
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LoginDao { 
    
    
    public static boolean validate(String name, String pass) throws SQLException {          
        boolean status = false;  
        Connection conn = null; 
        Statement stmt = null;
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "test";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "root";  
        String password = "giannis";
 
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, userName, password);  
            pst = conn  
                    .prepareStatement("select * from register_table where username=? and password=?");  
            pst.setString(1, name);
            pst.setString(2, pass);
  
            rs = pst.executeQuery();  
            status = rs.next();
            System.out.println(status);
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }
        }  
        return status;  
    }
}  