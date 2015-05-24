<html>
<head>
    <title>Login Page</title>
    <meta name="layout" content="main" />
</head>
<body>
<div id="loginContainer">
    <g:if test="${flash.message}">
        <div class="message">
            ${flash.message }
        </div>
    </g:if>
    <p class="clase_login_encabezado">
       Ingresa tus credenciales para autenticarte
    </p>
    <g:form action="handleLogin" method="post">
        <span class='nameClear'><label for="login">
        </label>
        </span>
        <div align="center" style="margin-top: 20px">
        <g:textField name="userName" value="${user?.userName}" type="text" id="inputUserName" class="clase_login" placeholder="username"  />
        </div>
        <div align="center" style="margin-top: 20px">
        <g:textField name="password" value="${user?.password}" type="text" id="password" class="clase_login" placeholder="password"  />
        </div>
        <br />
        <div align="center">
            <g:actionSubmit value="Entrar" action="handleLogin" class="button"/>
        </div>
    </g:form>
</div>
</body>
</html>