<%@page import="rocks.teammolise.myunimol.webapp.UserInfo"%>
<%@page import="rocks.teammolise.myunimol.jsputils.JspUtils"%>
<% 
	JspUtils utils = new JspUtils(request, response, session, out);
	
	if (!utils.checkLogin())
        return;
%>

<html>
    <head>
        <title>MuUnimol</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
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
        utils.writePolymerImport("paper-icon-button");
        utils.writePolymerImport("core-ajax");
        %>
        
        <link rel="import" href="our_components/gw-session/gw-session.html">
    </head>

	<body>
    	<core-ajax auto
    		id='ajax' 
    		method='POST'
    		url="GetExamSessionsServlet" 
    		params='{}' 
    		handleAs='json'>
    	</core-ajax>

		<core-drawer-panel id="drawerPanel">
			<% utils.writeLeftMenu("Appelli", 3); %>
			
		  	<core-header-panel main>
		  		<core-toolbar id="mainheader">
		      		<paper-icon-button id="navicon" icon="menu"></paper-icon-button>
		      		<span flex style="font-size: 28;">
		      			<strong>Appelli</strong>
		      		</span>
		    	</core-toolbar>
		    	<div id='activeContentHandler' class="content">
		    		<gw-session id='gwsession'></gw-session>
		    	</div>
		  	</core-header-panel>
		  	
		</core-drawer-panel>
	    <script>
	    	document.addEventListener('polymer-ready', function() {
	
	            var ajax = document.getElementById("ajax");
	            
	            ajax.addEventListener("core-response", function (event) {
	            	document.getElementById("gwsession").sessions = event.detail.response.exams;
	            });
	        });
	    </script>
</body>
</html>