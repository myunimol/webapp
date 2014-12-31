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
 * @author Christian
 */
@WebServlet(name = "getDepartmentNews", urlPatterns = {"/getDepartmentNews"})
public class GetDepartmentNewsStub extends HttpServlet {
	private static final long serialVersionUID = -6532494124890381021L;

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
        	   out.println("{\"newsList\": ["
        	   		+ "{\"date\": \"16/12/2014\", \"title\":\"\", \"link\":\"unimol.it\", \"text\": \"La lezione di Tecnologie di Sviluppo per il Web del prof. Fasano prevista per il 18 dicembre p.v. &egrave; sospesa.\"},"
        	   		+ "{ \"date\": \"14/12/2014\", \"title\":\"\", \"link\":\"unimol.it\", \"text\": \"La lezione di Elettronica digitale del prof. Preite prevista per il 18 dicembre p.v. &egrave; sospesa.\"},"
        	   		+ "{ \"date\": \"16/12/2014\", \"title\":\"\", \"link\":\"unimol.it\", \"text\": \"La lezione di Tecnologie di Sviluppo per il Web del prof. Fasano prevista per il 18 dicembre p.v. &egrave; sospesa.\"},"
        	   		+ "{ \"date\": \"16/12/2014\", \"title\":\"\", \"link\":\"unimol.it\", \"text\": \"La lezione di Tecnologie di Sviluppo per il Web del prof. Fasano prevista per il 18 dicembre p.v. &egrave; sospesa.\"},"
        	   		+ "{ \"date\": \"16/12/2014\", \"title\":\"\", \"link\":\"unimol.it\", \"text\": \"La lezione di Tecnologie di Sviluppo per il Web del prof. Fasano prevista per il 18 dicembre p.v. &egrave; sospesa.\"},"
        	   		+ "{ \"date\": \"16/12/2014\", \"title\":\"\", \"link\":\"unimol.it\", \"text\": \"La lezione di Tecnologie di Sviluppo per il Web del prof. Fasano prevista per il 18 dicembre p.v. &egrave; sospesa.\"},"
        	   		+ "{ \"date\": \"16/12/2014\", \"title\":\"\", \"link\":\"unimol.it\", \"text\": \"La lezione di Tecnologie di Sviluppo per il Web del prof. Fasano prevista per il 18 dicembre p.v. &egrave; sospesa.\"}"
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
