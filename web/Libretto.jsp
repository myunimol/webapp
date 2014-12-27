<%@page import="rocks.teammolise.myunimol.webapp.UserInfo"%>
<%@page import="rocks.teammolise.myunimol.jsputils.JspUtils"%>
<% 
	JspUtils utils = new JspUtils(request, response, session, out);
	
	if (!utils.checkLogin())
        return;
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
        utils.writePolymerImport("core-ajax");
        utils.writePolymerImport("paper-icon-button");
        %>
        
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th {
                color: rgb(0, 0, 0);
                font-weight: bold;
            }
            td, th {
                padding: 6px;
                border: 1px solid rgb(204, 204, 204);
                text-align: left;
            }
            
            .avgContainer {
            	padding-left: 10px;
            	font-weight: bold;
            }
        </style>

    </head>

	<body>
    	<core-ajax auto 
    		id='ajax' 
    		method='POST' 
    		url='RecordBookServlet'
    		params = '{}'
    		handleAs='json'>
    	</core-ajax>

		<core-drawer-panel id="drawerPanel">
			<% utils.writeLeftMenu("Libretto", 1); %>
			
		  	<core-header-panel main>
		  		<core-toolbar id="mainheader">
		      		<paper-icon-button id="navicon" icon="menu"></paper-icon-button>
		      		<span flex style="font-size: 28;"><strong>Libretto</strong></span>
		    	</core-toolbar>
		    	<div id='activeContentHandler' class="content">
		    		<core-item id="weighted" icon="trending-up" label="Media Pesata" horizontal center layout></core-item>
			        <core-item id="media" icon="assessment" label="Media" horizontal center layout></core-item>
			        <table id="table">
			              <tr id="tr">
			                  <th id="th">Nome</th>
			                  <th id="th1">Cfu</th>
			                  <th id="th2">Voto</th>
			                  <th id="th3">Data</th>
			                  <th id="th4">Anno</th>
			              </tr>
			        </table>
		    	</div>
		  	</core-header-panel>
		  	
		</core-drawer-panel>
	    <script>
	    	document.addEventListener("polymer-ready", function () {				
	    		var result = document.getElementById("ajax");
	    	   
	    		result.addEventListener("core-response", function (event) {
	    			var data = event.detail.response;
	    			for (var i = 0; i < data.exams.length; i++) {
	    				$('#table tr:last').after(
	    						'<tr><td id="td">'   + data.exams[i].name + 
	    						'</td><td id="td1">' + data.exams[i].cfu + 
	    						'</td><td id="td2">' + data.exams[i].vote + 
	    						'</td><td id="td3">' + data.exams[i].date + 
	    						'</td><td id="td4">' + data.exams[i].year + 
	    						'</td></tr>');
	                    
	    				$('#weighted').html('<div class="avgContainer">' + data.weightedAverage + '</div>');
	    				$('#media').html('<div class="avgContainer">' + data.average + '</div>');
	    			}
	    		});
	    	});
	    </script>
</body>
</html>
