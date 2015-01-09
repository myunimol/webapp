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

<!DOCTYPE html>
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
        <link rel='import' href='our_components/myunimol-ajax/myunimol-ajax.html' />
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
		    #no-items {
		    	position: relative;
		    	display: block;
		    	width: 60%;
		    	margin: 20%;
		    	color: #526E9C;
		    	text-align: center;
		    }
		    #no-items > img {
		    	width: 50px;
		    }
		</style>
    </head>

    <body>
    <myunimol-ajax
               id='ajaxAteneo' 
               method='POST'
               url="GetUniversityNewsServlet" 
               params='{}' 
               handleAs='json'>
    </myunimol-ajax>
    
    <myunimol-ajax
               id='ajaxDip' 
               method='POST'
               url="GetDepartmentNewsServlet" 
               params='{}' 
               handleAs='json'>
    </myunimol-ajax>
    
    <myunimol-ajax auto
               id='ajaxAvvisi' 
               method='POST'
               url="GetNewsBoardServlet" 
               params=''
               handleAs='json'>
    </myunimol-ajax>

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
                    <div id="no-items" style="display: none;">
                    	<img src="img/sad.png" alt="sad emoji" />
                    	<p id="default-msg"></p>
                    </div>
                </div>
            </div>
        </core-header-panel>

    </core-drawer-panel>
    <script>
        document.addEventListener('polymer-ready', function () {
			document.ajaxAction = function (event) {
				if(event.detail.response.result=="failure") {
					document.getElementById("default-msg").innerHTML = event.detail.response.msg;
					document.getElementById("no-items").style.display = "block";
					document.getElementById("cdrnews").newsList = null;
				} else {
					document.getElementById("no-items").style.display = "none";
                	document.getElementById("cdrnews").newsList = event.detail.response.newsList;
				}
            }
			
            document.ajaxAteneo = document.getElementById("ajaxAteneo");
            document.ajaxDip = document.getElementById("ajaxDip");
            document.ajaxAvvisi = document.getElementById("ajaxAvvisi");

            document.ajaxAteneo.addEventListener("myunimol-response", document.ajaxAction);
            document.ajaxDip.addEventListener("myunimol-response", document.ajaxAction);
            document.ajaxAvvisi.addEventListener("myunimol-response", document.ajaxAction);
            
            var avvisi = document.getElementById('avvisi');
            var ateneo = document.getElementById('ateneo');
            var dipartimento = document.getElementById('dipartimento');
            
            avvisi.addEventListener('click', function() {
            	document.ajaxAvvisi.go();
            })
            
            ateneo.addEventListener('click', function() {
            	document.ajaxAteneo.go();
            })
            
            dipartimento.addEventListener('click', function() {
            	document.ajaxDip.go();
            })
        });
    </script>
</body>
</html>
