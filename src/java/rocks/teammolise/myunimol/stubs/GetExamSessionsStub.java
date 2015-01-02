/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rocks.teammolise.myunimol.stubs;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rocks.teammolise.myunimol.webapp.configuration.ConfigurationManagerHandler;

/**
 *
 * @author Silvio
 */
@WebServlet(name = "getExamSessions", urlPatterns = {"/getExamSessions"})
public class GetExamSessionsStub extends HttpServlet {
	private static final long serialVersionUID = -3721713145164305739L;

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
      
        
        try {
        	   out.println("{\"exams\": ["
        	   		+ "{\"name\": \"Matematica\",\"cfu\": \"12\",\"professor\": \"Capobianco\",\"date\": \"12/12/2013\",\"expiringDate\": \"01/12/2013\",\"room\": \"Galileo Galilei\",\"notes\": \"\",\"enrolled\": \"12\",\"session\": \"2013/2014\", \"id\": \"19#10010#3130517#1579806#2011#10019#9998#2011#2#2\"},"
        	   		+ "{\"name\": \"Fisica\",\"cfu\": \"7\",\"professor\": \"Marmolino\",\"date\": \"12/11/2013\",\"expiringDate\": \"01/11/2013\",\"room\": \"Isernia II\",\"notes\": \"\",\"enrolled\": \"44\",\"session\": \"2013/2014\", \"id\": \"19#34010#3130517#1579806#2012#10019#9998#2011#2#2\"}"
        	   		+ "]}");     
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
