<%@ page import="sctea.Ecole" %>



<div class="fieldcontain ${hasErrors(bean: ecoleInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="ecole.nom.label" default="Nom" />
		
	</label>
	<input type="text" id="nom" name="nom" value="${fieldValue(bean:ecoleInstance,field:'nom')}"/>
</div>

