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
	private final String UPLOAD_DIRECTORY = "C:/uploads";
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
		
		File file = File.createTempFile(fileName, ".jpg", uploads);

		try (InputStream input = filePart.getInputStream()) {
			Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
		}
		try
		{
			HttpSession session = request.getSession(true);
			session = request.getSession(true);
			ElectionBean eBean = (ElectionBean)session.getAttribute("currentElection");
			if(eBean==null)
				System.out.println("EBEAN NULL");
			UserBean uBean = (UserBean)session.getAttribute("currentUser");
			if(uBean==null)
				System.out.println("UBEAN NULL");
			//System.out.println(eBean.getElectionId());
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false","root","");
			
			Statement st = conn.createStatement();
			System.out.println(this.getClass().getSimpleName()+" Debug: After connection established...");
			System.out.println(this.getClass().getSimpleName()+": Debug -"+eBean.getElectionId()+uBean.getMember_id()+request.getParameter("position_name")+file.getAbsolutePath()+request.getParameter("profile"));
			String sql = "insert into election_candidates values("+eBean.getElectionId()+","+uBean.getMember_id()+",'"+request.getParameter("position_name")+"','"+file.getAbsolutePath().replaceAll("/", "//")+"','"+request.getParameter("profile")+"')";
			st.executeUpdate(sql);
			
			
			/*request.setAttribute("message", "File Uploaded Successfully");
			request.getRequestDispatcher("result.jsp").forward(request, response);
*/			
			return;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
				
		           
    }
}
