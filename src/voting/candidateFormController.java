package voting;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class candidateFormController
 */
@WebServlet("/candidateFormController")
@MultipartConfig
public class candidateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String FILE = "";
	private final String UPLOAD_DIRECTORY = "C://Users//skind//voting//voting//WebContent//images";
	File uploads = new File(UPLOAD_DIRECTORY);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public candidateFormController() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		Part filePart = request.getPart("file");
		FILE = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		System.out.println(FILE);
		DateFormat df = new SimpleDateFormat("yyyyMMddhhmmS");
		String fileName = FILE.split("\\.")[0] + df.format(new Date());

		// File file = File.createTempFile(fileName, ".jpg", uploads);
		String tempFile = fileName + ".jpg";
		String wholePath = UPLOAD_DIRECTORY + "/" + tempFile;
		wholePath = wholePath.replaceAll("/", "//");
		Path sourceAs = Paths.get(wholePath);

		try (InputStream input = filePart.getInputStream()) {
			Files.copy(input, sourceAs, StandardCopyOption.REPLACE_EXISTING);
		}

		try {

			String candidateId = request.getParameter("id");
			String candidateName = request.getParameter("name");
			String candidateAddress = request.getParameter("address");
			String candidatePosition = request.getParameter("position_name");
			String candidateProfile = request.getParameter("profile");

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/evoting?autoReconnect=true&useSSL=false", "root", "");
			Statement st = conn.createStatement();
			CandidateBean cBean = new CandidateBean(candidateName, tempFile, candidateProfile, candidateAddress,
					candidatePosition);

			String sql = "select * from election_candidatestemp where election_id = 1 and candidate_id = '"+candidateId+"'";
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				String updateSQL = "update election_candidates SET image_url = '"+tempFile+"', description = '"+candidateProfile+"', Address = '"+candidateAddress+"' where candidate_id = '"+candidateId+"'";
				st.executeUpdate(updateSQL);
			}
			else {
				String insertSQL = "insert into election_candidatestemp values(1,"+candidateId+",'"+candidatePosition+"','"+tempFile+"','"+candidateProfile+"', '"+candidateAddress+"')";
				st.executeUpdate(insertSQL);
				
			}
			RequestDispatcher rd = request.getRequestDispatcher("sucess.jsp");
            rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
