package voting;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class candidateFormController
 */
@WebServlet("/candidateFormController")
public class candidateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public candidateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
			String candidateId = request.getParameter("id");
			System.out.println(candidateId);
			String candidateName = request.getParameter("name");
			String candidateAddress = request.getParameter("address");
			String candidatePosition = request.getParameter("position_name");
			String candidateProfile = request.getParameter("profile");
			String candidateImage = request.getParameter("file");
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false","root","");
			Statement st = conn.createStatement();
			CandidateBean cBean = new CandidateBean(candidateName, candidateImage, candidateProfile, candidateAddress, candidatePosition);
			
			String sql = "insert into election_candidates VALUES(1, "+Integer.parseInt(candidateId)+", '"+candidatePosition+"', '"+candidateImage+"', '"+candidateProfile+"', '"+candidateAddress+"');";
			st.executeUpdate(sql);
			/*ResultSet rs = st.executeQuery("select * from election_candidates where email='"++"' "
					+ "AND password='"++"'");*/
			System.out.println(this.getClass().getSimpleName()+"Debug: Query fired");
			System.out.println(sql);
			
			System.out.println();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
