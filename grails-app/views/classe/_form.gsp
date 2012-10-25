<%@ page import="sctea.Classe" %>



<div class="fieldcontain ${hasErrors(bean: classeInstance, field: 'ecole', 'error')} required">
	<label for="ecole">
		<g:message code="classe.ecole.label" default="Ecole" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionKey="id" from="${sctea.Ecole.list()}" name="ecole.id" value="${classeInstance?.ecole?.id}" ></g:select>
</div>

<div class="fieldcontain ${hasErrors(bean: classeInstance, field: 'niveau', 'error')} ">
	<label for="niveau">
		<g:message code="classe.niveau.label" default="Niveau" />
		
	</label>
	<input type="text" id="niveau" name="niveau" value="${fieldValue(bean:classeInstance,field:'niveau')}"/>
</div>

