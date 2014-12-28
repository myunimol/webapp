package rocks.teammolise.myunimol.jsputils;

import java.io.IOException;

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
		out("<link rel='stylesheet' type='text/css' href='style/style.css'>");
		out("<script src='bower_components/platform/platform.js'></script>");
		out("<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'></script>");
		out("<script src='scripts/main.js'></script>");
		out("<link rel='import' href='bower_components/font-roboto/roboto.html'>");
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
		out("<core-item id='bacheca_item' icon='announcement' label='News' horizontal center layout><a href='Bacheca.jsp'></a></core-item>");
		out("<core-item id='piano_item' icon='view-list' label='Piano di studi' horizontal center layout><a href=''></a></core-item>");
                out("<core-item id='tasse_item' icon='payment' label='Pagamenti' horizontal center layout><a href='Tasse.jsp'></a></core-item>");
	}
	
	private void writeStudentInfo() throws IOException {
        out("<div id=\"student_name\" tool horizontal layout center start-justified>" + this.user.getName() + " " + this.user.getSurname() + "</div>");
        out("<div id=\"student_id\" tool start-justified>" + this.user.getStudentId() + "</div>");
	}
	
	private void out(String pString) throws IOException {
		out.print(pString);
	}
}
