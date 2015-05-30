<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css" media="screen">
    #todo{
        padding: 2%;
        margin-left: 20%;
        margin-right: 20%;
        margin-bottom: 5%;
    }
    #texto{
        margin-left: 5%;
    }
    #imagen{
        margin-left: 5%;
        margin-right: 5%;
        width: 70%;
    }
    .errorFor img{
        width: 100%;
    }
    </style>
</head>
<body>
<div id="todo" class="errorFor">
    <div id="texto">
        <h1 id="mens">Lo sentimos la pagina solicitada no existe</h1>
        <g:if test="${flash.message}">
            <div class="message">
                ${flash.message }
            </div>
        </g:if>
    </div>
    <div id="imagen">
        <asset:image src="sad.jpg" alt="error"/>
    </div>
</div>
</body>
</html>