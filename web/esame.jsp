<%@page import="rocks.teammolise.myunimol.webapp.UserInfo"%>
<% if (session == null || session.getAttribute("userInfo") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="bower_components/platform/platform.js"></script>
        <link rel="import" href="bower_components/core-scaffold/core-scaffold.html">
        <link rel="import" href="bower_components/core-header-panel/core-header-panel.html">
        <link rel="import" href="bower_components/core-menu/core-menu.html">
        <link rel="import" href="bower_components/core-item/core-item.html">
        <link rel="import" href="bower_components/core-icon-button/core-icon-button.html">
        <link rel="import" href="bower_components/core-toolbar/core-toolbar.html">
        <link rel="import" href="bower_components/core-icons/core-icons.html">
        <link rel="import" href="bower_components/core-icon/core-icon.html">
        <link rel="import" href="bower_components/core-menu/core-submenu.html">
        <link rel="import" href="bower_components/core-ajax/core-ajax.html">

        <style>
            body {
                font-family: Arial, sans-serif;
            }
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
            #core_scaffold {
                position: absolute;
                top: 0px;
                right: 0px;
                bottom: 0px;
                left: 0px;
                width: 100%;
                height: 100%;
            }
            #core_header_panel {
                background-color: rgb(255, 255, 255);
            }
            #core_toolbar {
                color: rgb(255, 255, 255);
                background-color: rgb(79, 125, 201);
            }
            #core_menu {
                font-size: 16px;
            }
            #student_name {
                left: 70px;
                top: 10px;
                position: absolute;
                width: 155px;
                height: 30px;
            }
            #student_id {
                top: 40px;
                position: absolute;
                left: 70px;
            }

            .avgContainer {
                padding-left: 10px;
                font-weight: bold;
            }
        </style>

    </head>

    <body>

    <core-ajax auto id='ajax' method='POST' url='RecordBookExamServlet'
               params = '{}'
               handleAs='json'></core-ajax>


    <core-scaffold id="core_scaffold">

        <core-item id="weighted" icon="trending-up" label="Media Pesata" horizontal center layout></core-item>
        <core-item id="media" icon="assessment" label="Media" horizontal center layout></core-item>
        <table id="table">
            <thead id="thead">
                <tr id="tr">
                    <th id="th">Nome</th>
                    <th id="th1">Cfu</th>
                    <th id="th2">Ore</th>
                    <th id="th3">Area</th>
                </tr>
            </thead>
            <tbody id="tbody">
                <tr>
                </tr>
            </tbody>
        </table>
        <core-header-panel mode="seamed" id="core_header_panel" navigation flex>
            <core-toolbar id="core_toolbar">
                <%
                    UserInfo user = (UserInfo) session.getAttribute("userInfo");
                    out.print("<div id=\"student_name\" tool horizontal layout center start-justified>" + user.getName() + " " + user.getSurname() + "</div>");
                    out.print("<div id=\"student_id\" tool start-justified>" + user.getStudentId() + "</div>");
                %>       
            </core-toolbar>

            <core-menu selected="Home" valueattr="label" selectedindex="0" id="core_menu" icon="extension" theme="core-light-theme">
                <core-item id="home_item" icon="home" label="Home" horizontal center layout active><a href=''></a></core-item>
                <core-item id="libretto_item" icon="folder-shared" label="Libretto" horizontal center layout><a href=''></a></core-item>
                <core-item id="docenti_item" icon="mail" label="Rubrica Docenti" horizontal center layout><a href=''></a></core-item>
                <core-item id="appelli_item" icon="assignment" label="Appelli" horizontal center layout><a href='Appelli.jsp'></a></core-item>
                <core-item id="bacheca_item" icon="announcement" label="Bacheca avvisi" horizontal center layout><a href=''></a></core-item>
                <core-item id="piano_item" icon="view-list" label="Piano di studi" horizontal center layout><a href=''></a></core-item>
            </core-menu>
        </core-header-panel>
        <div id="title" tool></div>

        <script>
            document.addEventListener("polymer-ready", function () {
                var result = document.getElementById("ajax");

                result.addEventListener("core-response", function (event) {
                    var data = event.detail.response;

                    $('#table tr:last').after(
                            '<tr><td id="td">' + data.name +
                            '</td><td id="td1">' + data.cfu +
                            '</td><td id="td2">' + data.hours +
                            '</td><td id="td3">' + data.area +
                            '</td></tr>');
                });
            });

        </script>

    </core-scaffold>
</body>
</html>