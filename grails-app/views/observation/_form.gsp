<%@ page import="sctea.Observation" %>



<div class="fieldcontain ${hasErrors(bean: observationInstance, field: 'eleve', 'error')} required">
	<label for="eleve">
		<g:message code="observation.eleve.label" default="Eleve" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Eleve.list()}" name="eleve.id" value="${observationInstance?.eleve?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: observationInstance, field: 'observation', 'error')} ">
	<label for="observation">
		<g:message code="observation.observation.label" default="Observation" />
		
	</label>
	<input type="text" id="observation" name="observation" value="${fieldValue(bean:observationInstance,field:'observation')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: observationInstance, field: 'rapport', 'error')} required">
	<label for="rapport">
		<g:message code="observation.rapport.label" default="Rapport" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Rapport.list()}" name="rapport.id" value="${observationInstance?.rapport?.id}" ></g:select>
</div>

