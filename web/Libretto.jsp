<%@page import="rocks.teammolise.myunimol.webapp.UserInfo"%>
<%@page import="rocks.teammolise.myunimol.jsputils.JspUtils"%>
<%
    JspUtils utils = new JspUtils(request, response, session, out);

    if (!utils.checkLogin()) {
        return;
    }
%>

<html>
    <head>
        <title>MyUnimol</title>
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
        <link rel="import" href="our_components/fp-recordbook/fp-recordbook.html">
    </head>

    <body>
    <core-ajax auto
               id='ajax' 
               method='POST'
               url="RecordBookServlet" 
               params='{}' 
               handleAs='json'>
    </core-ajax>

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
			freeze();
            var ajax = document.getElementById("ajax");

            ajax.addEventListener("core-response", function (event) {
            	document.getElementById("fprecordbook").averages = {
            		weightedAverage: event.detail.response.weightedAverage,
            		average: event.detail.response.average
            	}
            	
                document.getElementById("fprecordbook").exams = event.detail.response.exams;
            	unfreeze();
            });
        });
    </script>
</body>
</html>