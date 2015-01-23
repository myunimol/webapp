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
        </style>
    </head>
    <body id="body_id">
        <div id="header">
            <img src="img/android.png"></img>
            <h1 id="appName">MyUnimol</h1>
        </div>
        <div id="push1"></div>
        <div id="content">
            <paper-input-decorator type="text"  label= "Username" id= "username_input" floatinglabel class="my-input"  error="Inserisci il nome utente!">
                <input is="core-input" tabindex="1" id="username_input_field" autocapitalize="off" required>
            </paper-input-decorator>
            <paper-input-decorator type="password" id= "password_input" label= "Password" floatinglabel class="my-input" error="Inserisci la password!">
                <input is="core-input" tabindex="2" id="password_input_field" type="password" autocapitalize="off" required>
            </paper-input-decorator>
            <div id="buttons">
                <paper-button onclick="showDialog('privacy')" id="privacy">Privacy</paper-button>
                <paper-button onclick="sendData()" id="login" raised>Login</paper-button>
                <div class="clear"></div>
            </div>
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
    <paper-toast id="login_error_message" text="Dati di accesso non validi."></paper-toast>
    <paper-dialog id="privacyDialog" heading="Privacy" transition="core-transition-center">
        <h2>Condizioni di servizio</h2>
        <div style="text-align: justify;">
            <p>ATTENZIONE: MyUnimol non &egrave; un'applicazione ufficiale dell'Universit&agrave; degli Studi del Molise. Tutti i dati vengono reperiti dalla piattaforma ESSE3 dell'Universit&agrave; degli Studi del Molise e tali informazioni non vengono memorizzate nei nostri sistemi.</p>
            <p>Effettuando l'accesso si esprime il proprio consenso al download automatico dei propri dati (quali nome, cognome, voto degli esami, corso di studi...) dalla piattaforma ESSE3. MyUnimol si solleva da ogni eventuale responsabilit&agrave;.</p>
        </div>
    </paper-dialog>
    <myunimol-ajax nofreeze id='ajaxData' method='POST' url='LoginServlet'
                   params = '{"username":"", "password":""}'
                   handleAs='json'
                   contentId="content"></core-ajax>
    <script>
        function sendData() {
            //prendo il core-ajax
            var reqst = document.getElementById("ajaxData");

            //prendo i dati dai paper input
            var username = document.getElementById('username_input_field').value.trim();
            var password = document.getElementById('password_input_field').value;
            // Se i campi non sono vuoti
            if (username != '' && password != '') {
                //modifico i parametri e faccio partire la richiesta
                reqst.params = '{"username": "' + username.toLowerCase() + '", "password":"' + password + '"}';
                reqst.go();
                freeze("content");
            }
            var $d = document.getElementById('body_id').querySelectorAll('paper-input-decorator');
            Array.prototype.forEach.call($d, function(d) {
                d.isInvalid = !d.querySelector('input').validity.valid;
            });
        }

        function showDialog(what) {
            if (what == "privacy") {
                var dialog = document.getElementById("privacyDialog");
                dialog.toggle();
            }
        }

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

            var ajax = document.getElementById("ajaxData");

            ajax.addEventListener("myunimol-response", function(event) {
                var json = event.detail.response;

                if (json.result == 'failure') {
                    document.querySelector('#login_error_message').show();
                    unfreeze("content");
                } else if (json.result == 'correct') {
                    window.location.href = "Home.jsp";
                }
            })

            ajax.addEventListener("core-error", function(event) {
                unfreeze("content");
            })

            document.getElementById("username_input_field").addEventListener("keypress", keyPressed)
            document.getElementById("password_input_field").addEventListener("keypress", keyPressed)
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
            console.log(pushHeight);
            push1Div.style.height = pushHeight + "px";
            push2Div.style.height = pushHeight + "px";

        }


        function keyPressed(event) {
            if (event.keyCode == 13) {
                sendData();
                return false;
            }
        }

    </script>
</body>
</html>
