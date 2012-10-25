<%@ page import="sctea.Periode" %>



<div class="fieldcontain ${hasErrors(bean: periodeInstance, field: 'periode', 'error')} ">
	<label for="periode">
		<g:message code="periode.periode.label" default="Periode" />
		
	</label>
	<input type="text" id="periode" name="periode" value="${fieldValue(bean:periodeInstance,field:'periode')}"/>
</div>

