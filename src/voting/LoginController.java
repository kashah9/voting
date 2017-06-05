package voting;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import voting.ElectionBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			String email = request.getParameter("email");
			String password = request.getParameter("pwd");
			System.out.println(this.getClass().getSimpleName()+" Debug1:"+email+" password:"+password);
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false","root","");
			System.out.println(this.getClass().getSimpleName()+" Debug2: After connection established...");
			Statement st = conn.createStatement();
			ElectionBean eBean = new ElectionBean();
			
			ResultSet rs = st.executeQuery("select * from voters where email='"+email+"' AND password='"+password+"'");
			System.out.print(this.getClass().getSimpleName()+" Debug3: Query Fired ");
			System.out.println("select * from voters where email='"+email+"' AND password='"+password+"'");
			if(rs.next())
			{
				System.out.print(this.getClass().getSimpleName()+" Debug4: Redirecting to profilePage ");
				request.setAttribute("key", "success");
				ProcessRequest preq = new ProcessRequest(conn);
				UserBean uBean = new UserBean();
				uBean.setMember_id(rs.getInt("MEMBER_ID"));
				int memberId = uBean.getMember_id();
				System.out.println("Debug Temp:"+memberId);
				
				eBean = preq.processing();
				HashMap<String, ArrayList<String>> candHashmap = eBean.getPositionCandidateMap();
				Set set = candHashmap.keySet();
				Iterator itr = set.iterator();
				System.out.println(set);
				
				int candidateId = 0;
				boolean flag = false;
				while(itr.hasNext()){
					
					String positionName = (String)itr.next();
					ArrayList<String> candidateList = candHashmap.get(positionName);
					
					for(String candidate: candidateList){
						String[] candidateInfo = candidate.split(";");
						candidateId = Integer.parseInt(candidateInfo[0]);
						System.out.println("Debug5: Candidate Id fetching:"+candidateId);
						if(memberId == candidateId){
							flag = true;
						}
					}
				}
				if(flag){
					HttpSession session = request.getSession(true);
					session = request.getSession(true);
					//CandidateBean cBean = new CandidateBean();
					//cBean.setCandidateId(candidateId);
					//cBean.setElectionId(eBean.getElectionId());
					//session.setAttribute("currentCandidate",cBean);
			        session.setAttribute("currentElection",eBean); 
			       /* if(uBean==null)
						System.out.println(this.getClass().getName()+" UBEAN NULL");
					*/
			        session.setAttribute("currentUser", uBean);
					RequestDispatcher rd = request.getRequestDispatcher("candPref.jsp");
					rd.forward(request, response);
				}
				else{
					HttpSession session = request.getSession(true);
					session = request.getSession(true);	    
			        session.setAttribute("currentElection",eBean); 
			        session.setAttribute("currentUser", uBean);
		            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
		            rd.forward(request, response);
				}
			}
			else
			{
				request.setAttribute("key", "failed");
	            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	            rd.forward(request, response);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
