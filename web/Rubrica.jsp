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
        <title>MyUnimol</title>

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


        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="import" href="bower_components/paper-input/paper-input.html">
        <link rel="import" href="bower_components/paper-input/paper-input-decorator.html">
        <link rel="import" href="bower_components/paper-item/paper-item.html">
        <link rel="import" href="our_components/ef-contact/ef-contact.html">
        
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
        
    <core-ajax auto
               id='ajax' 
               method='POST'
               url="GetAddressBookServlet" 
               params='{}' 
               handleAs='json'>
    </core-ajax>

    <core-drawer-panel id="drawerPanel">
        <% utils.writeLeftMenu("Rubrica", 2);%>

        <core-header-panel main>
            <core-toolbar id="mainheader">
                <paper-icon-button id="navicon" icon="menu"></paper-icon-button>
                <span flex style="font-size: 28;">Rubrica</span>
                <paper-icon-button id="searchbutton" icon="search"></paper-icon-button>
            </core-toolbar>
           
            <div id="maintoolbar" style="background-color: #4F7DC9; border-radius: 5px;" horizontal layout>
                <paper-input style="margin-left: 50px; color: white" type="text"  label= "Ricerca" id= "nome_input" floatinglabel class= "my-input"></paper-input>
                <paper-item  style="margin-top: 22px; margin-left: 20px; color: white" id="paper_item" icon="search"></paper-item>
            </div>
            
            <div id='activeContentHandler' class="content">
                <ef-contact id='efcontact'></ef-contact>
            </div>
        </core-header-panel>	
    </core-drawer-panel>    

    <script>
        document.addEventListener('polymer-ready', function () {

            var ajax = document.getElementById("ajax");

            ajax.addEventListener("core-response", function (event) {
                document.getElementById("efcontact").contacts = event.detail.response.contacts;
            });
        });
    </script>
</body>
</html>
