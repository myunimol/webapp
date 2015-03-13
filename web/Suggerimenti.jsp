<%@page import="rocks.teammolise.myunimol.webapp.UserInfo"%>
<%@page import="rocks.teammolise.myunimol.jsputils.JspUtils"%>
<%
	JspUtils utils = new JspUtils(request, response, session, out);

	if (!utils.checkLogin()) {
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>MyUnimol - Suggerimenti</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%
	utils.writeStandardImports();

	utils.writePolymerImport("core-header-panel");
	utils.writePolymerImport("core-drawer-panel");
	utils.writePolymerImport("core-menu");
	utils.writePolymerImport("core-item");
	utils.writePolymerImport("core-icon-button");
	utils.writePolymerImport("core-toolbar");
	utils.writePolymerImport("core-icons");
	utils.writePolymerImport("core-icon");
	utils.writePolymerImport("core-ajax");
	utils.writePolymerImport("paper-icon-button");
	utils.writePolymerImport("paper-tabs");
%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel='import'
	href='our_components/myunimol-problem/myunimol-problem.html' />
<link rel='import'
	href='our_components/myunimol-advice/myunimol-advice.html' />
<link rel='import'
	href='our_components/myunimol-ajax/myunimol-ajax.html' />

<style shim-shadowdom>
paper-tabs {
	background-color: transparent;
	color: #000;
	box-shadow: none;
}

paper-tabs::shadow #selectionBar {
	background-color: #526E9C;
}

paper-tabs paper-tab::shadow #ink {
	color: #526E9C;
}
</style>
</head>

<body>
	<!-- Preloader snippet -->
	<div id="preloader-spinner" style="height: 100%; text-align: center;">
		<div style="margin: 0 auto">
			<h1>Solo un secondo...</h1>
			<img alt="preloader" src="img/preloader.GIF" width="64">
		</div>
	</div>
	<div id="after-loading" style="height: 100%; margin: 0; display: none">
		<!-- End Preloader snippet -->
		<core-drawer-panel id="drawerPanel"> <%
 	utils.writeLeftMenu("Suggerimenti", 7);
 %>

		<core-header-panel main> <core-toolbar
			id="mainheader"> <paper-icon-button id="navicon"
			icon="menu"></paper-icon-button> <span flex style="font-size: 28;">
			Suggerimenti </span> </core-toolbar> <paper-tabs selected='0'> <paper-tab
			id='problem'>Problema</paper-tab> <paper-tab id='advice'>Suggerimento</paper-tab>
		</paper-tabs>

		<div id='activeContentHandler' class="content">
			<div id="problemContent">
				<myunimol-problem></myunimol-problem>
			</div>
			<div id="adviceContent" style="display: none;">
				<myunimol-advice></myunimol-advice>
			</div>
		</div>
		</core-header-panel> </core-drawer-panel>
	</div>
	<!-- End Preloader snippet -->
	<script>
		document.addEventListener('polymer-ready', function() {
			var tabProblem = document.getElementById("problem");
			var tabAdvice = document.getElementById("advice");
			var problemContent = document.getElementById("problemContent");
			var adviceContent = document.getElementById("adviceContent");

			tabProblem.addEventListener("click", function() {
				adviceContent.style.display = 'none';
				problemContent.style.display = 'block';
			});

			tabAdvice.addEventListener("click", function() {
				problemContent.style.display = 'none';
				adviceContent.style.display = 'block';
			});
		});
	</script>
	<% utils.writeTrackingCode(); %>
</body>
</html>

