/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unimol.mywebapp.examsessions;

import com.google.gson.Gson;
import it.unimol.my.elencoappelli.ExamSessionsManager;
import it.unimol.mywebapp.configuration.ConfigurationManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raven
 */
@WebServlet(name = "GetExamSessions", urlPatterns = {"/GetExamSessions"})
public class ExamSessionsViewer extends HttpServlet {
    
    
    ExamSessionsManager examSessionManager;
    ConfigurationManager configManager;
    String token;

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
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        token = configManager.getToken();
        
        
    }
    
    
    
    private void getExamSessions(String requestToken, String credentials){
        
        if(requestToken.equals(token) && credentials.equals(null)){
        
            examSessionManager =  ExamSessionsManager.getInstance();
        
            Map<String, String> examSessionsList = examSessionManager.getExtractor().getExamSessions("URL");
            
            examSessionsList.put("Name", null);
        
            examSessionsList.put("CFU", null);
        
            examSessionsList.put("Professor", null);
        
            examSessionsList.put("Date", null);
        
            examSessionsList.put("ExpiringDate", null);
        
            examSessionsList.put("Room", null);
            
            examSessionsList.put("Notes", null);
            
            Gson gson = new Gson();
            gson.toJson(examSessionsList);
            
            
        }
    }
    
    private void getEnrolledExams(String requestToken, String credentials){
        
        if(requestToken.equals(token) && credentials.equals(null)){
            
            examSessionManager = ExamSessionsManager.getInstance();
            
             Map<String, String> examSessionsList = examSessionManager.getExtractor().getExamSessions("URL");
            
            examSessionsList.put("Name", null);
        
            examSessionsList.put("CFU", null);
        
            examSessionsList.put("Professor", null);
        
            examSessionsList.put("Date", null);
        
            examSessionsList.put("ExpiringDate", null);
        
            examSessionsList.put("Room", null);
            
            examSessionsList.put("Notes", null);
            
            examSessionsList.put("Enrolled", null);
            
            examSessionsList.put("EnrollmentPosition", null);
            
            Gson gson = new Gson();
            gson.toJson(examSessionsList);
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
