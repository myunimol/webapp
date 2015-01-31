<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="rocks.teammolise.myunimol.webapp.UserInfo"%>
<%@page import="rocks.teammolise.myunimol.jsputils.JspUtils"%>
<%
    JspUtils utils = new JspUtils(request, response, session, out);
    if (session.getAttribute("userInfo") != null) {
        response.sendRedirect("Home.jsp");
        return;
    }
%>

<!DOCTYPE html>

<html>
    <head>
        <title>MyUnimol</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <%
            utils.writeStandardImports();

            utils.writePolymerImport("core-icons");
            utils.writePolymerImport("core-icon");
            utils.writePolymerImport("core-input");
            utils.writePolymerImport("core-drawer-panel");
            utils.writePolymerImport("core-header-panel");
            utils.writePolymerImport("paper-button");
            utils.writePolymerImport("paper-input");
            utils.writePolymerImport("core-ajax");
            utils.writePolymerImport("core-transition");
            utils.writePolymerImport("paper-toast");
            utils.writePolymerImport("paper-spinner");
            utils.writePolymerImport("paper-dialog");
            utils.writePolymerImport("paper-icon-button");
        %>
        <link rel="import" href="bower_components/paper-input/paper-input-decorator.html">
        <link rel="import" href="our_components/myunimol-ajax/myunimol-ajax.html">

        <style shim-shadowdom>  	 
            body {
                min-height: 400px;
                font-family: 'RobotoDraft', sans-serif;
            }
            #username_input {
                display: block;
                margin: 0 auto;
                max-height: 5%;
                max-width: 58%;
            }
            #password_input {
                display: block;
                margin: 0 auto;
                max-height: 5%;
                max-width: 58%;
            }
            #buttons {
                margin: 0px auto;
                padding-top: 50px;
                max-width: 60%;
                text-align: center;
            }
            #privacy {
                display: inline;
                width: 5%;
                float: left;
            }
            #login {
                display: inline-block;
                width: 35%;
                background: #526E9C;
                color: #fff;
                float: right;
            }
            .clear {
                clear: both;
                float: none;
            }
            #header {
                height: 10%;
                margin: 0;
                padding: 0;
                text-align: center;
                background: #526E9C;
            }
            #header img {
                position: relative;
                height: 145%;
                top: -.2em;
            }
            #header h1 {
                margin-top: -7px;
            }
            #footer {
                height: 8em;
                width: 100%;
                text-align: center;
                background: #526E9C;
            }
            #footer p {
                padding: 1em 1em 0 1em;
                color: #CFD8DC;
                font-size: smaller;
                max-width: 411px;
                margin: 0 auto;
            }
            #footer a {
                text-decoration: none;
                color: #F5F5F5;
            }
            #footer h6 a {
                color: #323232;
            }
            #mobile_footer{
                display:none;
                text-align: center;
            }
            #mobile_footer p {
                padding: 1em 1em 0 1em;
                color: #CFD8DC;
                font-size: smaller;
                max-width: 411px;
                margin: 0 auto;
            }
            #mobile_footer a {
                text-decoration: none;
                color: #F5F5F5;
            }
            #mobile_footer h6 a {
                color: #323232;
            }
            
            #privacyDialog p {
                font-size: smaller;
            }
            #mobile_disclaimer{
                background-color: #526E9C;
                color:#FFF;
                padding:10px 5px 3px 5px;
            }
            #privacyDialog {
                width: 80%;
            }
            
            @media all and (min-width: 500px) {
	            .centerable {
	            	text-align: center;
	            }
            }
        </style>
    </head>
    <body id="body_id">
    	<!-- <core-drawer-panel> -->
    	<core-header-panel mode="cover">
        <div id="header">
            <img src="img/android.png"></img>
            <h1 id="appName">MyUnimol</h1>
        </div>
        <div id="push1"></div>
        <div id="content" style="margin-bottom: 50px; margin-top: 90px; text-align: justify; margin-left: 50px; margin-right: 50px; width: auto; height: auto;">
        	<p style="text-align: center;"><img style="width: 100px;" src="img/sad.png" /></p>
            <h1 style="text-align: center;">Cosa &egrave; successo?</h1>
            <p class="centerable">MyUnimol &egrave; attualmente disponibile solo per un numero selezionato di persone. Vogliamo diffondere il prodotto solo quando
            sar&agrave; perfettamente funzionante e garantirti la migliore esperienza.</p> 
            
            <p class="centerable">Se sei curioso, visita il nostro <a href="https://www.teammolise.rocks/MyUnimol">sito web</a> oppure chiedici di partecipare 
            inviando un messaggio privato sulla nostra <a href="https://www.facebook.com/MyUnimol">pagina Facebook</a>.</p>
            
            <p class="centerable">A presto!</p> 
        </div>
        <div id="push2"></div>
        <div id="footer">
            <p><a href="http://teammolise.rocks/MyUnimol" target="__BLANK">MyUnimol</a> &egrave; un'applicazione sviluppata da alcuni studenti dell'<a href="http://unimol.it" target="__BLANK">Universit&agrave; degli Studi del Molise</a> e dell'<a href="http://unisa.it" target="__BLANK">Universit&agrave; degli Studi di Salerno</a>.</p>
            <h6>Copyright <a href="http://teammolise.rocks/MyUnimol" target="__BLANK">MyUnimol</a> <% out.print(Calendar.getInstance().get(Calendar.YEAR));%> &copy; &mdash; Tutti i diritti riservati</h6>
        </div>
        <div id="mobile_footer">
            <paper-icon-button icon="arrow-drop-up" id="mobile_foote_icon_button"></paper-icon-button>
            <div id="mobile_disclaimer" style="display: none">
                <p><a href="http://teammolise.rocks/MyUnimol" target="__BLANK">MyUnimol</a> &egrave; un'applicazione sviluppata da alcuni studenti dell'<a href="http://unimol.it" target="__BLANK">Universit&agrave; degli Studi del Molise</a> e dell'<a href="http://unisa.it" target="__BLANK">Universit&agrave; degli Studi di Salerno</a>.</p>
                <h6>Copyright <a href="http://teammolise.rocks/MyUnimol" target="__BLANK">MyUnimol</a> <% out.print(Calendar.getInstance().get(Calendar.YEAR));%> &copy; &mdash; Tutti i diritti riservati</h6>
            </div>
        </div>
        </core-header-panel>
        </core-drawer-panel>
    <paper-toast id="login_error_message" text="Dati di accesso non validi."></paper-toast>
    <script>
        document.addEventListener("polymer-ready", function() {
            document.getElementById("username_input_field").focus();

            var appName = document.getElementById("appName");
            var footerDiv = document.getElementById("footer");
            var mobileFooterDiv = document.getElementById("mobile_footer");
            if (window.innerHeight < 250) {
                appName.style.display = "none";
                footerDiv.style.display = "none";
                mobileFooterDiv.style.display = "block";
                calculatePushValue();
            } else if (window.innerHeight < 450) {
                appName.style.display = "none";
                footerDiv.style.display = "none";
                mobileFooterDiv.style.display = "block";
                calculatePushValue();
            } else if (window.innerHeight < 550) {
                appName.style.fontSize = "smaller";
                footerDiv.style.display = "none";
                mobileFooterDiv.style.display = "block";
                calculatePushValue();
            }

            calculatePushValue();

            var mobileFooterIconButton = document.getElementById("mobile_foote_icon_button");
            mobileFooterIconButton.addEventListener("click", function() {
                var mobileDisclamer = document.getElementById("mobile_disclaimer");
                if (mobileDisclamer.style.display === 'none') {
                    document.getElementById('buttons').style.display = "none";
                    mobileDisclamer.style.display = "block";
                    mobileFooterIconButton.icon = "arrow-drop-down";
                    calculatePushValue();
                }
                else if (mobileDisclamer.style.display === 'block') {
                    mobileDisclamer.style.display = "none";
                    document.getElementById('buttons').style.display = "block";
                    mobileFooterIconButton.icon = "arrow-drop-up";
                    calculatePushValue();
                }
            });
        });


        function calculatePushValue() {
            var footerDiv = document.getElementById("footer");
            var mobileFooterDiv = document.getElementById("mobile_footer");

            var headerDiv = document.getElementById("header");
            var headerHeight = headerDiv.clientHeight;

            var footerHeight = footerDiv.clientHeight;
            var mobileFooterHeught = mobileFooterDiv.clientHeight;

            var contentDiv = document.getElementById("content");
            var contentHeight = contentDiv.clientHeight;

            var totalSpace = window.innerHeight - (headerHeight + footerHeight + mobileFooterHeught);

            var push1Div = document.getElementById("push1");
            var push2Div = document.getElementById("push2");
            var extraSpace = totalSpace - contentHeight;
            var pushHeight = extraSpace / 2;
            push1Div.style.height = pushHeight + "px";
            push2Div.style.height = pushHeight + "px";

        }
    </script>
</body>
</html>
