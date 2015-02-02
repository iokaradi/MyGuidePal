package package1;



import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class OutServlet extends HttpServlet {
        @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            out.print("Successfully sign out  " + session.getAttribute("username"));
            session.setAttribute("username", null);
            session.invalidate();
            
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.include(request,response);
            out.close();

		
        }
}
