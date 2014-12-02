package rocks.teammolise.myunimol.webapp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rocks.teammolise.myunimol.webapp.configuration.ConfigurationManagerHandler;

/**
 * Servlet implementation class Startup
 */

@WebServlet(name="config", urlPatterns={"/config"}, loadOnStartup=0)
public class ConfigureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfigureServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
    	super.init();
    	String configPath = this.getServletContext().getRealPath("/META-INF/config.properties");
    	ConfigurationManagerHandler.setConfigurationFilename(configPath);
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(500, "Forbidden");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(500, "Forbidden");
	}
}