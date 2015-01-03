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
        utils.writePolymerImport("paper-toast");
        utils.writePolymerImport("paper-spinner");
        %>
        <link rel="import" href="bower_components/paper-input/paper-input-decorator.html">
        <link rel="import" href="our_components/myunimol-ajax/myunimol-ajax.html">

        <style shim-shadowdom>  	 
            body {
                min-height: 500px;
                font-family: 'RobotoDraft', sans-serif;
            }
            #icona_myunimol {
                display: block;
                margin: 5% auto;
                width: 20%;
            }
            #username_input {
                display: block;
                margin: 0 auto;
                max-height: 5%;
                max-width: 55%;
            }
            #password_input {
                display: block;
                margin: 0 auto;
                max-height: 5%;
                max-width: 55%;
            }
            #login {
            	display: block;
                margin: 50px auto;
                max-width: 55%;
                background: #03A9F4;
            }
            #header {
            	margin-top: 10%;
            	text-align: center;
            }
        </style>
    </head>
    <body id="body_id">
    	<div id="header">
    		<img id="icona_myunimol" src="img/android.png" centered></img>
    		<h1>MyUnimol</h1>
    	</div>
        <div id="content">
		    <paper-input-decorator type="text"  label= "Username" id= "username_input" floatinglabel class="my-input"  error="Inserisci il nome utente!">
		        <input is="core-input" id= "username_input_field" required>
		    </paper-input-decorator>
		    <paper-input-decorator type="password" id= "password_input" label= "Password" floatinglabel class="my-input" error="Inserisci la password!">
		        <input is="core-input" id="password_input_field" type="password" required>
		    </paper-input-decorator>
		    <paper-button  onclick="sendData()" id="login" raised>login</paper-button>
	    </div>
	    <paper-toast id="login_error_message" text="Dati di accesso non validi."></paper-toast>
	    <myunimol-ajax id='ajaxData' method='POST' url='LoginServlet'
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
	            }
	            var $d = document.getElementById('body_id').querySelectorAll('paper-input-decorator');
	            Array.prototype.forEach.call($d, function (d) {
	                d.isInvalid = !d.querySelector('input').validity.valid;
	            });
	        }
	
	        document.addEventListener("polymer-ready", function () {
	            var reqst = document.getElementById("ajaxData");
	            reqst.addEventListener("core-response", function (event) {
	                var json = event.detail.response;
	                if (json.result == 'failure') {
	                    document.querySelector('#login_error_message').show();
	                } else if (json.result == 'correct') {
	                    window.location.href = "Home.jsp";
	                }
	            })
	        });
	
	    </script>
	</body>
</html>
