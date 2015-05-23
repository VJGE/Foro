<%@ page import="foro.Regular" %>



<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="regular.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${regularInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="regular.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="50" required="" value="${regularInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="regular.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" min="14" value="${regularInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="regular.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${regularInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="regular.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" pattern="${regularInstance.constraints.password.matches}" required="" value="${regularInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'postViews', 'error')} required">
	<label for="postViews">
		<g:message code="regular.postViews.label" default="Post Views" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postViews" type="number" min="0" value="${regularInstance.postViews}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'strikesNumber', 'error')} required">
	<label for="strikesNumber">
		<g:message code="regular.strikesNumber.label" default="Strikes Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="strikesNumber" from="${0..3}" class="range" required="" value="${fieldValue(bean: regularInstance, field: 'strikesNumber')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'starsNumbers', 'error')} required">
	<label for="starsNumbers">
		<g:message code="regular.starsNumbers.label" default="Stars Numbers" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="starsNumbers" from="${0..5}" class="range" required="" value="${fieldValue(bean: regularInstance, field: 'starsNumbers')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: regularInstance, field: 'posts', 'error')} ">
	<label for="posts">
		<g:message code="regular.posts.label" default="Posts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regularInstance?.posts?}" var="p">
    <li><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="post" action="create" params="['regular.id': regularInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'post.label', default: 'Post')])}</g:link>
</li>
</ul>


</div>

