
<%@ page import="foro.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-post" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list post">
			
				<g:if test="${postInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="post.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${postInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="post.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:fieldValue bean="${postInstance}" field="topic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.itsAllowed}">
				<li class="fieldcontain">
					<span id="itsAllowed-label" class="property-label"><g:message code="post.itsAllowed.label" default="Its Allowed" /></span>
					
						<span class="property-value" aria-labelledby="itsAllowed-label"><g:formatBoolean boolean="${postInstance?.itsAllowed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.lastUpdate}">
				<li class="fieldcontain">
					<span id="lastUpdate-label" class="property-label"><g:message code="post.lastUpdate.label" default="Last Update" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdate-label"><g:formatDate date="${postInstance?.lastUpdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.files}">
				<li class="fieldcontain">
					<span id="files-label" class="property-label"><g:message code="post.files.label" default="Files" /></span>
					
						<g:each in="${postInstance.files}" var="f">
						<span class="property-value" aria-labelledby="files-label"><g:link controller="file" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.forum}">
				<li class="fieldcontain">
					<span id="forum-label" class="property-label"><g:message code="post.forum.label" default="Forum" /></span>
					
						<span class="property-value" aria-labelledby="forum-label"><g:link controller="forum" action="show" id="${postInstance?.forum?.id}">${postInstance?.forum?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.regular}">
				<li class="fieldcontain">
					<span id="regular-label" class="property-label"><g:message code="post.regular.label" default="Regular" /></span>
					
						<span class="property-value" aria-labelledby="regular-label"><g:link controller="regular" action="show" id="${postInstance?.regular?.id}">${postInstance?.regular?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:postInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${postInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
