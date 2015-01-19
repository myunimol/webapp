package rocks.teammolise.myunimol.jsputils;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import rocks.teammolise.myunimol.webapp.UserInfo;

public class JspUtils {
	@SuppressWarnings("unused")
	private HttpServletRequest request;
	private HttpServletResponse response;
	private HttpSession session;
	private JspWriter out;
	private UserInfo user;
	
	/**
	 * Crea un'instanza della classe utility
	 * @param pRequest La richiesta (usare solo request)
	 * @param pResponse La risposta (usare solo response)
	 * @param pSession La sessione (usare solo session)
	 * @param pOut L'output (usare solo out)
	 */
	public JspUtils(HttpServletRequest pRequest, HttpServletResponse pResponse, HttpSession pSession, JspWriter pOut) {
		this.request = pRequest;
		this.response = pResponse;
		this.session = pSession;
		this.out = pOut;
	}
	
	/**
	 * Scrive automaticamente il menu di sinistra.
	 * @param pSelectedName Nome della pagina attuale (e quindi della voce da selezionare)
	 * @param pSelectedId ID della voce da selezionare nel menu
	 * @throws IOException
	 */
	public void writeLeftMenu(String pSelectedName, int pSelectedId) throws IOException {
		out("<core-header-panel drawer>");
		out("<core-toolbar id='navheader'>");
		this.writeStudentInfo();
    	out("</core-toolbar>");
    	out("<core-menu selected='" + pSelectedName + "' valueattr='label' selectedindex='" + pSelectedId + "' id='core_menu' icon='extension' theme='core-light-theme'>");
        this.writeMainMenu();
        out("</core-menu>");
        out("</core-header-panel>");
	}
	
	/**
	 * Scrive gli import standard necessari, quindi script (JQuery e Polymer), css (style.css) e font (Roboto)
	 * @throws IOException
	 */
	public void writeStandardImports() throws IOException {
		out("<meta name='mobile-web-app-capable' content='yes'>");
		out("<link rel='manifest' href='style/chromeManifest.json'>");
		
		out("<link rel='stylesheet' type='text/css' href='style/style.css' />");
		out("<script src='bower_components/platform/platform.js'></script>");
		out("<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'></script>");
		out("<script src='scripts/safariWebApp.js'></script>");
		out("<script src='scripts/main.js'></script>");
		out("<link rel='icon' sizes='192x192' href='img/Android/logo4x.png'>");
		out("<link rel=\"apple-touch-icon\" href=\"img/ios/2x.png\" />");
		out("<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"img/ios/3x.png\" />");
		out("<link rel=\"apple-touch-icon\" sizes=\"76x76\" href=\"img/ios/1x.png\" />");
		out("<link rel=\"apple-touch-icon\" sizes=\"152x152\" href=\"img/ios/2-2x.png\" />");
		out("<link rel=\"apple-touch-icon\" sizes=\"58x58\" href=\"img/ios/0x.png\" />");
		out("<link rel='import' href='bower_components/font-roboto/roboto.html' />");
		out("<link rel='import' href='bower_components/paper-spinner/paper-spinner.html' />");
		out("<link rel='import' href='bower_components/paper-toast/paper-toast.html' />");
	}
	
	/**
	 * Scrive l'import di una componente polymer standard. Ad esempio, se si vuole importare "bower_components/core-icon/core-icon.html"
	 * basta passare come parametro "core-icon" e questo metodo scrive automaticamente l'import. Non funziona nei casi in cui l'import
	 * non abbia nome della cartella e nome del file html uguali o nel caso in cui questi non siano componenti base di polymer.
	 * @param pPolymerPath
	 * @throws IOException
	 */
	public void writePolymerImport(String pPolymerPath) throws IOException {
		out("<link rel='import' href='bower_components/" + pPolymerPath + "/" + pPolymerPath + ".html'>");
	}
	
	/**
	 * Scrive l'import di una componente polymer standard. Ad esempio, se si vuole importare "bower_components/core-icon/core-icon.html"
	 * basta passare come parametro "core-icon" e questo metodo scrive automaticamente l'import. Non funziona nei casi in cui l'import
	 * non abbia nome della cartella e nome del file html uguali o nel caso in cui questi non siano componenti base di polymer.
	 * @param pPolymerPath
	 * @throws IOException
	 */
	public void directImport(String pPolymerPath) throws IOException {
		List<String> content = Files.readAllLines(Paths.get(request.getServletContext().getRealPath(pPolymerPath)), Charset.defaultCharset());
		
		for (String string : content)
			out(string + "\n");
	}
	
	/**
	 * Controlla se il login è stato effettuato. Se il risultato è negativo, si deve eseguire un "return".
	 * @return true se il login è stato effettuato, false altrimenti
	 * @throws IOException
	 */
	public boolean checkLogin() throws IOException {
		if (this.session == null || this.session.getAttribute("userInfo") == null) {
	        this.response.sendRedirect("index.jsp");
	        return false;
	    }
		
		this.user = (UserInfo)session.getAttribute("userInfo");
		
		return true;
	}
	
	/**
	 * Restituisce le informazioni sull'utente in sessione
	 * @return
	 */
	public UserInfo getUser() {
		return this.user;
	}
	
	private void writeMainMenu() throws IOException {
		out("<core-item id='home_item' icon='home' label='Home' horizontal center layout active><a href='Home.jsp'></a></core-item>");
		out("<core-item id='libretto_item' icon='folder-shared' label='Libretto' horizontal center layout><a href='Libretto.jsp'></a></core-item>");
		out("<core-item id='docenti_item' icon='mail' label='Rubrica' horizontal center layout><a href='Rubrica.jsp'></a></core-item>");
		out("<core-item id='appelli_item' icon='assignment' label='Appelli' horizontal center layout><a href='Appelli.jsp'></a></core-item>");
		out("<core-item id='bacheca_item' icon='announcement' label='News' horizontal center layout><a href='News.jsp'></a></core-item>");
		//out("<core-item id='warning' icon='warning' label='Bacheca' horizontal center layout><a href='Bacheca.jsp'></a></core-item>");
		out("<core-item id='tasse_item' icon='payment' label='Pagamenti' horizontal center layout><a href='Tasse.jsp'></a></core-item>");
		out("<core-item id='logout_item' icon='exit-to-app' label='Logout' horizontal center layout><a href='LogoutServlet'></a></core-item>");
	}
	
	private void writeStudentInfo() throws IOException {
        out("<div id=\"student_name\" tool horizontal layout center start-justified>" + this.user.getName() + " " + this.user.getSurname() + "</div>");
        out("<div id=\"student_id\" tool start-justified>" + this.user.getStudentId() + "</div>");
	}
	
	private void out(String pString) throws IOException {
		out.print(pString);
	}
}
