
<%@ page import="foro.Regular" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regular.label', default: 'Regular')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regular" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regular" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regular">
			
				<g:if test="${regularInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="regular.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${regularInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="regular.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${regularInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="regular.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${regularInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.userName}">
				<li class="fieldcontain">
					<span id="userName-label" class="property-label"><g:message code="regular.userName.label" default="User Name" /></span>
					
						<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${regularInstance}" field="userName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="regular.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${regularInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.postViews}">
				<li class="fieldcontain">
					<span id="postViews-label" class="property-label"><g:message code="regular.postViews.label" default="Post Views" /></span>
					
						<span class="property-value" aria-labelledby="postViews-label"><g:fieldValue bean="${regularInstance}" field="postViews"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.strikesNumber}">
				<li class="fieldcontain">
					<span id="strikesNumber-label" class="property-label"><g:message code="regular.strikesNumber.label" default="Strikes Number" /></span>
					
						<span class="property-value" aria-labelledby="strikesNumber-label"><g:fieldValue bean="${regularInstance}" field="strikesNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.starsNumbers}">
				<li class="fieldcontain">
					<span id="starsNumbers-label" class="property-label"><g:message code="regular.starsNumbers.label" default="Stars Numbers" /></span>
					
						<span class="property-value" aria-labelledby="starsNumbers-label"><g:fieldValue bean="${regularInstance}" field="starsNumbers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regularInstance?.posts}">
				<li class="fieldcontain">
					<span id="posts-label" class="property-label"><g:message code="regular.posts.label" default="Posts" /></span>
					
						<g:each in="${regularInstance.posts}" var="p">
						<span class="property-value" aria-labelledby="posts-label"><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:regularInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${regularInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
