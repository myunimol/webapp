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
 * @author emilio
 */
@WebServlet(name = "getAddressBook", urlPatterns = {"/getAddressBook"})
public class GetAddressBoookStub extends HttpServlet {
	private static final long serialVersionUID = 7825410218885935233L;

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
        
        String token = request.getParameter("token");
        String realToken = ConfigurationManagerHandler.getInstance().getToken();
        
        try {
             //Controllo del token
           if(token != null && token.equals(realToken)){
        	   out.println("{\"contact\": [{\"fullname\": \"Matteo Merola\", \"role\": \"Studente\", \"building\": \"Università Degli Studi di Salerno\", \"internalTelephone\": \"2917\", \"externalTelephone\": \"+39 0874 404 917\", \"email\": \"mattmezza@gmail.com\"}, {\"fullname\": \"Simone Scalabrino\", \"role\": \"Studente\", \"building\": \"Università Degli Studi di Salerno\", \"internalTelephone\": \"23136\", \"externalTelephone\": \"+39 0869 404 417\", \"email\": \"intersimone999@gmail.com\"},{\"fullname\": \"Fausto Sfasato\", \"role\": \"Smanettone\", \"building\": \"Scienze Delle Pulizie\", \"internalTelephone\": \"0000\", \"externalTelephone\": \"+39 1234 404 917\", \"email\": \"stosfasatocostantemente@gmail.com\"}]}");     
           } else {
        	   out.println("{\"result\": \"unauthorized\"}");
           }
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
