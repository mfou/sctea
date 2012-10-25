<%@ page import="sctea.Rapport" %>



<div class="fieldcontain ${hasErrors(bean: rapportInstance, field: 'classe', 'error')} required">
	<label for="classe">
		<g:message code="rapport.classe.label" default="Classe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Classe.list()}" name="classe.id" value="${rapportInstance?.classe?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: rapportInstance, field: 'eleve', 'error')} required">
	<label for="eleve">
		<g:message code="rapport.eleve.label" default="Eleve" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Eleve.list()}" name="eleve.id" value="${rapportInstance?.eleve?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: rapportInstance, field: 'evaluations', 'error')} ">
	<label for="evaluations">
		<g:message code="rapport.evaluations.label" default="Evaluations" />
		
	</label>
	
<ul>
<g:each var="e" in="${rapportInstance?.evaluations?}">
    <li><g:link controller="evaluation" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="evaluation" params="['rapport.id':rapportInstance?.id]" action="create">Add Evaluation</g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: rapportInstance, field: 'observations', 'error')} ">
	<label for="observations">
		<g:message code="rapport.observations.label" default="Observations" />
		
	</label>
	
<ul>
<g:each var="o" in="${rapportInstance?.observations?}">
    <li><g:link controller="observation" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="observation" params="['rapport.id':rapportInstance?.id]" action="create">Add Observation</g:link>

</div>

