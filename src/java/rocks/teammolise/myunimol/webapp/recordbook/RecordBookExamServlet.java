package rocks.teammolise.myunimol.webapp.recordbook;

import com.mashape.unirest.http.exceptions.UnirestException;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import rocks.teammolise.myunimol.api.APIConsumer;
import rocks.teammolise.myunimol.api.AsyncAPIConsumer;
import rocks.teammolise.myunimol.webapp.UserInfo;

/**
 *
 * @author Vincenzo
 */
@WebServlet(name = "RecordBookExamServlet", urlPatterns = { "/RecordBookExamServlet" })
public class RecordBookExamServlet extends HttpServlet {
	private static final long serialVersionUID = -8595320636382451924L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			if (request.getSession().getAttribute("userInfo") == null) {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED,
						"Unauthorized");
				return;
			}

			UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
					"userInfo");

			String username = userInfo.getUsername();
			String password = userInfo.getPassword();
			String examId = request.getParameter("id");
			if (examId == null) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST,
						"Bad request");
				return;
			}

			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", examId);

			APIConsumer consumer = new APIConsumer();
			JSONObject result = consumer.consume("getRecordBookExam", username,
					password, params);
			out.print(result);

		} catch (UnirestException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
					"Internal Server Error");
		} finally {
			out.close();
		}
	}

	// <editor-fold defaultstate="collapsed"
	// desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
