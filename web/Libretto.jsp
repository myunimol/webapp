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
        <title>Libretto</title>
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
            utils.writePolymerImport("paper-icon-button");
            utils.writePolymerImport("core-ajax");
        %>
        
        <link rel="import" href="our_components/fp-recordbook/fp-recordbook.html">
        <link rel='import' href='our_components/myunimol-ajax/myunimol-ajax.html' />
    </head>

    <body>
    <myunimol-ajax auto
               id='ajax' 
               method='POST'
               url="RecordBookServlet" 
               params='{}' 
               handleAs='json'>
    </myunimol-ajax>

    <core-drawer-panel id="drawerPanel">
        <% utils.writeLeftMenu("Libretto", 1);%>

        <core-header-panel main>
            <core-toolbar id="mainheader">
                <paper-icon-button id="navicon" icon="menu"></paper-icon-button>
                <span flex style="font-size: 28;">
                    <strong>Libretto</strong>
                </span>
            </core-toolbar>
            
            <div id='activeContentHandler' class="content"> 
                <fp-recordbook id='fprecordbook'></fp-recordbook>    
            </div>
        </core-header-panel>

    </core-drawer-panel>
    <script>
        document.addEventListener('polymer-ready', function () {
            var ajax = document.getElementById("ajax");

            ajax.addEventListener("myunimol-response", function (event) {
            	document.getElementById("fprecordbook").averages = {
            		weightedAverage: event.detail.response.weightedAverage,
            		average: event.detail.response.average,
            		base: event.detail.response.base
            	}
            	
                document.getElementById("fprecordbook").exams = event.detail.response.exams;
            });
        });
    </script>
</body>
</html>