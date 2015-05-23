
<%@ page import="foro.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-post" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'post.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="topic" title="${message(code: 'post.topic.label', default: 'Topic')}" />
					
						<g:sortableColumn property="itsAllowed" title="${message(code: 'post.itsAllowed.label', default: 'Its Allowed')}" />
					
						<g:sortableColumn property="lastUpdate" title="${message(code: 'post.lastUpdate.label', default: 'Last Update')}" />
					
						<th><g:message code="post.forum.label" default="Forum" /></th>
					
						<th><g:message code="post.regular.label" default="Regular" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${postInstanceList}" status="i" var="postInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${postInstance.id}">${fieldValue(bean: postInstance, field: "dateCreated")}</g:link></td>
					
						<td>${fieldValue(bean: postInstance, field: "topic")}</td>
					
						<td><g:formatBoolean boolean="${postInstance.itsAllowed}" /></td>
					
						<td><g:formatDate date="${postInstance.lastUpdate}" /></td>
					
						<td>${fieldValue(bean: postInstance, field: "forum")}</td>
					
						<td>${fieldValue(bean: postInstance, field: "regular")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${postInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
