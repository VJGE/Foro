<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css" media="screen">
    #jump{
        float: left;
        max-width: 20%;
        min-width: 15%;
        margin: 5%;
        border-radius: 10%;
        border-style: solid;
        border-color: #CDCDBD;
    }

    #lista{
        margin:5%;
    }
    #post{
        border-style: solid;
        border-color: #CDCDBD;
        border-radius: 10%;
        float: left;
        max-width: 20%;
        min-width: 15%;
        margin: 5%;

    }
    #coments{
        border-style: solid;
        border-color: #CDCDBD;
        border-radius: 10%;
        float: right;
        max-width: 20%;
        min-width: 15%;
        margin: 5%;
    }

    </style>
</head>
<body>
<div id="jump">
    <h1> consultar </h1>
    <ul id="lista">
        <il><g:link controller="user" action="show">Foros</g:link></il> <br>
        <il><g:link controller="user" action="show">Usuarios</g:link></il> <br>
        <il><g:link controller="post" action="show">Post</g:link></il> <br>
        <il><g:link controller="file" action="show">Archivos</g:link> </il> <br>
    </ul>
</div>
<div id="post">
    <h1> Ultimos post</h1>
    <ul>
    <g:each var="p" in="${foro.Post.list([max:10, sort:"dateCreated"])}">
        <il>${p.topic}</il>
    </g:each>
    </ul>
</div>
<div id="coments">
    <h1>Foros con mas comentarios</h1>
        <ul>
    <g:each var="p" in="${foro.Post.list([max:10, sort:"lastUpdate"])}">
        <il>${p.topic}</il>
    </g:each>
        </ul>
</div>
</body>
</html>