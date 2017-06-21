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

@WebServlet("/VotingController")
public class VotingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public VotingController() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			String electionId = request.getParameter("electionID");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false","root","");
			System.out.println(this.getClass().getSimpleName()+" Debug1: Election ID for voting is "+electionId);
			Statement st = conn.createStatement();
			HttpSession session = request.getSession(true);
			
			UserBean ub = (UserBean)session.getAttribute("currentUser");
			System.out.println("Debug VotingCtrlr: "+ub.getMember_id());
			String sql = "select * from election_votes where election_id="+electionId+" AND voter_id="+request.getParameter("member_id");
			ResultSet rs = st.executeQuery(sql);
			if(rs.next())
			{
				System.out.println("You have already casted your vote!");
				RequestDispatcher rd = request.getRequestDispatcher("testSubmit.jsp?status=again");
	            rd.forward(request, response);
	            return;
			}
			
			sql = "select POSITION_NAME from election_positions where election_id="+electionId;
			rs = st.executeQuery(sql);
			
			while(rs.next())
			{
				System.out.println(this.getClass().getSimpleName()+" Debug2: Inside Resultset for sql query: "+sql);
				String positionName = rs.getString("POSITION_NAME");
				String vote = request.getParameter(positionName);
				String voter = request.getParameter("member_id");
				
				sql = "insert into election_votes values("+electionId+","+voter+",'"+positionName+"',"+vote+");";
				System.out.println(this.getClass().getSimpleName()+" Debug3: SQL Statement for insert query- "+sql);
				Statement st1 = conn.createStatement();
				st1.executeUpdate(sql);
			}
			System.out.println("You have Casted Your Vote!!!");
			RequestDispatcher rd = request.getRequestDispatcher("testSubmit.jsp?status=voted");
            rd.forward(request, response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
