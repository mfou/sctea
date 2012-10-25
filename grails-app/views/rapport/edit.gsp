
<%@ page import="sctea.Rapport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Rapport</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Rapport List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Rapport</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Rapport</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${rapportInstance}">
            <div class="errors">
                <g:renderErrors bean="${rapportInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${rapportInstance?.id}" />
                <input type="hidden" name="version" value="${rapportInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="classe">Classe:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rapportInstance,field:'classe','errors')}">
                                    <g:select optionKey="id" from="${sctea.Classe.list()}" name="classe.id" value="${rapportInstance?.classe?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eleve">Eleve:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rapportInstance,field:'eleve','errors')}">
                                    <g:select optionKey="id" from="${sctea.Eleve.list()}" name="eleve.id" value="${rapportInstance?.eleve?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="evaluations">Evaluations:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rapportInstance,field:'evaluations','errors')}">
                                    
<ul>
<g:each var="e" in="${rapportInstance?.evaluations?}">
    <li><g:link controller="evaluation" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="evaluation" params="['rapport.id':rapportInstance?.id]" action="create">Add Evaluation</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="observations">Observations:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rapportInstance,field:'observations','errors')}">
                                    
<ul>
<g:each var="o" in="${rapportInstance?.observations?}">
    <li><g:link controller="observation" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="observation" params="['rapport.id':rapportInstance?.id]" action="create">Add Observation</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
