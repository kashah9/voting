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
import javax.servlet.http.HttpSession;

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
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false", "root", "");
			System.out.println(this.getClass().getSimpleName() + " Debug: After connection established...");
			Statement st = conn.createStatement();
			
			HttpSession session = request.getSession(true);
			UserBean ub = (UserBean) session.getAttribute("currentUser");
			System.out.println("Hello id:"+ub.getMember_id());
			
			
			if(status != null){
				
				String sql = "select * from election where election_id = 1 AND status = " + status;
				ResultSet rs = st.executeQuery(sql);
				if (!rs.next()) 
				{
					String sqlUpdate = "update election set status=" + status +" where election_id = 1";
					st.executeUpdate(sqlUpdate);
					System.out.println(this.getClass().getSimpleName()+" Updated query fired");
				} 
				else 
				{
					System.out.println("Election already started");
				}
				RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				rd.forward(request, response);
			}
			else 
			{
				/*String approve = request.getParameter("Approve");
				String reject = request.getParameter("Reject");*/
				
				String candidate_id = request.getParameter("candidate_id");
				String positionName = request.getParameter("position_name");
				String image_url = request.getParameter("image");
				String description = request.getParameter("description");
				String address = request.getParameter("address");
				
				/*System.out.println("Debug value for action: "+approve+" OR "+reject+" Candidate ID: "+candidate_id);*/
				
				String sql = "insert into election_candidates values(1, "+candidate_id+", '"+positionName+"', '"+image_url+"', '"+description+"', '"+address+"')";
				st.executeUpdate(sql);
				
				String delSql = "delete from election_candidatestemp where candidate_id = "+candidate_id;
				st.executeUpdate(delSql);
				System.out.println(this.getClass().getSimpleName()+" Debug: Query insert into election_candidates fired");
				
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
