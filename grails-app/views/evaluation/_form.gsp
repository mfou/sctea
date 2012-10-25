<%@ page import="sctea.Evaluation" %>



<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'competence', 'error')} required">
	<label for="competence">
		<g:message code="evaluation.competence.label" default="Competence" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Competence.list()}" name="competence.id" value="${evaluationInstance?.competence?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'eleve', 'error')} required">
	<label for="eleve">
		<g:message code="evaluation.eleve.label" default="Eleve" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Eleve.list()}" name="eleve.id" value="${evaluationInstance?.eleve?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'periode', 'error')} required">
	<label for="periode">
		<g:message code="evaluation.periode.label" default="Periode" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Periode.list()}" name="periode.id" value="${evaluationInstance?.periode?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'rapport', 'error')} required">
	<label for="rapport">
		<g:message code="evaluation.rapport.label" default="Rapport" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Rapport.list()}" name="rapport.id" value="${evaluationInstance?.rapport?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluationInstance, field: 'valeur', 'error')} required">
	<label for="valeur">
		<g:message code="evaluation.valeur.label" default="Valeur" />
		<span class="required-indicator">*</span>
	</label>
	<input type="text" id="valeur" name="valeur" value="${fieldValue(bean:evaluationInstance,field:'valeur')}" />
</div>

