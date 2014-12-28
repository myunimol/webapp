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
 * @author Vincenzo
 */
@WebServlet(name = "getRecordBook", urlPatterns = {"/getRecordBook"})

public class GetRecordBook extends HttpServlet {
	private static final long serialVersionUID = -4285059319469387107L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        String token = request.getParameter("token");
        String realToken = ConfigurationManagerHandler.getInstance().getToken();
        
        try {
            if (token != null && token.equals(realToken)) {
                out.println("{\"exams\": ["
                		+ "{\"id\": \"121212\", \"name\":\"Matematica\", \"cfu\":12, \"vote\":\"IDO\", \"date\":\"28/11/2014\", \"year\":\"2014/2015\"},"
                		+ "{\"id\": \"121512\", \"name\":\"Biologia\", \"cfu\":6, \"vote\":\"30\", \"date\":\"12/9/2014\", \"year\":\"2014/2015\"},"
                		+ "{\"id\": \"121362\", \"name\":\"Anatomia\", \"cfu\":2, \"vote\":\"18\", \"date\":\"5/05/2014\", \"year\":\"2013/2014\"},"
                		+ "{\"id\": \"131312\", \"name\":\"Fisica\", \"cfu\":12, \"vote\":\"27\", \"date\":\"11/09/2013\", \"year\":\"2013/2014\"},"
                		+ "{\"id\": \"121382\", \"name\":\"Cardiologia\", \"cfu\":20, \"vote\":\"24\", \"date\":\"17/02/2013\", \"year\":\"2013/2014\"}"
                		+ "], \"average\":25.4, \"weightedAverage\":26.0}");
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
