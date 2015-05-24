<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css" media="screen">
    #jump{
        float: left;
        max-width: 20%;
        margin: 5%
    }

    #lista{

    }
    #post{
        float: left;
        max-width: 20%;
        margin: 5%
    }
    #coments{
        float: right;
        max-width: 20%;
        margin: 5%
    }

    </style>
</head>
<body>
<div id="jump">
    <h1> consultar </h1>
    <ul id="lista">
        <il><a>Foros</a></il>
        <il><g:link controller="user" action="show">Usuarios</g:link></il>
        <il><g:link controller="post" action="show" />Post</g:link></il>
        <il><g:link controller="file" action="show">Archivos</g:link> </il>
    </ul>
</div>
<div id="post">
    <g:each var="p" in="${foro.Post.list([max:10, sort:"dateCreated"])}">
        <a>${p.topic}</a>
    </g:each>
</div>
<div id="coments">
    <g:each var="p" in="${foro.Post.list([max:10, sort:"lastUpdate"])}">
        <a>${p.topic}</a>
    </g:each>
</div>
</body>
</html>