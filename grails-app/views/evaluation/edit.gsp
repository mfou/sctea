
<%@ page import="sctea.Evaluation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Evaluation</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Evaluation List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Evaluation</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Evaluation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${evaluationInstance}">
            <div class="errors">
                <g:renderErrors bean="${evaluationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${evaluationInstance?.id}" />
                <input type="hidden" name="version" value="${evaluationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="competence">Competence:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:evaluationInstance,field:'competence','errors')}">
                                    <g:select optionKey="id" from="${sctea.Competence.list()}" name="competence.id" value="${evaluationInstance?.competence?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eleve">Eleve:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:evaluationInstance,field:'eleve','errors')}">
                                    <g:select optionKey="id" from="${sctea.Eleve.list()}" name="eleve.id" value="${evaluationInstance?.eleve?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="periode">Periode:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:evaluationInstance,field:'periode','errors')}">
                                    <g:select optionKey="id" from="${sctea.Periode.list()}" name="periode.id" value="${evaluationInstance?.periode?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rapport">Rapport:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:evaluationInstance,field:'rapport','errors')}">
                                    <g:select optionKey="id" from="${sctea.Rapport.list()}" name="rapport.id" value="${evaluationInstance?.rapport?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valeur">Valeur:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:evaluationInstance,field:'valeur','errors')}">
                                    <input type="text" id="valeur" name="valeur" value="${fieldValue(bean:evaluationInstance,field:'valeur')}" />
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
