<div>
    <asset:image src="icono.png" alt="Grails" />
    <div id="botones">
    <ul>
        <g:if test="${session.user}">
            <li>
                <g:link controller="User" action="logout">Logout
                </g:link>
            </li>
            <li>
                <a href="#">Mis Post</a>
            </li>
            <li>
                <a href="#">Mi Perfil</a>
            </li>
            <li class="hola">
                Bienvenido:
             <b>${session.user?.name}&nbsp;${session.user?.lastName}</b>
            </li>
        </g:if>
        <g:else>
            <li>
                <a href="/Foro/user/login" id="boton">Login</a>
            </li>
        </g:else>
    </ul>
    </div>
</div>
