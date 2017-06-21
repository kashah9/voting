package voting;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.*;
import java.util.*;
import java.io.File;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/*
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;*/

/**
 * Servlet implementation class FileUploadController
 */
@WebServlet("/FileUploadController")
@MultipartConfig
public class FileUploadController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private static String FILE = "";
	private final String UPLOAD_DIRECTORY = "C://Users//skind//voting//voting//WebContent//images";
	File uploads = new File(UPLOAD_DIRECTORY);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadController() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		Part filePart = request.getPart("file");
		FILE = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		System.out.println(FILE);
		DateFormat df = new SimpleDateFormat("yyyyMMddhhmmS");
		String fileName = FILE.split("\\.")[0] + df.format(new Date());
		
		//File file = File.createTempFile(fileName, ".jpg", uploads);
		String tempFile = fileName+".jpg";
		String wholePath = UPLOAD_DIRECTORY+"/"+tempFile;
		wholePath = wholePath.replaceAll("/", "//");
		Path sourceAs = Paths.get(wholePath);

		try (InputStream input = filePart.getInputStream()) {
			Files.copy(input, sourceAs, StandardCopyOption.REPLACE_EXISTING);
		}
		try
		{
			HttpSession session = request.getSession(true);
			//session = request.getSession(true);
			ElectionBean eBean = (ElectionBean)session.getAttribute("currentElection");
			if(eBean==null)
				System.out.println("EBEAN NULL");
			UserBean uBean = (UserBean)session.getAttribute("currentUser");
			if(uBean==null)
				System.out.println("UBEAN NULL");
			
			System.out.println("Hello: "+uBean.toString());
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false","root","");
			
			Statement st = conn.createStatement();
			System.out.println(this.getClass().getSimpleName()+" Debug: After connection established...");
			System.out.println(this.getClass().getSimpleName()+": Debug -"+eBean.getElectionId()+"UBEAN: "+uBean.getMember_id()+"POSITION: "+request.getParameter("position_name")+" "+request.getParameter("profile"));
			
			String sql = "select * from election_candidates where election_id = '"+eBean.getElectionId()+"' and candidate_id = '"+uBean.getMember_id()+"'";
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				String updateSQL = "update election_candidates SET image_url = '"+tempFile+"', description = '"+request.getParameter("profile")+"', Address = '"+request.getParameter("address")+"' where candidate_id = '"+uBean.getMember_id()+"'";
				st.executeUpdate(updateSQL);
			}
			else {
				String insertSQL = "insert into election_candidates values("+eBean.getElectionId()+","+uBean.getMember_id()+",'"+request.getParameter("position_name")+"','"+tempFile+"','"+request.getParameter("profile")+"')";
				st.executeUpdate(insertSQL);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
            rd.forward(request, response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
				
		           
    }
}
