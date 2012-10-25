<%@ page import="sctea.Domaine" %>



<div class="fieldcontain ${hasErrors(bean: domaineInstance, field: 'nomDomaine', 'error')} ">
	<label for="nomDomaine">
		<g:message code="domaine.nomDomaine.label" default="Nom Domaine" />
		
	</label>
	<input type="text" id="nomDomaine" name="nomDomaine" value="${fieldValue(bean:domaineInstance,field:'nomDomaine')}"/>
</div>

