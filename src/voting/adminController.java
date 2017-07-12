package voting;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminController
 */
@WebServlet("/adminController")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String status = request.getParameter("status");
			// System.out.println(status+"Printed");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false", "root", "");
			System.out.println(this.getClass().getSimpleName() + " Debug: After connection established...");
			Statement st = conn.createStatement();

			String sql = "select * from election where election_id = 1 AND status = " + status;

			ResultSet rs = st.executeQuery(sql);
			if (!rs.next()) 
			{
				System.out.println("Debug: query fired");
				String sqlUpdate = "update election set status=" + status +" where election_id = 1";
				st.executeUpdate(sqlUpdate);
				System.out.println(this.getClass().getSimpleName()+" Updated query fired");
				
				RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				rd.forward(request, response);
			} 
			else 
			{
				System.out.println("Election already started");
				RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
