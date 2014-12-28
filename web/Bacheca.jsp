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

        <style>
            :host {
                position: absolute;
                width: 100%;
                height: 100%;
                box-sizing: border-box;
            }
            #core_toolbar {
                border-radius: 2px;
                box-sizing: border-box; 
                color: rgb(255, 255, 255);
                fill: rgb(255, 255, 255);
                height: auto;
                position: relative;
                display: box;
                background-color: rgb(1, 87, 155);
            }
            #news-lav {
                border-radius: 5px; 
                box-sizing: border-box; 
                width: 100%;
                -webkit-overflow-scrolling: touch;
                padding-right:2px;
                color: rgb(255, 255, 255);
                fill: rgb(255, 255, 255);
                background-color: rgb(1, 87, 155);
                overflow-y: no-content;
            }
        </style>

        <link rel="import" href="our_components/cdr-news/cdr-news.html">

    </head>

    <body>
    <core-ajax auto
               id='ajax' 
               method='POST'
               url="GetNewsBoardServlet" 
               params='{}' 
               handleAs='json'>
    </core-ajax>

    <core-drawer-panel id="drawerPanel">
        <% utils.writeLeftMenu("Bacheca", 5);%>
        <core-header-panel main>
            <core-toolbar id="mainheader">
                <paper-icon-button id="navicon" icon="menu"></paper-icon-button>
                <span flex style="font-size: 28;">Bacheca
                </span>
            </core-toolbar>

            <div id='activeContentHandler' class="content">
                <div id="news-lav">
                    <cdr-news id='cdrnews'></cdr-news>
                </div>

            </div>
        </core-header-panel>

    </core-drawer-panel>
    <script>
        document.addEventListener('polymer-ready', function () {

            var ajax = document.getElementById("ajax");

            ajax.addEventListener("core-response", function (event) {
                document.getElementById("cdrnews").board = event.detail.response.news;
            });
        });
    </script>
</body>
</html>
