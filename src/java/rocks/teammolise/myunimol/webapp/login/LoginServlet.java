/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rocks.teammolise.myunimol.webapp.login;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
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
import rocks.teammolise.myunimol.webapp.configuration.ConfigurationManager;
import rocks.teammolise.myunimol.webapp.configuration.ConfigurationManagerHandler;

/**
 * 
 * @author Federica Mauriello
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
            //sono per ricavare il contenuto degli input field
            String username = (String) request.getParameter("username");
            String password = (String) request.getParameter("password");
            
            JSONObject loginJSON = new APIConsumer().consume("testCredentials", username, password);
            
            if (loginJSON.getString("result").equals("negative")) {
                out.print(loginJSON.toString());
            } else {
                //inserisco i dati presi dal JSON nel bean dell'utente
                UserInfo userInfo = new UserInfo();
                userInfo.setName(loginJSON.getString("name"));
                userInfo.setSurname(loginJSON.getString("surname"));
                userInfo.setStudentClass(loginJSON.getString("studentClass"));
                userInfo.setStudentId(loginJSON.getString("studentId"));
                /*userInfo.setTaxes(loginJSON.getString("taxes"));
                userInfo.setCareerPlan(loginJSON.getString("careerPlan"));
                userInfo.setAvailableExams(loginJSON.getString("availableExams"));
                userInfo.setEnrolledExams(loginJSON.getString("enrolledExams"));*/
                userInfo.setUsername(username);
                userInfo.setPassword(password); //da inserire le altre info x la schermata di benvenuto
                HttpSession session = request.getSession(true);
                session.setAttribute("userInfo", userInfo);
                
                out.print(loginJSON.toString());
            }
        } catch (UnirestException e) {
        	response.sendError(200, "Internal Server Error");
        } catch (JSONException e) {
        	response.sendError(200, "Internal Server Error");
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
