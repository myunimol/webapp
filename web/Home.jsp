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
		<meta name="apple-mobile-web-app-capable" content="yes" />
		
        <%
            utils.writeStandardImports();
        %>

        <link rel='import' href='bower_components/core-header-panel/core-header-panel.html' />
        <link rel='import' href='bower_components/core-drawer-panel/core-drawer-panel.html' />
        <link rel='import' href='bower_components/core-menu/core-menu.html' />
        <link rel='import' href='bower_components/core-drawer-panel/core-drawer-panel.html' />
        <link rel='import' href='bower_components/core-item/core-item.html' />
        <link rel='import' href='bower_components/core-icon-button/core-icon-button.html' />
        <link rel='import' href='bower_components/core-toolbar/core-toolbar.html' />
        <link rel='import' href='bower_components/core-icons/core-icons.html' />
        <link rel='import' href='bower_components/core-icon/core-icon.html' />
        <link rel='import' href='bower_components/paper-icon-button/paper-icon-button.html' />
        <link rel='import' href='bower_components/core-ajax/core-ajax.html' />
        <link rel='import' href='bower_components/core-collapse/core-collapse.html' />
        <link rel='import' href='bower_components/paper-button/paper-button.html' />

        <link rel='import' href='our_components/gm-circle-progress/gm-circle-progress.html' />
        <link rel='import' href='our_components/gm-navigation-tab/gm-navigation-tab.html' />
        <link rel='import' href='our_components/myunimol-ajax/myunimol-ajax.html' />

        <style>
            .main-panel{
                background-color: #eee;
            }
            /* Home Style */
            #studentInfo {
                text-align: center;
                color:#444;
            }

            #studentProgress {
                border: 1px solid #bebebe;
                padding: 16px;
                margin: 16px;
                border-radius: 5px;
                background-color: #FFF;
                box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.25);
                color: #555;
                text-align: center;
            }

            #studentProgress h2{
                margin: 5px 0px 15px 0px;
            }

            #student-detail-button {
                margin-top: 15px;
                background: #7F8EB8;
                color: #FFF;
            }
        </style>
    </head>

    <body>
    <myunimol-ajax auto
               id='ajax' 
               method='POST'
               url="HomeServlet" 
               params='{}' 
               handleAs='json'>
    </myunimol-ajax>
    
    <core-drawer-panel id="drawerPanel">
        <% utils.writeLeftMenu("Home", 0);%>

        <core-header-panel main class="main-panel">
            <core-toolbar id="mainheader">
                <paper-icon-button id="navicon" icon="menu"></paper-icon-button>
                <span flex style="font-size: 28;">
                    <strong>Home</strong>
                </span>
            </core-toolbar>
            <div id='activeContentHandler' class="content">
                <div id="studentInfo">
                    <h1> <%= utils.getUser().getName()+" "+utils.getUser().getSurname() %> </h1>
                    <h3> <%= utils.getUser().getStudentId() %> </h3>
                </div>
                <div id="studentProgress">
                    <h2>Progresso carriera</h2>

                    <!-- Progress bar circolare
                    gm-circle-progress ha 2 parametri:
                    percentage: percentuale di CFU conseguiti (default = 0)
                    numcfu: numero di CFU conseguiti su CFU totali (default = 0/180)
                    color: colore di sfondo (default = ##0943a0)
                    -->
                    <gm-circle-progress id="circleProgress" percentage="" numcfu=""></gm-circle-progress>

                    <core-collapse id="student-progress-info" style="text-align: center">
                        <div id="student-media-aritmetica">
                            <h3>Media Aritmetica</h3 ><p id="average"></p>
                        </div>
                        <hr>
                        <div id="student-media-ponderata">
                            <h3>Media Ponderata</h3><p id="weightedAverage"></p>
                        </div>
                        <hr>
                        <div>
                            <h3>Esami Registrati</h3><p id="acquiredExams"></p>
                        </div>
                        <hr>
                    </core-collapse>
                    <paper-button id="student-detail-button" value="1">MOSTRA DETTAGLI</paper-button>
                </div>
                <div id="app-navigation">
                    <!-- gm-navigation-tab ha 3 parametri:
                    url: link a cui deve indirizzare la componente (default = #)
                    text: testo all'interno della componente (default = SET YOUR TEXT)
                    color: colore di sfondo (default = ##0943a0)
                    -->
<!--                     <gm-navigation-tab url="Libretto.jsp" text="LIBRETTO ESAMI"></gm-navigation-tab> -->
<!--                     <gm-navigation-tab url="Appelli.jsp" text="LISTA APPELLI"></gm-navigation-tab> -->
<!--                     <gm-navigation-tab text="RUBRICA"></gm-navigation-tab> -->
                </div>
            </div>
        </core-header-panel>

    </core-drawer-panel>
    <script src="scripts/home-scripts.js"></script>
    <script>
        document.addEventListener('polymer-ready', function() {
            var ajax = document.getElementById("ajax");
            ajax.addEventListener("core-response", function(event) {
                var circleProgressBar = document.getElementsByTagName("gm-circle-progress")[0];
                circleProgressBar.setAttribute("percentage", event.detail.response.percentCFU);
                circleProgressBar.setAttribute("numcfu", event.detail.response.acquiredCFU+"/"+event.detail.response.totalCFU);
                document.getElementById("average").innerHTML = event.detail.response.average;
                document.getElementById("weightedAverage").innerHTML = event.detail.response.weightedAverage;
                document.getElementById("acquiredExams").innerHTML = ""+event.detail.response.totalExams;
                document.getElementById("circleProgress").go();
            });
        });
    </script>
</body>
</html>