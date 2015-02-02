package package1;



import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AddServlet extends HttpServlet {
        @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            
                System.out.print("Your place is successfully registered...");
                response.setContentType("text/html");
		PrintWriter out = response.getWriter();
                Connection conn = null;
                PreparedStatement pst = null;
		
		String n=request.getParameter("Name");
		String lat=request.getParameter("Latitude");
		String lon=request.getParameter("Longitude");
                
                String url = "jdbc:mysql://localhost:3306/";  
                String dbName = "test";  
                String driver = "com.mysql.jdbc.Driver";  
                String userName = "root";  
                String password = "giannis";
                
                
                try{
		Class.forName(driver).newInstance();  
                conn = DriverManager  
                    .getConnection(url + dbName, userName, password);  
                pst = conn  
                    .prepareStatement("insert into beach values(?,?,?)");
		
		pst.setString(1,n);
		pst.setString(2,lat);
		pst.setString(3,lon);
		
		
		int i=pst.executeUpdate();
		if(i>0)
		out.print("Your place is successfully registered 2 ...");
                RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
                rd.include(request,response);
                
                }catch (ClassNotFoundException e2) {System.out.println(e2);} catch (SQLException e2) {
                    System.out.println(e2);
            } catch (InstantiationException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
		
		out.close();

		
        }
}
