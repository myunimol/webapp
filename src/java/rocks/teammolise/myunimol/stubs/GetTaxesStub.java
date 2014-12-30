package rocks.teammolise.myunimol.stubs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Stub che restituisce le tasse
 */
@WebServlet(name = "GetTaxesStub", urlPatterns = {"/GetTaxesStub"})
public class GetTaxesStub extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		try {
			writer.write("{\"result\":\"success\",\"taxes\":[{\"billId\":\"617602\",\"bullettinCode\":\"00000000000000617602\",\"year\":\"11/12\",\"description\":\"Tasse di Iscrizione\",\"expiringDate\":\"20/09/2011\",\"amount\":284.62,\"statusPayment\":\"pagato\"},{\"billId\":\"584872\",\"bullettinCode\":\"00000000000000584872\",\"year\":\"10/11\",\"description\":\"Tasse di Iscrizione\",\"expiringDate\":\"01/10/2010\",\"amount\":271.54,\"statusPayment\":\"non pagato\"}]}");
		} finally {
			writer.close();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

}
