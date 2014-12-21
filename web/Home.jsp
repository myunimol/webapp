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
        <title>MuUnimol</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
                    <h1>Giuseppe Marasca</h1>
                    <h3>148940</h3>
                </div>
                <div id="studentProgress">
                    <h2>Progresso carriera</h2>

                    <!-- Progress bar circolare
                    gm-circle-progress ha 2 parametri:
                    percentage: percentuale di CFU conseguiti (default = 0)
                    numcfu: numero di CFU conseguiti su CFU totali (default = 0/180)
                    color: colore di sfondo (default = ##0943a0)
                    -->
                    <gm-circle-progress percentage="44.4" numcfu="80/180"></gm-circle-progress>

                    <core-collapse id="student-progress-info" style="text-align: center">
                        <div id="student-media-aritmetica">
                            <h3>Media Aritmetica</h3 ><p>26.44/30</p>
                        </div>
                        <hr>
                        <div id="student-media-ponderata">
                            <h3>Media Ponderata</h3><p>26.41/30</p>
                        </div>
                        <hr>
                        <div>
                            <h3>Esami Registrati</h3><p>9</p>
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
                    <gm-navigation-tab url="Libretto.jsp" text="LIBRETTO ESAMI"></gm-navigation-tab>
                    <gm-navigation-tab url="Appelli.jsp" text="LISTA APPELLI"></gm-navigation-tab>
                    <gm-navigation-tab text="RUBRICA"></gm-navigation-tab>
                </div>
            </div>
        </core-header-panel>

    </core-drawer-panel>
    <script src="scripts/home-scripts.js"></script>
</body>
</html>