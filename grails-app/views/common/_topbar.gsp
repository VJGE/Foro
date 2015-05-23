<div>
    <asset:image src="icono.png" alt="Grails" />
    <div id="botones">
    <ul>
        <g:if test="${session.user}">
            <li>
                <a href="#">Logout</a>
            </li>
            <li>
                <a href="#">Mis Post</a>
            </li>
            <li>
                <a href="#">Mi Perfil</a>
            </li>
            <li class="hola">
                Bienvenido usuario: <b>${session.user?.name}&nbsp;${session.user?.lastName}</b>
            </li>
        </g:if>
        <g:else>
            <li>
                <a href="#" id="boton">Login</a>
            </li>
        </g:else>
    </ul>
    </div>
</div>
