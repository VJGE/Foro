<%--
  Created by IntelliJ IDEA.
  User: Sebastian
  Date: 29/05/2015
  Time: 07:40 PM
--%>

<%@ page import="foro.Regular" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css" media="screen">
    #posts{
        border-style: solid;
        border-color: #CDCDBD;
        border-radius: 10%;
        max-width: 20%;
        min-width: 15%;
        margin-left: 15%;
        margin-bot: 5%;
        margin-top: 10%;
    }
    </style>
</head>

<body>
<div id="posts">
    <h1> Tus Post</h1>
    <g:set var="p" value="${((foro.Regular)session).posts}"/>
    <g:if test="${p.size()>0}">
        <ul>
            <g:each var="d" in="${p}">
                <il>${d.topic}</il>
            </g:each>

        </ul>
    </g:if>
    <g:else>
        <h1>Usted no ha creado ningun post</h1>
    </g:else>
</div>
</body>
</html>