/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rocks.teammolise.myunimol.webapp.issues;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.json.JSONObject;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import rocks.teammolise.myunimol.api.APIConsumer;
import rocks.teammolise.myunimol.webapp.UserInfo;

/**
 * 
 * @author Matteo Merola
 */
@WebServlet(name = "SendProblem", urlPatterns = { "/SendProblem" })
public class SendProblem extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
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
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			if (request.getSession().getAttribute("userInfo") == null) {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
				return;
			}

			UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");

			String username = userInfo.getUsername();
			String password = userInfo.getPassword();

			String type = request.getParameter("type");
			String other = request.getParameter("other");
			String details = request.getParameter("details");
			
		
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			MongoDatabase db = mongoClient.getDatabase("myunimol");
			
			MongoCollection<Document> collection = db.getCollection("problems");
			Map<String, Object> userinfo = new HashMap<String, Object>();
			userinfo.put("name", userInfo.getName());
			userinfo.put("surname", userInfo.getSurname());
			userinfo.put("course", userInfo.getCourse());
			userinfo.put("department", userInfo.getDepartment());
			userinfo.put("totalCFU", userInfo.getTotalCFU());
			userinfo.put("username", userInfo.getUsername());
			userinfo.put("studentId", userInfo.getStudentId());
			userinfo.put("enrolledExams", userInfo.getEnrolledExams());
			userinfo.put("registrationDate", userInfo.getRegistrationDate());
			userinfo.put("studentClass", userInfo.getStudentClass());
			userinfo.put("coursePath", userInfo.getCoursePath());
			userinfo.put("courseLength", userInfo.getCourseLength());
			Document userInfoDoc = new Document(userinfo);
			Map<String, Object> problem = new HashMap<String, Object>();
			problem.put("type", type);
			if(other != null)
				problem.put("other", other);
			problem.put("details", details);
			problem.put("userInfo", userInfoDoc);
			collection.insertOne(new Document(problem));
			
			out.println("{\"result\":\"success\"}");
		} catch (Exception ex) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
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
