<%@page import="rocks.teammolise.myunimol.webapp.configuration.ConfigurationManagerHandler"%>
<%@page import="rocks.teammolise.myunimol.webapp.configuration.ConfigurationManager"%>
<%
	ConfigurationManager configMgr = ConfigurationManagerHandler.getInstance();
	String urlToReditectTo = configMgr.getWebAppURL()+"Login.jsp";
	response.sendRedirect(urlToReditectTo);
%>
