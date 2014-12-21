/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rocks.teammolise.myunimol.webapp.login;

import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.*;

import rocks.teammolise.myunimol.api.APIConsumer;
import rocks.teammolise.myunimol.webapp.UserInfo;

/**
 * 
 * @author Federica Mauriello
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/HomeServlet"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 2857028958624319384L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //il tipo di risultato della servlet
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
        	if (request.getSession().getAttribute("userInfo") == null) {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
				return;
			}
        	UserInfo userInfo = (UserInfo)request.getSession().getAttribute("userInfo");
        	
            String username = userInfo.getUsername();
            String password = userInfo.getPassword();
            
            JSONObject recordBook = new APIConsumer().consume("getRecordBook", username, password);
            JSONObject result = new JSONObject();
            result.append("average", recordBook.getString("average"));
            result.append("weightedAverage", recordBook.getString("weightedAverage"));
            
            JSONArray exams = recordBook.getJSONArray("exams");
            float acquiredCFU = 0;
            int totalExams = 0;
            for (int i = 0; i < exams.length(); i++) {
            	acquiredCFU += Integer.parseInt(exams.getJSONObject(i).getString("cfu"));
            	totalExams++;
            }
            	
            result.append("percentCFU", acquiredCFU/userInfo.getTotalCFU());
            result.append("totalExams", totalExams);
            
            out.write(result.toString());
        } catch (UnirestException e) {
        	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        } catch (JSONException e) {
        	response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        } finally {
            out.close();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
