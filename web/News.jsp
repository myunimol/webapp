<%-- 
    Document   : Bacheca
    Created on : 15-dic-2014, 14.42.16
    Author     : Christian
--%>

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
        <title>News</title>
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
            utils.writePolymerImport("paper-tabs");
        %>

        <link rel="import" href="our_components/cdr-news/cdr-news.html">
		<style shim-shadowdom>
			paper-tabs {
		      background-color: transparent;
		      color: #000';
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
    <core-ajax
               id='ajaxAteneo' 
               method='POST'
               url="GetUniversityNewsServlet" 
               params='{}' 
               handleAs='json'>
    </core-ajax>
    
    <core-ajax
               id='ajaxDip' 
               method='POST'
               url="GetDepartmentNewsServlet" 
               params='{}' 
               handleAs='json'>
    </core-ajax>
    
    <core-ajax auto
               id='ajaxAvvisi' 
               method='POST'
               url="GetNewsBoardServlet" 
               params=''
               handleAs='json'>
    </core-ajax>

    <core-drawer-panel id="drawerPanel">
        <% utils.writeLeftMenu("News", 4);%>
        <core-header-panel main>
            <core-toolbar id="mainheader">
                <paper-icon-button id="navicon" icon="menu"></paper-icon-button>
                <span flex style="font-size: 28;">News</span>
            </core-toolbar>
			<paper-tabs selected='0'>
         		<paper-tab id='avvisi'>Avvisi</paper-tab>
         		<paper-tab id='ateneo'>Ateneo</paper-tab>
         		<paper-tab id='dipartimento'>Dipartimento</paper-tab>
            </paper-tabs>
            <div id='activeContentHandler' class="content">
				<div id="news-lav">
                    <cdr-news id='cdrnews'></cdr-news>
                </div>
            </div>
        </core-header-panel>

    </core-drawer-panel>
    <script>
        document.addEventListener('polymer-ready', function () {
			freeze();
			document.ajaxAction = function (event) {
                document.getElementById("cdrnews").newsList = event.detail.response.newsList;
                unfreeze();
            }
			
            document.ajaxAteneo = document.getElementById("ajaxAteneo");
            document.ajaxDip = document.getElementById("ajaxDip");
            document.ajaxAvvisi = document.getElementById("ajaxAvvisi");

            document.ajaxAteneo.addEventListener("core-response", document.ajaxAction);
            document.ajaxDip.addEventListener("core-response", document.ajaxAction);
            document.ajaxAvvisi.addEventListener("core-response", document.ajaxAction);
            
            var avvisi = document.getElementById('avvisi');
            var ateneo = document.getElementById('ateneo');
            var dipartimento = document.getElementById('dipartimento');
            
            avvisi.addEventListener('click', function() {
            	freeze();
            	document.ajaxAvvisi.go();
            })
            
            ateneo.addEventListener('click', function() {
            	freeze();
            	document.ajaxAteneo.go();
            })
            
            dipartimento.addEventListener('click', function() {
            	freeze();
            	document.ajaxDip.go();
            })
        });
    </script>
</body>
</html>
