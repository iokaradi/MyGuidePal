package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
        @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String n=request.getParameter("user");
		String p=request.getParameter("pass");
		
            try {
                if(LoginDao.validate(n, p)){
                    
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("username",n);
                    
                    RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp"); 
                    rd.forward(request,response);
                }
                else{
                    out.print("Sorry username or password error");
                    out.print("Welcome "+n);
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                    rd.include(request,response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
		
		out.close();
	}

}
