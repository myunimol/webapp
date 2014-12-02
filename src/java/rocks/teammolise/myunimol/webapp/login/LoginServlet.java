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
        //l'url del servizio di login
        String urlLogin = ConfigurationManagerHandler.getInstance().getWebServicesRoot() + "TestCredentials";
        try {
            //ricavo un'istanza di configManager da dove prenderò il token
            ConfigurationManager configManager = ConfigurationManagerHandler.getInstance();
            //sono per ricavare il contenuto degli input field
            String user = (String) request.getParameter("username");
            String password = (String) request.getParameter("password");
            
            String token = configManager.getToken();//il token ancora non ce l'ho a disp!!
            //fa la richiesta post al servizio di login
            HttpResponse<String> stringResponse = Unirest.post(urlLogin)
                    .header("accept", "application/json")
                    .field("username", user)
                    .field("password", password)
                    .field("token", token)
                    .asString();
            //il parser del json 
            JSONObject loginJSON = new JSONObject(stringResponse.getBody());
            if (loginJSON.getString("result").equals("negative")) {
                out.print(loginJSON.toString());
            } else {
                //inserisco i dati presi dal JSON nel bean dell'utente
                UserInfo userInfo = new UserInfo();
                userInfo.setName(loginJSON.getString("name"));
                userInfo.setSurname(loginJSON.getString("surname"));
                userInfo.setStudentClass(loginJSON.getString("studentClass"));
                userInfo.setStudentId(loginJSON.getString("studentId"));
                userInfo.setUsername(user);
                userInfo.setPassword(password); //da inserire le altre info x la schermata di benvenuto
                //inserisco nella sessione i dati sull'utente
                HttpSession session = request.getSession(true);
                session.setAttribute("userInfo", userInfo);
                out.print(loginJSON.toString());
            }
        } catch (UnirestException e) {

            out.print("Errore nel Login");
        } catch (JSONException e) {
        	out.println(e.getMessage());
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
