<%@ page import="sctea.Eleve" %>



<div class="fieldcontain ${hasErrors(bean: eleveInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="eleve.nom.label" default="Nom" />
		
	</label>
	<input type="text" id="nom" name="nom" value="${fieldValue(bean:eleveInstance,field:'nom')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eleveInstance, field: 'prenom', 'error')} ">
	<label for="prenom">
		<g:message code="eleve.prenom.label" default="Prenom" />
		
	</label>
	<input type="text" id="prenom" name="prenom" value="${fieldValue(bean:eleveInstance,field:'prenom')}"/>
</div>

