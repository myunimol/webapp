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
        %>
        <link rel="import" href="bower_components/paper-input/paper-input-decorator.html">
        <link rel="import" href="our_components/myunimol-ajax/myunimol-ajax.html">

        <style shim-shadowdom>  	 
            body {
                min-height: 568px;
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
            	margin: 50px auto;
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
            	margin-bottom: 7em;
            	padding: 0;
            	text-align: center;
            	background: #526E9C;
            }
            #header img {
            	position: relative;
				height: 145%;
				top: -.2em;
            }
            #footer {
            	position: relative;
            	bottom: 0;
            	height: 8em;
            	width: 100%;
            	text-align: center;
            	background: #526E9C;
            }
            #footer p {
            	padding: 1em 1em 0 1em;
            	color: #CFD8DC;
            	font-size: smaller;
            }
            #footer a {
            	text-decoration: none;
             	color: #F5F5F5;
            }
            #footer h6 a {
            	color: #323232;
            }
            #privacyDialog p {
            	font-size: smaller;
            }
            #privacyDialog {
			    width: 80%;
			}
        </style>
    </head>
    <body id="body_id">
		<div id="header">
			<img src="img/android.png"></img>
			<h1>MyUnimol</h1>
		</div>
        <div id="content">
		    <paper-input-decorator type="text"  label= "Username" id= "username_input" floatinglabel class="my-input"  error="Inserisci il nome utente!">
		        <input is="core-input" id= "username_input_field" autocapitalize="off" required>
		    </paper-input-decorator>
		    <paper-input-decorator type="password" id= "password_input" label= "Password" floatinglabel class="my-input" error="Inserisci la password!">
		        <input is="core-input" id="password_input_field" type="password" autocapitalize="off" required>
		    </paper-input-decorator>
		    <div id="buttons">
		    	<paper-button  onclick="showDialog('privacy')" id="privacy">Privacy</paper-button>
		    	<paper-button  onclick="sendData()" id="login" raised>Login</paper-button>
		    	<div class="clear"></div>
		    </div>
		    <div id="push"></div>
	    </div>
	    <div id="footer">
	    	<p><a href="http://teammolise.rocks/MyUnimol">MyUnimol</a> &egrave; un'applicazione sviluppata da alcuni studenti dell'<a href="http://unimol.it">Universit&agrave; degli Studi del Molise</a> e dell'<a href="http://unisa.it">Universit&agrave; degli Studi di Salerno</a>.</p>
	    	<h6>Copyright <a href="http://teammolise.rocks/MyUnimol">MyUnimol</a> <% out.print(Calendar.getInstance().get(Calendar.YEAR)); %> &copy; &mdash; Tutti i diritti riservati</h6>
	    </div>
	    <paper-toast id="login_error_message" text="Dati di accesso non validi."></paper-toast>
	    <paper-dialog id="privacyDialog" heading="Privacy" transition="core-transition-center">
		  <h2>Condizioni di servizio</h2>
		  <p>ATTENZIONE: MyUnimol non &egrave; un'applicazione ufficiale dell'Universit&agrave; degli Studi del Molise. Tutti i dati vengono reperiti dalla piattaforma ESSE3 dell'Universit&agrave; degli Studi del Molise e tali informazioni non vengono memorizzate nei nostri sistemi.</p>
		  <p>Le informazioni base come le credenziali d'accesso, il nome, il cognome, l'anno di corso e le medie esami sono memorizzate in modo sicuro temporaneamente per questioni di risparmio di traffico dati e di performance.</p>
		  <p>Effettuando l'accesso si esprime il proprio consenso al download automatico dei propri dati (quali nome, cognome, voto degli esami, corso di studi...) dalla piattaforma ESSE3 a proprio rischio e pericolo.</p>
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
	            var username = document.getElementById('username_input_field').value;
	            var password = document.getElementById('password_input_field').value;
	            // Se i campi non sono vuoti
	            if (username != '' && password != '') {
	                //modifico i parametri e faccio partire la richiesta
	                reqst.params = '{"username": "' + username + '", "password":"' + password + '"}';
	                reqst.go();
	                freeze("content");
	            }
	            var $d = document.getElementById('body_id').querySelectorAll('paper-input-decorator');
	            Array.prototype.forEach.call($d, function (d) {
	                d.isInvalid = !d.querySelector('input').validity.valid;
	            });
	        }
	        
	        function showDialog(what) {
	        	if(what=="privacy") {
	        		var dialog = document.getElementById("privacyDialog");
	        		dialog.toggle();
	        	}
	        }
	
	        document.addEventListener("polymer-ready", function () {
	        	var pushDiv = document.getElementById("push");
	        	var footerDiv = document.getElementById("footer");
	        	var footerBox = footerDiv.getBoundingClientRect();
	        	var pageHeight = window.innerHeight;
	        	var pushHeight = pageHeight - footerBox.bottom;
	        	pushDiv.style.height = pushHeight+"px";
	        	var ajax = document.getElementById("ajaxData");
	        	
	        	ajax.addEventListener("myunimol-response", function (event) {
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
	        
	        function keyPressed(event) {
	        	if (event.keyCode == 13) {
	                sendData();
	                return false;
	            }
	        }
	
	    </script>
	</body>
</html>
