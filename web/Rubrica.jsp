<%-- 
    Document   : Rubrica
    Created on : 16-dic-2014, 10.42.52
    Author     : emilio
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rubrica</title>
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
        %>

        <link rel="import" href="bower_components/paper-input/paper-input.html">
        <link rel="import" href="bower_components/paper-input/paper-input-decorator.html">
        <link rel="import" href="bower_components/paper-item/paper-item.html">
        <link rel="import" href="our_components/ef-contact/ef-contact.html">
        <link rel='import' href='our_components/myunimol-ajax/myunimol-ajax.html' />
        
        <style>
        .my-input {
			background-color: inherit;
			border: medium none;
			font-size: 20px;
			outline: 0px none;
			color: inherit;
			width: 80%;
			flex: 1 0 0px;
		}
        </style>
        <!--<style>    
            #design_host {
                position: absolute;
                width: 100%;
                height: 100%;
                box-sizing: border-box;
            }
            #core_toolbar {
                right: 0px;
                left: 20px;
                background-color: rgb(79, 125, 201);
                color: rgb(255, 255, 255);
                fill: rgb(255, 255, 255);
                top: 180px;
                position: absolute;
            }
            #paper_input {
                left: 78px;
                top: 10px;
                background-color: rgb(79, 125, 201);
                position: absolute;
                width: 0px;
                height: 30px;
                opacity: 90;
            }
            #paper_input1 {
                left: 368px;
                top: 10px;
                position: absolute;
            }
            
            .my-input /deep/ .focused-underline {
                background-color:;
            }
            .my-input /deep/ .unfocused-underline {
                background-color: #ffffff;
            }
            .my-input /deep/ .cursor {
                background-color: #1a237e;
            }
            .my-input /deep/ ::-webkit-input-placeholder  {
                color: #ffffff;
            }
            .my-input /deep/ .floated-label .label-text {
                color: #5264AE;
            }
        </style>-->
    </head>
    <body>
        
    <myunimol-ajax auto
               id='ajax' 
               method='POST'
               url="GetAddressBookServlet" 
               params='{}' 
               handleAs='json'>
    </myunimol-ajax>
    
    <myunimol-ajax
               id='ajaxSearch' 
               method='POST'
               url="SearchContactsServlet" 
               params='{}' 
               handleAs='json'>
    </myunimol-ajax>

    <core-drawer-panel id="drawerPanel">
        <% utils.writeLeftMenu("Rubrica", 2);%>

        <core-header-panel main>
            <core-toolbar id="mainheader">
                <paper-icon-button id="navicon" icon="menu"></paper-icon-button>
                <paper-icon-button id="backButton" icon="arrow-back" style='display:none; '></paper-icon-button>
                <span id='mainToolbar' flex style="font-size: 28;">
                	<span id='labelRubrica'>Rubrica</span>
                	<input style='color: white; display:none;' type='text' label='' id='ricercaInput' class='my-input'></paper-input>
                </span>
                <paper-icon-button id='buttonRicercaShow' style="color: white;" id="paper_item" icon="search"></paper-icon-button>
                <paper-icon-button id='buttonRicercaDo' style="color: white; display:none;" id="paper_item" icon="search"></paper-icon-button>
            </core-toolbar>
           
            
            <div id='activeContentHandler' class="content">
                <ef-contact id='efcontact'></ef-contact>
                <div class="centeredMessage" id="no-contacts" style="display: none;">
                	<img src="img/sad.png" alt="sad emoji" />
                	<p>Spiacente ma non riesco a trovare contatti cercando "<span></span>"...</p>
                </div>
            </div>
        </core-header-panel>	
    </core-drawer-panel>    

    <script>
        document.addEventListener('polymer-ready', function () {
            var ajax = document.getElementById("ajax");
            
            document.efcontact = document.getElementById("efcontact");
            document.noContacts = document.getElementById("no-contacts");
            document.searchedTerm = document.noContacts.children[1].children[0];

            ajax.addEventListener("myunimol-response", function (event) {
                document.efcontact.contacts = event.detail.response.contacts;
            });
            
            document.ricercaShow = document.getElementById("buttonRicercaShow");
            document.ricercaDo = document.getElementById("buttonRicercaDo");
            document.navicon = document.getElementById('navicon');
            document.backButton = document.getElementById('backButton');
            document.labelRubrica = document.getElementById("labelRubrica");
            document.ricercaInput = document.getElementById('ricercaInput');
            
            document.ricercaResults = function(event) {
            	if(event.detail.response.contacts.length <= 0) {
            		document.efcontact.contacts = null;
            		document.noContacts.style.display = "block";
            	} else {
            		document.noContacts.style.display = "none";
            		document.efcontact.contacts = event.detail.response.contacts;
            	}
            }
            
            document.ricercaDoAction = function() {
            	var ajax = document.getElementById('ajaxSearch');
            	ajax.params = '{"search":"' + document.ricercaInput.value + '"}'
            	ajax.addEventListener('myunimol-response', document.ricercaResults);
            	ajax.go();
            	document.searchedTerm.innerHTML = document.ricercaInput.value;
            	document.backAction();
            }
            
            document.ricercaShowAction = function() {
            	document.ricercaDo.style.display = 'block';
            	document.ricercaShow.style.display = 'none';
            	
            	document.backButton.style.display = 'block';
            	document.navicon.style.display = 'none';
            	
            	document.labelRubrica.style.display = 'none';
            	document.ricercaInput.style.display = 'block';
            	
            	document.ricercaInput.focus();
            };
            
            document.backAction = function() {
            	document.ricercaShow.style.display = 'block';
            	document.ricercaDo.style.display = 'none';
             	
            	document.navicon.style.removeProperty('display');
             	document.backButton.style.display = 'none';
             	
            	document.ricercaInput.style.display = 'none';
            	document.labelRubrica.style.display = 'block';
            	
            	document.ricercaInput.value = "";
            }
            
            document.ricercaShow.addEventListener('click', document.ricercaShowAction);
            document.backButton.addEventListener('click', document.backAction);
            document.ricercaDo.addEventListener('click', document.ricercaDoAction);
            document.ricercaShow.addEventListener('click', document.ricercaShowAction);
            
            document.ricercaInput.addEventListener('keypress', function(e) {
        		var key = e.which || e.keyCode;
        		if (key == 13)
        			document.ricercaDoAction();
        	})
        });
    </script>
</body>
</html>
