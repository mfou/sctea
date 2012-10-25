<%@ page import="sctea.Competence" %>



<div class="fieldcontain ${hasErrors(bean: competenceInstance, field: 'domaine', 'error')} required">
	<label for="domaine">
		<g:message code="competence.domaine.label" default="Domaine" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Domaine.list()}" name="domaine.id" value="${competenceInstance?.domaine?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: competenceInstance, field: 'nomCompetence', 'error')} ">
	<label for="nomCompetence">
		<g:message code="competence.nomCompetence.label" default="Nom Competence" />
		
	</label>
	<input type="text" id="nomCompetence" name="nomCompetence" value="${fieldValue(bean:competenceInstance,field:'nomCompetence')}"/>
</div>

