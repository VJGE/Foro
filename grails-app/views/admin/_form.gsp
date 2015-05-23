<%@ page import="foro.Admin" %>



<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="admin.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${adminInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="admin.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="50" required="" value="${adminInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="admin.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" min="14" value="${adminInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="admin.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${adminInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="admin.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" pattern="${adminInstance.constraints.password.matches}" required="" value="${adminInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="admin.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" min="1" max="5" value="${adminInstance.level}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="admin.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rating" value="${fieldValue(bean: adminInstance, field: 'rating')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'forums', 'error')} ">
	<label for="forums">
		<g:message code="admin.forums.label" default="Forums" />
		
	</label>
	<g:select name="forums" from="${foro.Forum.list()}" multiple="multiple" optionKey="id" size="5" value="${adminInstance?.forums*.id}" class="many-to-many"/>

</div>

