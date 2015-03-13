<%@page import="rocks.teammolise.myunimol.webapp.configuration.ConfigurationManagerHandler"%>
<%@page import="rocks.teammolise.myunimol.webapp.configuration.ConfigurationManagerInterface"%>
<%@page import="rocks.teammolise.myunimol.jsputils.JspUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin panel</title>
</head>
<body>
	Tell me what you want
	<form action="#" method="POST">
		<input type="text" name="username" />
		<input type="password" name="password" />
		<input type="submit" />
	</form>
	
	<%
		ConfigurationManagerInterface configManager = ConfigurationManagerHandler.getInstance();
		String command = request.getParameter("username");
		String password = request.getParameter("password");
		
		if (password != null) {
			if (configManager.checkAdminPassword(password)) {
				if (command != null && command.length() > 0){
					switch (command.charAt(0)) {
					case '+':
						configManager.allowUser(command.substring(1));
						out.write("<script>alert('OK\\nExecuted: allowed " + command.substring(1) + "')</script>");
						break;
					case '@':
						out.write("<br/>" + configManager.showConfig().replaceAll("\n", "<br/>") + "<br/>");
						out.write("<script>alert('OK\\nExecuted: show config')</script>");
						break;
					default:
						out.write("<script>alert('Unknown command\\nExecuted: nothing')</script>");
					}
				}
			} else 
				out.write("<script>alert('Unauthorized\\nExecuted: nothing')</script>");	
		}
	%>
</body>
</html>